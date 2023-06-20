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

mouse = 'RC1';
% NC1-3
% NT1-4
% RC1-2
% RT1-4

%Assign flag zero for controls or one for treated
treated = 0;

multiguesssize = 10;

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
eval(['Tudatamed = ' mouse '(2,:)*0.001;'])%scaled to cm^3
eval(['Tudataupp = ' mouse '(2,:)*0.001*' num2str(1+PercentError) ';'])
eval(['Tudatalow = ' mouse '(2,:)*0.001*' num2str(1-PercentError) ';'])
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

init = [Tudatamed(1);Imdatamed(1);1-Hydatamed(1);];
initV = [Tudatamed(1);ImdatamedV(1);Tudatamed(1)-HydatamedV(1);];
initspecial = [Tudatamed(1)-ImdatamedV(1);ImdatamedV(1);1-Hydatamed(1);];

datameds   = [Tudatamed,Imdatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow,Imdataupp-Imdatalow,Hydataupp-Hydatalow];
datasizes  = [numel(Tudatamed),numel(Imdatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Imexptimes,Hyexptimes];

datamedsV   = [Tudatamed,ImdatamedV,HydatamedV];
datarangesV = [Tudataupp-Tudatalow,ImdatauppV-ImdatalowV,HydatauppV-HydatalowV];
datasizesV  = [numel(Tudatamed),numel(ImdatamedV),numel(HydatamedV)];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Parameters: 
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
% params =   [0.2   1000e-3  0.002   0.001 0.002 0.2   0.4e-3   1     1   0.1 ]; %R
% params =   [0.2   1e-3  0.002 0.0001 0.002 0.2 0.04e-3   1     1   0.1 ]; %R
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
% params =    [0.21  1e-3  0.02  0.02  0.02  0.02   8     1     1   0.1 ]; %R
params = [0.2 1e-8  0.0015 0.0005 0.03 0.003 3.877 0.33 0.607 0.11];%NC
% params =   [0.23 1e-8  0.8 0.8 0.00001 0.2 2   1     1   0.1 ]; %N

if treated == 0
    params(end+1) = 0;
else
    params(end+1) = 0.3; %mg
end


which  = ones(size(params));%[1,  1];
free = find(which == 1);
    
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r','D'};    
lower  =    [0.2      0     0     0    0     0     0       0     0    0.07  0];
% upper  =    [0.30   5e-3   .01    .01   .01    .01    10     1    1    0.14  0];%NC
% upper  =    [0.22   1     .02   .02    .1    .1    10     1    1    0.14 1];%Controls
upper  =    [0.3   10     .5   .5    .5    .5    10     1    1    0.14 1];%Controls
% upper  =    [0.5   1.5   0.2   0.2     2    1    10     1    1    0.14  0.5];%RC


%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Setting up muliple initial guesses for calibration


RandNums = zeros(multiguesssize,numel(params));
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandNums(nn,:) = lower+(upper-lower).*rand(1,numel(params));
end

Guesses = zeros(multiguesssize,numel(params));
errors = zeros(1,multiguesssize);
for yy = 1:multiguesssize
    yy
    params = RandNums(yy,:);
    options = optimoptions('fmincon');
%     options.OptimalityTolerance = 1.0000e-10;
%     options.ConstraintTolerance = 1.0000e-10;
%     options.Display = 'iter';
%     [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifun(p,init,tf,free,params,datameds,dataranges,datatimes,datasizes),params(free),[],[],[],[],lower(free),upper(free),[],options);
%     [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifun(p,initV,tf,free,params,datameds,dataranges,datatimes,datasizes),params(free),[],[],[],[],lower(free),upper(free),[],options);
%     [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifun(p,initV,tf,free,params,datamedsV,datarangesV,datatimes,datasizesV),params(free),[],[],[],[],lower(free),upper(free),[],options);
    [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifun(p,initspecial,tf,free,params,datameds,dataranges,datatimes,datasizes),params(free),[],[],[],[],lower(free),upper(free),[],options);
    Guesses(yy,1:numel(params)) = control;
    errors(yy) = FVAL;
end

save(['Guesses' mouse '.mat'],'Guesses')
save(['Errors' mouse '.mat'],'errors')

mean(Guesses)

Bests = zeros(size(params,2));
z = find(errors==min(errors));
Bests = Guesses(z(1),:);
Bests'
min(errors)

save(['Bests' mouse '.mat'],'Bests');

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making

%Clearing variables and setting initial conditions
clear x t
%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r','D'};    
% calibratedparams(3) = 0.07;
calibratedparams(7) = 4;
calibratedparams(1) = 0.22;
% calibratedparams(1) = 0.4;
% calibratedparams(2) = 1.2;
% calibratedparams(3) = 0.2;
% calibratedparams(6) = 0.2;
% calibratedparams(4) = 0.15;

% [t,x] = ode45(@rhsparams,[0 tf],initV,[],calibratedparams);   
[t,x] = ode45(@rhsparams,[0 tf],initspecial,[],calibratedparams);   

% figure;
% b = subplot(1,2,1);
% plot(t,x(:,2),'b',t,x(:,3),'r',t,x(:,1)-x(:,3),'m','LineWidth',2);
% hold
% %Plotting corresponding data and error bars
% errorbar(Imexptimes, ImdatamedV, ImdatamedV-ImdatalowV, ImdatauppV-ImdatamedV, 'bo','MarkerFaceColor','b','LineWidth',2)
% errorbar(Hyexptimes, HydatamedV, HydatamedV-HydatalowV, HydatauppV-HydatamedV, 'mo','MarkerFaceColor','m','LineWidth',2)
% xlim([0 tf/2])
% xlabel('Time in Days','FontSize',20);
% ylabel('Volume of tumor ($cm^3$)','FontSize',20);
% legend('Immune Response','Vasculature','Hypoxia','Location','Best')
% set(b,'FontName','Times New Roman','FontSize',20);
% 
% b = subplot(1,2,2);
% plot(t,x(:,1),'k','LineWidth',2);
% hold
% errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
% xlabel('Time in Days','FontSize',20);
% ylabel('Tumor Volume ($cm^3$)','FontSize',20);
% set(b,'FontName','Times New Roman','FontSize',20);
% xlim([0 tf])
% 
% savefig([mouse 'CalibratedVolumes.fig'])
% saveas(gcf,[mouse 'CalibratedVolumes'],'png');  

figure;
b = subplot(1,2,1);
% plot(t,x(:,2)./x(:,1),'b',t,x(:,3)./x(:,1),'r',t,1-(x(:,3)./x(:,1)),'m','LineWidth',2);
plot(t,x(:,2)./(x(:,2)+x(:,1)),'b',t,x(:,3),'r',t,1-x(:,3),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Imexptimes, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1)+x(:,2),'k',t,x(:,1),'g',t,x(:,2),'b','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

savefig([mouse 'CalibratedFractions.fig'])
saveas(gcf,[mouse 'CalibratedFractions'],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  