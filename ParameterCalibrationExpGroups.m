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

multiguesssize = 100;
flag = 1;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

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
%     init = [Tudatamed(1)-ImdatamedV;ImdatamedV;1-Hydatamed(1)];
    init = [Tudatamed(1)-ImdatamedV;ImdatamedV;Tudatamed(1)-HydatamedV(1)];
elseif flag == 2
%     init = [Tudatamed(1)-ImdatauppV;ImdatauppV;1-Hydatamed(1)];
    init = [Tudatamed(1)-ImdatauppV;ImdatauppV;Tudatamed(1)-HydatamedV(1)];
else
%     init = [Tudatamed(1)-ImdatalowV;ImdatalowV;1-Hydatamed(1)];
    init = [Tudatamed(1)-ImdatalowV;ImdatalowV;Tudatamed(1)-HydatamedV(1)];
end
    
datameds   = [Tudatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow;Hydataupp-Hydatalow]';
datasizes  = [numel(Tudatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Hyexptimes];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Parameters: 
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
% params =    [0.21  1e-3  0.02  0.02  0.02  0.02   8     1     1   0.1 ]; %R
% params = [0.25  1  0.01 0.01 0.03 0.2 5.7 0.33 0.607 0.11];%N
%fixing to the N params
params = [0.29,   2.32,   0.12,   0.05,   0.14,   0.06, 4.84, 1,1,0.1 ];

params(end+1) = 0;

% which  = [1, 1, 1, 1, 1, 1, 1, 0, 0, 0];
which    = [1, 1, 1, 1, 1, 1, 1, 0, 0, 0];
which    = [1, 0, 0, 0, 0, 0, 1, 0, 0, 0];
free = find(which == 1);
    
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r','D'};    
% lower  =    [0.2    0.5     0     0    0     0     0      0    0    0.07 0];
lower  =    [0.2    2.32   0.12  0.05  0.14   0.06     0      0    0    0.07 0];
% upper  =    [0.3    5     0.1   0.1   .5     5    5     1    1    0.14 0];
upper  =    [0.3    10     0.5   0.5   .5     5    5     1    1    0.14 0];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Setting up muliple initial guesses for calibration

RandNums = zeros(multiguesssize,numel(params));
for nn = 1:multiguesssize
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandNums(nn,:) = lower+(upper-lower).*rand(1,numel(params));
end

Guesses = zeros(multiguesssize,numel(free));
errors = zeros(1,multiguesssize);
for yy = 1:multiguesssize
    yy
    params1 = RandNums(yy,:);
    options = optimoptions('fmincon');
%     options.OptimalityTolerance = 1.0000e-10;
%     options.ConstraintTolerance = 1.0000e-10;
%     options.Display = 'iter';
    [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifunG(p,init,tf,...
        free,params1,datameds,dataranges,datatimes,datasizes),...
        params1(free),[],[],[],[],lower(free),upper(free),[],options);
    Guesses(yy,1:numel(free)) = control;
    errors(yy) = FVAL;
end

save(['Guesses' group '.mat'],'Guesses')
save(['Errors' group '.mat'],'errors')

mean(Guesses)

Bests = zeros(size(params1,2));
z = find(errors==min(errors));
Bests = Guesses(z(1),:);
Bests'
min(errors)

save(['Bests' group '.mat'],'Bests');

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
clear x t
%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;

[t,x] = ode45(@rhsparams,[0 tf],init,[],calibratedparams);    

figh = figure(1);
b = subplot(1,2,1);
plot(t,x(:,2)./(x(:,2)+x(:,1)),'b',t,x(:,3)./(x(:,2)+x(:,1)),'r',t,1-x(:,3)./(x(:,2)+x(:,1)),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(0, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow', Hydataupp'-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1)+x(:,2),'k',t,x(:,1),'g',t,x(:,2),'b','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow', Tudataupp'-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

% OutputPointsT = interp1(t,x(:,1),datatimes(1:datasizes(1)),'pchip');
%     OutputPointsTV = interp1(t,x(:,1),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPointsI = interp1(t,x(:,2),datatimes(1:datasizes(1)),'pchip');
%     OutputPointsV = interp1(t,x(:,3),datatimes(datasizes(1)+1:datasizes(1)+datasizes(2)),'pchip');
%     OutputPoints = [OutputPointsT+OutputPointsI,(1-OutputPointsV)];
% %     OutputPoints = [OutputPointsT+OutputPointsI,(1-OutputPointsV).*OutputPointsTV];
% %     datameds(datasizes(1)+1:datasizes(1)+datasizes(2)) = ...
% %         datameds(datasizes(1)+1:datasizes(1)+datasizes(2)).*OutputPointsTV;
% %     dataranges(datasizes(1)+1:datasizes(1)+datasizes(2)) = ...
% %         dataranges(datasizes(1)+1:datasizes(1)+datasizes(2)).*OutputPointsTV;
%     diff = abs(OutputPoints - datameds);
%     diff = diff./dataranges';    
%     err = norm(diff)



% savefig([group 'Calibrated' flag '.fig'])
% saveas(gcf,[group 'Calibrated' flag],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  