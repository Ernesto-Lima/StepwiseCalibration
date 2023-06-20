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

multiguesssize = 100;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 20;

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
if strcmp(group,'C') || strcmp(group,'NC')
    Imdatamed = CD8medians/100;
    Imdataupp = CD8upper/100;
    Imdataupp(2) = Imdataupp(1);
    Imdataupp(3) = Imdataupp(1);
    Imdatalow = CD8lower/100;
    Imdatalow(2) = Imdatalow(1);
    Imdatalow(3) = Imdatalow(1);
    Imexptimes = immunedays;
else
    Imdatamed = CD8medians(1)/100;
    Imdataupp = CD8upper(1)/100;
    Imdatalow = CD8lower(1)/100;
    Imexptimes = immunedays(1);
end

%Allowing the model to run as volumes instead of percentages
ImdatamedV = Imdatamed*Tudatamed(1);
ImdatauppV = Imdataupp*Tudatamed(1);
ImdatalowV = Imdatalow*Tudatamed(1);
HydatamedV = Hydatamed*Tudatamed(1);
HydatauppV = Hydataupp*Tudatamed(1);
HydatalowV = Hydatalow*Tudatamed(1);


init = [Tudatamed(1)-ImdatamedV(1);ImdatamedV(1);Tudatamed(1)-HydatamedV(1)];

datameds   = [Tudatamed,Imdatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow,Imdataupp-Imdatalow,Hydataupp-Hydatalow]';
datasizes  = [numel(Tudatamed),numel(Imdatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Imexptimes,Hyexptimes];

datameds   = [Tudatamed,Imdatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow,Imdataupp-Imdatalow,Hydataupp-Hydatalow]';
datasizes  = [numel(Tudatamed),numel(Imdatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Imexptimes,Hyexptimes];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Parameters: 
% params =         g_C   u_C   g_I   a_V   b_I   g_V   a_I   u_V   b_V   D   r
if strcmp(whichcells,'M')
    if strcmp(group,'NC')
        params = [0.30, 1.96, 0.54, 1.20, 0.50, 0.00, 0.00, 1.76, 0.00, 0.00, 0.10];%MC38
        which  = [1,    1,     1,    1,    1,    0,    0,    0,    0,    0,    0];
    elseif strcmp(group,'NT')
        params = [0.30, 2.70, 0.25,0.75, 0.21, 0.05, 0.00, 1.76, 0.00, 0.00, 0.10];%MC38
        params = [0.30, 0.56, 0.54,0.10, 0.21, 0.05, 0.00, 1.76, 0.00, 2.89, 0.10];%MC38
        which  = [0,    1,     1,    1,    0,    0,    0,    0,    0,    1,    1];
        which  = [0,    1,     0,    0,    0,    0,    0,    0,    0,    1,    0];
    elseif strcmp(group,'RT')
        params = [0.30, 2.70, 0.25,0.75, 0.21, 0.35, 0.00, 1.76, 0.00, 0.00, 0.10];%MC38
        which  = [0,    1,     1,    1,    0,    0,    0,    0,    0,    1,    1];
    end
else
    if strcmp(group,'C')
        params = [0.12, 1.96, 0.54, 1.20, 0.50, 0.36, 0.00, 3.28, 0.00, 0.00, 0.10];%C
        which  = [1,    1,     1,    1,    1,    0,    1,    0,    0,    0,    0];
    else
        params = [0.25, 2.47, 0.55, 0.16, 0.81, 0.07, 0.00, 3.28, 0.00, 1.00, 0.10];%T
        which  = [0,    0,     1,    1,    0,    0,    0,    0,    0,    1,    1];
        which  = [0,    1,     1,    1,    0,    0,    0,    0,    0,    1,    1];
    end
end

free = find(which == 1);

if strcmp(whichcells,'M')
    lower  = [0.21, 1.50, 0.00, 0.10, 0.10, 0.00, 0.10, 3.00, 0.00, 0.00, 0.07];
else
    lower  = [0.12, 1.50, 0.00, 0.10, 0.10, 0.00, 0.10, 3.00, 0.00, 0.00, 0.07];
end
upper  = [0.30, 3.00, 3.00, 1.50, 1.00, 3.00, 3.00, 5.00, 5.00, 5.00, 0.14];
% upper  = [0.30, 10.00, 3.00, 1.50, 1.00, 3.00, 3.00, 5.00, 5.00, 5.00, 0.14];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Setting up muliple initial guesses for calibration

RandNums = zeros(multiguesssize+1,numel(params));
RandNums(1,:) = params;
for nn = 2:multiguesssize+1
%   RandNums(nn,:) = upper.*rand(1,size(params,2));
%   r = a + (b-a).*rand(100,1);
    RandNums(nn,:) = lower+(upper-lower).*rand(1,numel(params));
end

% RandNums = params;

Guesses = zeros(multiguesssize,numel(free));
errors = zeros(1,multiguesssize);
for yy = 1:multiguesssize+1
    yy
    params1 = RandNums(yy,:);
    options = optimoptions('fmincon');
    [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifunCIV(p,init,tf,...
        free,params1,datameds,dataranges,datatimes,datasizes),...
        params1(free),[],[],[],[],lower(free),upper(free),[],options);
    Guesses(yy,1:numel(free)) = control;
    errors(yy) = FVAL;
end

save(['Guesses' group 'CIV' whichcells '.mat'],'Guesses')
save(['Errors' group 'CIV' whichcells '.mat'],'errors')

Bests = zeros(size(params1,2));
z = find(errors==min(errors));
Bests = Guesses(z(1),:);
Bests'
min(errors)

save(['Bests' group 'CIV' whichcells '.mat'],'Bests');

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
clear x t
%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;

[t,x] = ode45(@rhsparamsCIV,[0 tf],init,[],calibratedparams);    

figh = figure(1);
b = subplot(1,2,1);
plot(t,x(:,2)./(x(:,2)+x(:,1)),'b',t,x(:,3)./(x(:,2)+x(:,1)),'r',t,1-x(:,3)./(x(:,2)+x(:,1)),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Imexptimes, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'bo','MarkerFaceColor','b','LineWidth',2)
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

% savefig([group 'CalibratedCIV' whichcells '.fig'])
% saveas(gcf,[group 'CalibratedCIV' whichcells],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  