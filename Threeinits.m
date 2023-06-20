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

if flag == 1
    init(flag,:) = [Tudatamed(1)-ImdatamedV;ImdatamedV;1-Hydatamed(1);];
elseif flag == 2
    init(flag,:) = [Tudatamed(1)-ImdatauppV;ImdatauppV;1-Hydatamed(1);];
else
    init(flag,:) = [Tudatamed(1)-ImdatalowV;ImdatalowV;1-Hydatamed(1);];
end
    
datameds(flag,:)   = [Tudatamed,Hydatamed];
dataranges(flag,:) = [Tudataupp-Tudatalow;Hydataupp-Hydatalow]';
datasizes(flag,:)  = [numel(Tudatamed),numel(Hydatamed)];
datatimes(flag,:)  = [Tuexptimes,Hyexptimes];



%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions

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

%Fixing N calibration with T added to the I equation
% % calibratedparams(1) = 0.29;
% % calibratedparams(2) = 1.22;
% % calibratedparams(3) = 0.15;
% % calibratedparams(4) = 0.03;
% % calibratedparams(5) = 0.05;
% % calibratedparams(6) = 0.50;
% % calibratedparams(7) = 4.86;
% % 
% % Bests = calibratedparams(free);
% % save(['Bests' group '.mat'],'Bests');

% calibratedparams(1) = 0.29;%gt
calibratedparams(2) = 1.31;%ut
calibratedparams(3) = 0.38;%aV
calibratedparams(4) = 0.17;%gI
calibratedparams(5) = 0.45;%gv
calibratedparams(6) = 0.30;%ai
% calibratedparams(7) = 1;%uv


if flag == 1
    [t,x] = ode45(@rhsparams,[0 tf],init(flag,:),[],calibratedparams);    
elseif flag == 2
    [t1,x1] = ode45(@rhsparams,[0 tf],init(flag,:),[],calibratedparams);    
else
    [t2,x2] = ode45(@rhsparams,[0 tf],init(flag,:),[],calibratedparams);    
end

end

figh = figure(1);
b = subplot(1,2,1);
plot(t,x(:,2)./(x(:,2)+x(:,1)),'b',t,x(:,3),'r',t,1-x(:,3),'m','LineWidth',2);
hold
plot(t1,x1(:,2)./(x1(:,2)+x1(:,1)),'b--',t1,x1(:,3),'r--',t1,1-x1(:,3),'m--','LineWidth',2);
plot(t2,x2(:,2)./(x2(:,2)+x2(:,1)),'b--',t2,x2(:,3),'r--',t2,1-x2(:,3),'m--','LineWidth',2);
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
plot(t,x(:,1)+x(:,2),'k',t,x(:,1),'g',t,x(:,2),'b','LineWidth',2);
hold
plot(t1,x1(:,1)+x1(:,2),'k--',t1,x1(:,1),'g--',t1,x1(:,2),'b--','LineWidth',2);
plot(t2,x2(:,1)+x2(:,2),'k--',t2,x2(:,1),'g--',t2,x2(:,2),'b--','LineWidth',2);
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow', Tudataupp'-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/4 pos(3:4)*2])


TudatamedR = Rmedians*0.001;%scaled to cm^3
TudatauppR = Rquartiles(:,2)*0.001;
TudatalowR = Rquartiles(:,1)*0.001;
TuexptimesR = allexpdaysbut5;
HydatamedR = Rmedians/100;
HydatauppR = Rquartiles(:,2)/100;
HydatalowR = Rquartiles(:,1)/100;
HyexptimesR = allexpdaysbut5;



% savefig([group 'Calibrated' flag '.fig'])
% saveas(gcf,[group 'Calibrated' flag],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  