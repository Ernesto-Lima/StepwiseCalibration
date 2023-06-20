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

%groups are RC, RT, NC, NT
group = 'RT';

multiguesssize = 100;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

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


init = [Tudatamed(1)-ImdatamedV;ImdatamedV;Tudatamed(1)-HydatamedV(1)];

datameds   = [Tudatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow,Hydataupp-Hydatalow];
dataranges(dataranges==0) = 1;
datasizes  = [numel(Tudatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Hyexptimes];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Parameters: 
% params =   {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','r','D'};
if strcmp(group,'NC') || strcmp(group,'RC')
    params = [0.30, 0.56, 2.00, 0.54, 0.00, 0.50, 0.22, 0.8, 0];
elseif strcmp(group,'NT')
    params = [0.30, 2.30, 0.10,  0,  0,   0.01, 0.06, 0.8, 0.0001];
elseif strcmp(group,'RT')
    params = [0.30, 2.30, 0.10,  0,  0,   0.01, 0.06, 0.8, 0.0001];
end
%'g_T','u_T','a_V','g_I','g_V','a_I','u_V','r','D'
if strcmp(group,'NC')
    which    = [1, 1, 1, 1, 1, 1, 1, 0, 0];
elseif strcmp(group,'RC')
    which    = [0, 1, 1, 1, 1, 1, 1, 0, 0];
elseif strcmp(group,'NT')
    which    = [0, 0, 0, 0, 0, 1, 1, 1, 1];
elseif strcmp(group,'RT')
    which    = [0, 0, 0, 0, 0, 1, 1, 1, 1];
end
free = find(which == 1);
    
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','r','D'};  
lower  =    [0.2    0.1     0     0    0     0     0   0.07 0];
if strcmp(group,'NC') || strcmp(group,'RC')
    upper  = [0.3    5     5     5   .5     5    5    0.14  0];
else
    upper  = [0.3    5     5     5   .5     5    5    0.14  5];
end

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
    [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifunGV2(p,init,tf,...
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

[t,x] = ode45(@rhsparamsV2,[0 tf],init,[],calibratedparams);    

figh = figure(1);
b = subplot(1,2,1);
plot(t,x(:,2)./(x(:,2)+x(:,1)),'b',t,x(:,3)./(x(:,2)+x(:,1)),'r',t,1-x(:,3)./(x(:,2)+x(:,1)),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(0, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1)+x(:,2),'k',t,x(:,1),'g',t,x(:,2),'b','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Tumor cells','Immune Response','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

% savefig([group 'Calibrated' flag '.fig'])
% saveas(gcf,[group 'Calibrated' flag],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  