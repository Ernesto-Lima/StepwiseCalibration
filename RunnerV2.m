%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%File for running the model using the calibrated parameters for each mouse
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Initialize the workspace
clc;
clear all;
set(0,'defaulttextinterpreter','latex')
close all;
format long;

mouse = 'NC1';
%Assign flag zero for controls or one for treated
treated = 0;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Biological Data

load('ImmuneFractions.mat')
if treated == 0
    Imdatamed = CD8medians/100;
    Imdataupp = CD8upper/100;
    Imdatalow = CD8lower/100;
    Imexptimes = immunedays;
else
    Imdatamed = [CD8medians(1),TCD8medians]/100;
    Imdataupp = [CD8upper(1),TCD8upper]/100;
    Imdatalow = [CD8lower(1),TCD8lower]/100;
    Imexptimes = [immunedays,immunedays(end)+3];
end
%Tumor volume
load('IndividualMouseTumorVolumes.mat')
eval(['Tudatamed = ' mouse '(2,:)*0.001;'])
eval(['Tudataupp = ' mouse '(2,:)*' num2str(1+PercentError) '*0.001;'])
eval(['Tudatalow = ' mouse '(2,:)*' num2str(1-PercentError) '*0.001;'])
eval(['Tuexptimes = ' mouse '(1,:);'])
%Hypoxia   
load('HypoxicFractions.mat')
eval(['Hydatamed = ' mouse '(2,:)/100;'])
eval(['Hydataupp = ' mouse '(4,:)/100;'])
eval(['Hydatalow = ' mouse '(3,:)/100;'])
eval(['Hyexptimes = ' mouse '(1,:);'])

%Allowing the model to run as volumes instead of percentages
TpointsforI = interp1(Tuexptimes,Tudatamed,Imexptimes,'pchip');
TpointsforH = interp1(Tuexptimes,Tudatamed,Hyexptimes,'pchip');
ImdatamedV = Imdatamed.*TpointsforI;
HydatamedV = Hydatamed.*TpointsforH;
ImdatauppV = Imdataupp.*TpointsforI;
ImdatalowV = Imdatalow.*TpointsforI;
HydatauppV = Hydataupp.*TpointsforH;
HydatalowV = Hydatalow.*TpointsforH;


%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Assigning parameter values
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
% params =   [0.2   1000e-3  0.002   0.001 0.002 0.2   0.4e-3   1     1   0.1 ]; %R
% params =   [0.2   1e-3  0.002 0.0001 0.002 0.2 0.04e-3   1     1   0.1 ]; %R
% params =   [0.23   0  0.8 0.8 0.00001 0.2 2   1     1   0.1 ]; %N

load(['Bests' mouse]);
params = Bests;

% if treated == 0
%     params(end+1) = 0;
% else
%     params(end+1) = 0.3; %mg
% end

%Loading calibrated parameter values    
% if flag == 0
%     load('ControloptimizedPs.txt')
%     params = ControloptimizedPs';
%     Iave = ControloptimizedPs(end);    
% elseif flag == 1
%     load('TreatedoptimizedPs.txt')
%     params = TreatedoptimizedPs';
%     Iave = TreatedoptimizedPs(end);
% end 

 %Vector of data means for initial conditions
%  init = [Tdatamed;Iguess;1-Hmed(1);];
%  init = [Tudatamed(1);Imdatamed(1);1-Hydatamed(1);];
 init = [Tudatamed(1);ImdatamedV(1);Tudatamed(1)-HydatamedV(1);];
%  init = [Tudatamed(1);0.05;1-0.2;];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Run model 
[t,x] = ode45(@rhsparams,[0 tf],init,[],params);   

figure;
b = subplot(1,2,1);
% plot(t,x(:,2),'b',t,x(:,3),'r',t,1-x(:,3),'m','LineWidth',2);
plot(t,x(:,2),'b',t,x(:,3),'r',t,x(:,1)-x(:,3),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Imexptimes, ImdatamedV, ImdatamedV-ImdatalowV, ImdatauppV-ImdatamedV, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, HydatamedV, HydatamedV-HydatalowV, HydatauppV-HydatamedV, 'mo','MarkerFaceColor','m','LineWidth',2)
xlim([0 10])
xlabel('Time in Days','FontSize',20);
ylabel('Volume of tumor ($cm^3$)','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1),'k','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 20])

set(gcf,'NextPlot','add');
axes;

h = title({['Mouse ' mouse ' simulations with experimental data'];' '},'FontSize',20);
set(gca,'Visible','off'); 
set(h,'Visible','on');
%     savefig('ControlCalibratedValidate.fig')
%     saveas(gcf,'ControlCalibratedValidate','png');    
   


figure;
b = subplot(1,2,1);
plot(t,x(:,2)./x(:,1),'b',t,x(:,3)./x(:,1),'r',t,1-x(:,3)./x(:,1),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Imexptimes, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 10 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1),'k','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 20])

set(gcf,'NextPlot','add');
axes;

h = title({['Mouse ' mouse ' simulations with experimental data'];' '},'FontSize',20);
set(gca,'Visible','off'); 
set(h,'Visible','on');

% beep
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file