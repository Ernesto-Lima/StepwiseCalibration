%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%File for calibrating the model using the calibrated parameters for each mouse
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Initialize the workspace
% clc;
clear all
close all
set(0,'defaulttextinterpreter','latex')
% close all;
format long;

group = 'NC';

multiguesssize = 50;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

for flag = 1:3
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Biological Data

%Tumor volume
if numel(group) < 2
    load('ExpoGroupTumorVolumes.mat')
else
    load('ExpoGroupTumorVolumesV2.mat')
end
% eval(['Tudatamed = ' group 'medians*0.001;'])%scaled to cm^3
% eval(['Tudataupp = ' group 'quartiles(:,2)*0.001;'])
% eval(['Tudatalow = ' group 'quartiles(:,1)*0.001;'])
eval(['Tudatamed = ' group 'averages*0.001;'])%scaled to cm^3
eval(['Tudataupp = ' group 'maxes*0.001;'])
eval(['Tudatalow = ' group 'mins*0.001;'])
eval('Tuexptimes = allexpdaysbut5;')
%Hypoxia   
if numel(group) < 2
    load('ExpoGroupHFractions.mat')
else
    load('ExpoGroupHFractionsV2.mat')
end
% eval(['Hydatamed = ' group 'medians/100;'])
% eval(['Hydataupp = ' group 'quartiles(:,2)/100;'])
% eval(['Hydatalow = ' group 'quartiles(:,1)/100;'])
eval(['Hydatamed = ' group 'averages/100;'])
eval(['Hydataupp = ' group 'maxes/100;'])
eval(['Hydatalow = ' group 'mins/100;'])
eval(['Hyexptimes = allexperimentaldays;'])
%Immune
load('ImmuneFractions.mat')
Imdatamed = CD8medians(1)/100;
Imdataupp = CD8upper(1)/100;
Imdatalow = CD8lower(1)/100;

%Allowing the model to run as volumes instead of percentages
ImdatamedV = Imdatamed*Tudatamed(1);
ImdatauppV = Imdataupp*Tudatamed(1);
ImdatalowV = Imdatalow*Tudatamed(1);
HydatamedV = Hydatamed*Tudatamed(1);
HydatauppV = Hydataupp*Tudatamed(1);
HydatalowV = Hydatalow*Tudatamed(1);

if flag == 1
    init(flag,:) = [Tudatamed(1)*(1-Imdatamed(1));Tudatamed(1)*Imdatamed(1);Tudatamed(1)-HydatamedV(1)];
elseif flag == 2
    init(flag,:) = [Tudataupp(1)*(1-Imdatalow(1));Tudataupp(1)*Imdataupp(1);Tudataupp(1)*(1-Hydatalow(1))];
else
    init(flag,:) = [Tudatalow(1)*(1-Imdataupp(1));Tudatalow(1)*Imdatalow(1);Tudatalow(1)*(1-HydatauppV(1))];
end
    
datameds(flag,:)   = [Tudatamed,Hydatamed];
dataranges(flag,:) = [Tudataupp-Tudatalow,Hydataupp-Hydatalow];
datasizes(flag,:)  = [numel(Tudatamed),numel(Hydatamed)];
datatimes(flag,:)  = [Tuexptimes,Hyexptimes];

end

RandInits = zeros(multiguesssize,Nequations);
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandInits(nn,:) = init(3,:)+(init(2,:)-init(3,:)).*rand(1,Nequations);
end

load(['Bests' group '.mat'])

if strcmp(group,'NC')
    params = [0.30, 0.56, 2.00, 0.54, 0.00, 0.50, 0.22, 0.8, 0];
    which    = [1, 1, 1, 1, 1, 1, 1, 0, 0];
elseif strcmp(group,'RC')
    params = [0.30, 0.56, 2.00, 0.54, 0.00, 0.50, 0.22, 0.8, 0];
    which    = [0, 1, 0, 0, 0, 0, 1, 0, 0];
    which    = [0, 1, 1, 1, 1, 1, 1, 0, 0];
elseif strcmp(group,'NT')
    params = [0.30, 0.56, 2.00, 0.54, 0.00, 0.50, 0.22, 0.8, 1];
    which    = [0, 0, 0, 0, 0, 1, 1, 1, 1];
elseif strcmp(group,'RT')
    params = [0.30, 0.56, 2.00, 0.54, 0.00, 0.50, 0.22, 0.8, 1];
    which    = [0, 0, 0, 0, 0, 1, 1, 1, 1];
end
free = find(which == 1);%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','r','D'};    

%NC
calibratedparams(1) = 0.30;%gt
calibratedparams(2) = 0.56;%ut
calibratedparams(3) = 2.00;%av
calibratedparams(4) = 0.54;%gi
calibratedparams(5) = 0.001;%0.00;%gv
calibratedparams(6) = 0.50;%ai
calibratedparams(7) = 0.22;%uv

%RC
% calibratedparams(1) = 0.30;%gt
% calibratedparams(2) = 1.76;%ut **
% calibratedparams(3) = 2.00;%av
% calibratedparams(4) = 0.54;%gi
% calibratedparams(5) = 0.001;%0.00;%gv
% calibratedparams(6) = 0.50;%ai
% calibratedparams(7) = 0.22;%uv

%NT evade immune vs aggressive
% calibratedparams(1) = 0.30;%gt
% calibratedparams(2) = 0.06;%0.56;%ut
% calibratedparams(3) = 2.00;%av
% calibratedparams(4) = 1.08;%0.54;%gi
% calibratedparams(5) = 0.10;%0.00;%gv
% calibratedparams(6) = 0.50;%1.67;%ai **
% calibratedparams(7) = 1.78;%3.78;%uv **
% calibratedparams(8) = 0.10;%r **
% calibratedparams(9) = 0.20;%1.02;%D **

%RT
% calibratedparams(1) = 0.30;%gt
% calibratedparams(2) = 0.56;%ut
% calibratedparams(3) = 2.00;%av
% calibratedparams(4) = 0.54;%gi
% calibratedparams(5) = 0.50;%gv <- changes vascular dynamics
% calibratedparams(6) = 0.50;%ai
% calibratedparams(7) = 0.22;%uv
% calibratedparams(8) = 0.10;%r **
% calibratedparams(9) = 1.49;%D **

t1 = 0:0.1:20;
OutputPointsT = zeros(multiguesssize,numel(t1));
OutputPointsI = zeros(multiguesssize,numel(t1));
OutputPointsV = zeros(multiguesssize,numel(t1));
for jj = 1:multiguesssize
    [t,x] = ode45(@rhsparamsV2,[0 tf],RandInits(jj,:),[],calibratedparams);    
    OutputPointsT(jj,:) = interp1(t,x(:,1),t1,'pchip');
    OutputPointsI(jj,:) = interp1(t,x(:,2),t1,'pchip');
    OutputPointsV(jj,:) = interp1(t,x(:,3),t1,'pchip');
end
outTstd = std(OutputPointsT,[],1);
outIstd = std(OutputPointsI,[],1);
outVstd = std(OutputPointsV,[],1);

tval = tinv(0.95,multiguesssize-1); 

CIt = tval*(outTstd/sqrt(multiguesssize));
CIi = tval*(outIstd/sqrt(multiguesssize));
CIv = tval*(outVstd/sqrt(multiguesssize));

% CIt = outTstd;
% CIi = outIstd;
% CIv = outVstd;
% 
% CIt = (max(OutputPointsT,[],1)-min(OutputPointsT,[],1))/2;
% CIi = (max(OutputPointsI,[],1)-min(OutputPointsI,[],1))/2;
% CIv = (max(OutputPointsV,[],1)-min(OutputPointsV,[],1))/2;

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
[t,x] = ode45(@rhsparamsV2,[0 tf],init(1,:),[],calibratedparams);    
T = interp1(t,x(:,1),t1,'pchip');
I = interp1(t,x(:,2),t1,'pchip');
V = interp1(t,x(:,3),t1,'pchip');

figh = figure(1);
b = subplot(1,2,1);
plot(t1,I./(I+T),'b',t1,V./(I+T),'r',t1,1-V./(I+T),'m','LineWidth',2);
hold
plot(t1,(I+CIi)./(I+T),'b--',t1,(V+CIv)./(I+T),'r--',t1,1-(V-CIv)./(I+T),'m--','LineWidth',2);
plot(t1,(I-CIi)./(I+T),'b--',t1,(V-CIv)./(I+T),'r--',t1,1-(V+CIv)./(I+T),'m--','LineWidth',2);
%Plotting corresponding data and error bars
errorbar(0, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
plot(0:20,0.3*ones(size([0:20])),'k--')
plot(0:20,0.5*ones(size([0:20])),'k--')
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t1,T+I,'k',t1,T,'g',t1,I,'b','LineWidth',2);
hold
plot(t1,T+I+CIi+CIt,'k--',t1,T+CIt,'g--',t1,I+CIi,'b--','LineWidth',2);
plot(t1,T+I-(CIi+CIt),'k--',t1,T-CIt,'g--',t1,I-CIi,'b--','LineWidth',2);
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

% 
savefig([group 'Calibrated.fig'])
saveas(gcf,[group 'Calibrated'],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  