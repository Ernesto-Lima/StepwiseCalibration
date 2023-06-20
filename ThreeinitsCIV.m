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

group = 'NT';

whichcells = 'M';

multiguesssize = 50;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

for flag = 1:3
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Biological Data

%Tumor volume
if strcmp(whichcells,'M')
    load('ExpoGroupTumorVolumesCRN.mat')
else
    load('TumorVolumese.mat')    
end
eval(['Tudatamed = ' group 'averages*0.001;'])%scaled to cm^3
eval(['Tudataupp = ' group 'maxes*0.001;'])
eval(['Tudatalow = ' group 'mins*0.001;'])
%Hypoxia
if strcmp(whichcells,'M')
    load('ExpoGroupHFractionsCRN.mat')
    eval('Tuexptimes = allexpdaysbut5;')
    eval('Tuexptimes = allexpdaysbut5;')
else
    load('HypoxicFractionse.mat') 
    eval('Tuexptimes = allexpdays;')
    eval('Tuexptimes = allexpdays;')
end
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
    init(flag,:) = [Tudatamed(1)-ImdatamedV(1);ImdatamedV(1);Tudatamed(1)-HydatamedV(1)];
elseif flag == 2
    init(flag,:) = [Tudataupp(1)-ImdatalowV(1);ImdatauppV(1);Tudataupp(1)*(1-Hydatalow(1))];
else
    init(flag,:) = [Tudatalow(1)-ImdatauppV(1);ImdatalowV(1);Tudatalow(1)*(1-Hydataupp(1))];
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

% load(['Bests' group '.mat'])
% .  params = g_C   u_C   g_I   a_V   b_I   g_V   a_I   u_V   b_V   D   r
if strcmp(group,'NC')
    params = [0.30, 2.70, 0.25,0.75, 0.21, 0.00, 0.00, 1.76, 0.00, 0.00, 0.10];
elseif strcmp(group,'NT')
    %     params = [0.30, 2.70, 0.25,0.75, 0.21, 0.05, 0.00, 1.76, 0.00, 0.00, 0.10]; %controls
    params = [0.30, 0.56, 0.54,0.10, 1.31, 0.05, 0.00, 1.76, 0.00, 2.89, 0.10];
    params = [0.30, 0.56, 0.11,0.10, 0.21, 0.05, 0.00, 1.76, 0.00, 2.89, 0.10];
    params = [0.30, 0.07, 0.54,0.10, 0.21, 0.05, 0.00, 1.76, 0.00, 2.19, 0.10];
%     params = [0.30, 1.50, 0.00,0.56, 0.21, 0.05, 0.00, 1.76, 0.00, 0.03, 0.10];
elseif strcmp(group,'RT')
%     params = [0.30, 2.70, 0.25,0.75, 0.21, 0.35, 0.00, 1.76, 0.00, 0.00, 0.10];
    params = [0.30, 0.56, 0.54,0.10, 0.21, 0.35, 0.00, 1.76, 0.00, 2.89, 0.10];
elseif strcmp(group,'C')
    params = [0.25, 2.47, 0.55, 0.16, 0.81, 0.36, 0.00, 3.28, 0.00, 0.00, 0.10];
elseif strcmp(group,'T')
    params = [0.25, 9.89, 1.88, 0.49, 0.81, 0.07, 0.00, 3.28, 0.00, 0.21, 0.07];
end

% free = find(which == 1);%Defining parameters
calibratedparams = params;
% calibratedparams(free) = Bests;
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','r','D'};    

% %NC
% calibratedparams(1) = 0.30;%gt
% calibratedparams(2) = 0.56;%ut
% calibratedparams(3) = 0.54;%gi
% calibratedparams(4) = 2.00;%av
% calibratedparams(5) = 0.05;%0.00;%gv
% calibratedparams(6) = 0.50;%ai
% calibratedparams(7) = 0.22;%uv

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
OutputPointsC = zeros(multiguesssize,numel(t1));
OutputPointsI = zeros(multiguesssize,numel(t1));
OutputPointsV = zeros(multiguesssize,numel(t1));
for jj = 1:multiguesssize
    [t,x] = ode45(@rhsparamsCIV,[0 tf],RandInits(jj,:),[],calibratedparams);    
    OutputPointsC(jj,:) = interp1(t,x(:,1),t1,'pchip');
    OutputPointsI(jj,:) = interp1(t,x(:,2),t1,'pchip');
    OutputPointsV(jj,:) = interp1(t,x(:,3),t1,'pchip');
end
outCstd = std(OutputPointsC,[],1);
outIstd = std(OutputPointsI,[],1);
outVstd = std(OutputPointsV,[],1);

tval = tinv(0.95,multiguesssize-1); 

% CIt = tval*(outTstd/sqrt(multiguesssize));
% CIi = tval*(outIstd/sqrt(multiguesssize));
% CIv = tval*(outVstd/sqrt(multiguesssize));

CIc = outCstd;
CIi = outIstd;
CIv = outVstd;
% 
% CIt = (max(OutputPointsT,[],1)-min(OutputPointsT,[],1))/2;
% CIi = (max(OutputPointsI,[],1)-min(OutputPointsI,[],1))/2;
% CIv = (max(OutputPointsV,[],1)-min(OutputPointsV,[],1))/2;

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
[t,x] = ode45(@rhsparamsCIV,[0 tf],init(1,:),[],calibratedparams);    
C = interp1(t,x(:,1),t1,'pchip');
I = interp1(t,x(:,2),t1,'pchip');
V = interp1(t,x(:,3),t1,'pchip');

figh = figure(1);
b = subplot(1,2,1);
plot(t1,I./(I+C),'b',t1,V./(I+C),'r',t1,1-V./(I+C),'m','LineWidth',2);
hold
plot(t1,(I+CIi)./(I+C),'b--',t1,(V+CIv)./(I+C),'r--',t1,1-(V-CIv)./(I+C),'m--','LineWidth',2);
plot(t1,(I-CIi)./(I+C),'b--',t1,(V-CIv)./(I+C),'r--',t1,1-(V+CIv)./(I+C),'m--','LineWidth',2);
%Plotting corresponding data and error bars
errorbar(0, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
plot(0:20,0.3*ones(size([0:20])),'k--')
plot(0:20,0.5*ones(size([0:20])),'k--')
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
% legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t1,C+I,'k',t1,C,'g',t1,I,'b','LineWidth',2);
hold
plot(t1,C+I+CIi+CIc,'k--',t1,C+CIc,'g--',t1,I+CIi,'b--','LineWidth',2);
plot(t1,C+I-(CIi+CIc),'k--',t1,C-CIc,'g--',t1,I-CIi,'b--','LineWidth',2);
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
% legend('Total tumor','Tumor cells','Immune Response','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

 
savefig([group 'CalibratedCIV' whichcells '.fig'])
saveas(gcf,[group 'CalibratedCIV' whichcells],'png');  

fitfunV2(t,x,datameds(1,:),dataranges(1,:),datatimes(1,:),datasizes(1,:))


%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  