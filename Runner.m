%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%File for running the model using the calibrated parameters
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Initialize the workspace
clc;
clear all;
set(0,'defaulttextinterpreter','latex')
% close all;
format long;

%Assign flag zero for non-response or one for response
flag = 0;
treated = 0;

%Basic information about system
Nequations = 3;    %Number of equations 

%Time duration in days
tf = 10;

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Biological Data


if(flag==0) %Non-Responding
  %Tumor volume
  load('TumorVolumes.mat')
  Tudatamed = Nmedians;
  Tudataupp = Nupperq;
  Tudatalow = Nlowerq;
  Tuexptimes = Nexptimes;
  %Hypoxia   
  load('HypoxicFractions.mat')
  Hydatamed = Nmedians/100;
  Hydataupp = Nupperq/100;
  Hydatalow = Nlowerq/100;
  Hyexptimes = Nexptimes;
elseif(flag==1) %Responding
  %Tumor volume
  load('TumorVolumes.mat')
  Tudatamed = Rmedians;
  Tudataupp = Rupperq;
  Tudatalow = Rlowerq;
  Tuexptimes = Rexptimes;
  %Hypoxia 
  load('HypoxicFractions.mat')
  Hydatamed = Rmedians/100;
  Hydataupp = Rupperq/100;
  Hydatalow = Rlowerq/100;
  Hyexptimes = Rexptimes;
end

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Assigning parameter values
% params = {'g_T','u_T','a_V','g_I','g_V','a_I','u_V','K_T','K_I','r'};
% params =   [0.2   1000e-3  0.002   0.001 0.002 0.2   0.4e-3   1     1   0.1 ]; %R
% params =   [0.2   1e-3  0.002 0.0001 0.002 0.2 0.04e-3   1     1   0.1 ]; %R
params =   [0.2   1e-3  0.002 0.0001 0.002 0.2 4e-3   1     1   0.1 ]; %R

if treated == 0
    params(end+1) = 0;
else
    params(end+1) = 0.3; %mg
end

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
 init = [Tudatamed(1);0.05;1-Hydatamed(1);];
%  init = [Tudatamed(1);0.05;1-0.2;];

%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%Run model 
[t,x] = ode45(@rhsparams,[0 tf],init,[],params);   

figure;
b = subplot(1,2,1);
plot(t,x(:,2),'b',t,x(:,3),'r',t,1-x(:,3),'m','LineWidth',2);
hold
%Plotting corresponding data and error bars
errorbar(Hyexptimes, Hydatamed, Hydatamed-Hydatalow, Hydataupp-Hydatamed, 'mo','MarkerFaceColor','m','LineWidth',2)
% errorbar(Hyexptimes, Hydatamed, Hydatalow, Hydataupp, 'mo','MarkerFaceColor','m','LineWidth',2)
axis([0 10 0 1])
xlabel('Time in Days','FontSize',20);
ylabel('Component Value','FontSize',20);
legend('Immune Response','Vasculature','Hypoxia','Location','Best')
set(b,'FontName','Times New Roman','FontSize',20);

b = subplot(1,2,2);
plot(t,x(:,1),'k','LineWidth',2);
hold
errorbar(Tuexptimes, Tudatamed, Tudatamed-Tudatalow, Tudataupp-Tudatamed, 'ko','MarkerFaceColor','k','LineWidth',2)
xlabel('Time in Days','FontSize',20);
ylabel('Tumor Volume $mm^3$','FontSize',20);
set(b,'FontName','Times New Roman','FontSize',20);
xlim([0 10])

set(gcf,'NextPlot','add');
axes;
if flag == 0
    h = title({'Non-responding tumor simulations with experimental data';' '},'FontSize',20);
    set(gca,'Visible','off'); 
    set(h,'Visible','on');
%     savefig('ControlCalibratedValidate.fig')
%     saveas(gcf,'ControlCalibratedValidate','png');    
else
    h = title({'Responding tumor simulations with experimental data';' '},'FontSize',20);
    set(gca,'Visible','off'); 
    set(h,'Visible','on');
    set(gca,'FontSize',20)
%     savefig('TreatedCalibratedValidate.fig')
%     saveas(gcf,'TreatedCalibratedValidate','png');    
end    

% beep
%''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
%End of file