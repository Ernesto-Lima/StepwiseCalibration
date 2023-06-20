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

group = 'R';
multiguesssize = 50;


%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

for flag = 1:3
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Biological Data

%Tumor volume
load('ExpoGroupTumorVolumes.mat')
eval(['Tudatamed = ' group 'medians*0.001;'])%scaled to cm^3
eval(['Tudataupp = ' group 'quartiles(:,2)*0.001;'])
eval(['Tudatalow = ' group 'quartiles(:,1)*0.001;'])
eval('Tuexptimes = allexpdaysbut5;')
%Hypoxia   
load('ExpoGroupHFractions.mat')
eval(['Hydatamed = ' group 'medians/100;'])
eval(['Hydataupp = ' group 'quartiles(:,2)/100;'])
eval(['Hydatalow = ' group 'quartiles(:,1)/100;'])
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
%     init(flag,:) = [Tudatamed(1)-ImdatamedV;ImdatamedV;1-Hydatamed(1);];
    init(flag,:) = [Tudatamed(1)*(1-Imdatamed(1));Tudatamed(1)*Imdatamed(1);Tudatamed(1)-HydatamedV(1)];
elseif flag == 2
%     init(flag,:) = [Tudataupp(1)-ImdatalowV;ImdatauppV;1-Hydatalow(1);];
    init(flag,:) = [Tudataupp(1)*(1-Imdatalow(1));Tudataupp(1)*Imdataupp(1);Tudataupp(1)*(1-Hydatalow(1))];
else
%     init(flag,:) = [Tudatalow(1)-ImdatauppV;ImdatalowV;1-Hydataupp(1);];
    init(flag,:) = [Tudatalow(1)*(1-Imdataupp(1));Tudatalow(1)*Imdatalow(1);Tudatalow(1)*(1-HydatauppV(1))];
end
    
datameds(flag,:)   = [Tudatamed,Hydatamed];
dataranges(flag,:) = [Tudataupp-Tudatalow;Hydataupp-Hydatalow]';
datasizes(flag,:)  = [numel(Tudatamed),numel(Hydatamed)];
datatimes(flag,:)  = [Tuexptimes,Hyexptimes];

end

RandInits = zeros(multiguesssize,Nequations);
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandInits(nn,:) = init(3,:)+(init(2,:)-init(3,:)).*rand(1,Nequations);
end


load(['BestsN.mat'])

params = [0.25  1  0.01 0.01 0.03 0.2 5.7 0.33 0.607 0.11];%N

params(end+1) = 0;

which  = [1, 1, 1, 1, 1, 1, 1, 0, 0, 0];
free = find(which == 1);%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r','D'};    

% %Fixing N calibration without adding T to I equation
% % calibratedparams(1) = 0.29;
% % calibratedparams(2) = 1.2;%0.40;
% % calibratedparams(3) = 0.01;%0.05;
% % calibratedparams(4) = 0.08;
% % calibratedparams(5) = 0.01;
% % calibratedparams(6) = 0.50;
% % calibratedparams(7) = 4.86;

% % %Fixing N calibration with T added to the I equation
% % calibratedparams(1) = 0.29;
% % calibratedparams(2) = 2.19;
% % calibratedparams(3) = 0.10;
% % calibratedparams(4) = 0.01;
% % calibratedparams(5) = 0.14;
% % calibratedparams(6) = 0.00;
% % calibratedparams(7) = 4.84;

% % %Fixing N calibration with T added to the I equation and removing I 
% % calibratedparams(1) = 0.29;
% % calibratedparams(2) = 2.32;
% % calibratedparams(3) = 0.12;
% % calibratedparams(4) = 0.05;
% % calibratedparams(5) = 0.14;
% % calibratedparams(6) = 0.06;
% % calibratedparams(7) = 4.84;
% % 
% % Bests = calibratedparams(free);
% % save(['Bests' group '.mat'],'Bests');

% % % calibratedparams(1) = 0.29;%gt
% calibratedparams(2) = 2.73;%2.32;%ut
% calibratedparams(3) = 2.42;%0.12;%aV
% calibratedparams(4) = 0.78;%0.05;%gI
% calibratedparams(5) = 0.58;%0.14;%gv
% calibratedparams(6) = 3.02;%0.06;%ai
% % % calibratedparams(7) = 4.84;%uv
% 
% calibratedparams(1) = 0.20;%gt
% calibratedparams(2) = 2.32;%2.32;%ut
% calibratedparams(3) = 0.12;%0.12;%aV
% calibratedparams(4) = 0.05;%0.05;%gI
% calibratedparams(5) = 0.14;%0.14;%gv
% calibratedparams(6) = 0.06;%0.06;%ai
% calibratedparams(7) = 1.40;%uv

calibratedparams(2) = 6;%2.32;%ut
% calibratedparams(3) = 2.42;%0.12;%aV
% calibratedparams(4) = 0.78;%0.05;%gI
calibratedparams(5) = 0.7;%0.14;%gv
% calibratedparams(6) = 3.02;%0.06;%ai


t1 = 0:0.1:20;
OutputPointsT = zeros(multiguesssize,numel(t1));
OutputPointsI = zeros(multiguesssize,numel(t1));
OutputPointsV = zeros(multiguesssize,numel(t1));
for jj = 1:multiguesssize
    [t,x] = ode45(@rhsparams,[0 tf],RandInits(jj,:),[],calibratedparams);    
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

CIt = (max(OutputPointsT,[],1)-min(OutputPointsT,[],1))/2;
CIi = (max(OutputPointsI,[],1)-min(OutputPointsI,[],1))/2;
CIv = (max(OutputPointsV,[],1)-min(OutputPointsV,[],1))/2;

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
[t,x] = ode45(@rhsparams,[0 tf],init(1,:),[],calibratedparams);    
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
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow', Hydataupp'-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
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
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow', Tudataupp'-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

% 
% savefig([group 'Calibrated' flag '.fig'])
% saveas(gcf,[group 'Calibrated' flag],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  