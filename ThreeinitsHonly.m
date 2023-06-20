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

group = 'C';

whichcells = 'E';

multiguesssize = 50;

%Basic information about system
Nequations = 2;    %Number of equations 

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

%Allowing the model to run as volumes instead of percentages
HydatamedV = Hydatamed*Tudatamed(1);
HydatauppV = Hydataupp*Tudatamed(1);
HydatalowV = Hydatalow*Tudatamed(1);

if flag == 1
    init(flag,:) = [Tudatamed(1);Tudatamed(1)-HydatamedV(1)];
elseif flag == 2
    init(flag,:) = [Tudataupp(1);Tudataupp(1)*(1-Hydatalow(1))];
else
    init(flag,:) = [Tudatalow(1);Tudatalow(1)*(1-HydatauppV(1))];
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

% load(['Bests' group 'Honly' whichcells '.mat'])


% calibratedparams = Bests
calibratedparams(1) = 0.12;
calibratedparams(2) = 0.36;
calibratedparams(3) = 3.28;

t1 = 0:0.1:20;
OutputPointsT = zeros(multiguesssize,numel(t1));
OutputPointsV = zeros(multiguesssize,numel(t1));
for jj = 1:multiguesssize
    [t,x] = ode45(@rhsparamsHonly,[0 tf],RandInits(jj,:),[],calibratedparams);    
    OutputPointsT(jj,:) = interp1(t,x(:,1),t1,'pchip');
    OutputPointsV(jj,:) = interp1(t,x(:,2),t1,'pchip');
end
outTstd = std(OutputPointsT,[],1);
outVstd = std(OutputPointsV,[],1);

tval = tinv(0.95,multiguesssize-1); 

% CIt = tval*(outTstd/sqrt(multiguesssize));
% CIv = tval*(outVstd/sqrt(multiguesssize));

CIt = outTstd;
CIv = outVstd;

% CIt = (max(OutputPointsT,[],1)-min(OutputPointsT,[],1))/2;
% CIi = (max(OutputPointsI,[],1)-min(OutputPointsI,[],1))/2;
% CIv = (max(OutputPointsV,[],1)-min(OutputPointsV,[],1))/2;

%%
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Figure making
%Clearing variables and setting initial conditions
[t,x] = ode45(@rhsparamsHonly,[0 tf],init(1,:),[],calibratedparams);    
T = interp1(t,x(:,1),t1,'pchip');
V = interp1(t,x(:,2),t1,'pchip');

figh = figure(1);
b = subplot(1,2,1);
plot(t1,V./(T),'r',t1,1-V./(T),'m','LineWidth',2);
hold
plot(t1,(V+CIv)./(T),'r--',t1,1-(V-CIv)./(T),'m--','LineWidth',2);
plot(t1,(V-CIv)./(T),'r--',t1,1-(V+CIv)./(T),'m--','LineWidth',2);
%Plotting corresponding data and error bars
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
plot(0:20,0.3*ones(size([0:20])),'k--')
plot(0:20,0.5*ones(size([0:20])),'k--')
axis([0 tf 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Fraction of tumor volume','FontSize',20);
% legend('Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t1,T,'k','LineWidth',2);
hold
plot(t1,T+CIt,'k--','LineWidth',2);
plot(t1,T-CIt,'k--','LineWidth',2);
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume ($cm^3$)','FontSize',20);
% legend('Total tumor','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 tf])

pos = get(figh,'position');
set(figh,'position',[pos(1:2)/2 pos(3:4)*1.5])

fitfun(t,x,datameds(1,:),dataranges(1,:),datatimes(1,:),datasizes(1,:))

% 
savefig([group 'CalibratedHonly' whichcells '.fig'])
saveas(gcf,[group 'CalibratedHonly' whichcells],'png');  

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file  