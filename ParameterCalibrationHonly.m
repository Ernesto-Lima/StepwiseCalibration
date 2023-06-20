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

group = 'T';

whichcells = 'E';

multiguesssize = 100;

%Basic information about system
Nequations = 2;    %Number of equations 

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

%Allowing the model to run as volumes instead of percentages
HydatamedV = Hydatamed*Tudatamed(1);
HydatauppV = Hydataupp*Tudatamed(1);
HydatalowV = Hydatalow*Tudatamed(1);


init = [Tudatamed(1);Tudatamed(1)-HydatamedV(1)];
 
datameds   = [Tudatamed,Hydatamed];
dataranges = [Tudataupp-Tudatalow,Hydataupp-Hydatalow]';
datasizes  = [numel(Tudatamed),numel(Hydatamed)];
datatimes  = [Tuexptimes,Hyexptimes];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Parameters: 
% params = {'g_T','g_V','u_V'};
if strcmp(whichcells,'M')
    params = [0.18,   0.1,   1.76 ];
else
%     params = [0.11,   0,   1.76 ];
    params = [-0.09,   0.36,   3.28 ];
end


which  = [1, 0, 1];
free = find(which == 1);
    
% lower  =    [0       0      0];
lower  =    [-0.3       0      0];
upper  =    [0.3     10    10];

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
    [control,FVAL,EXITFLAG,OUTPUT] = fmincon(@(p) optifunHonly(p,init,tf,...
        free,params1,datameds,dataranges,datatimes,datasizes),...
        params1(free),[],[],[],[],lower(free),upper(free),[],options);
    Guesses(yy,1:numel(free)) = control;
    errors(yy) = FVAL;
end

save(['Guesses' group 'Honly' whichcells '.mat'],'Guesses')
save(['Errors' group 'Honly' whichcells '.mat'],'errors')

mean(Guesses)

Bests = zeros(size(params1,2));
z = find(errors==min(errors));
Bests = Guesses(z(1),:);
Bests'
min(errors)

save(['Bests' group 'Honly' whichcells '.mat'],'Bests');

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
clear x t
%Defining parameters
calibratedparams = params;
calibratedparams(free) = Bests;

[t,x] = ode45(@rhsparamsHonly,[0 tf],init,[],calibratedparams);    

figh = figure(1);
b = subplot(1,2,1);
plot(t,x(:,2)./(x(:,1)),'r',t,1-x(:,2)./(x(:,1)),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
legend('Vasculature','Hypoxia','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1),'g','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
legend('Total tumor','Location','best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

% savefig([group 'CalibratedHOnly' whichcells '.fig'])
% saveas(gcf,[group 'CalibratedHonly' whichcells],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  