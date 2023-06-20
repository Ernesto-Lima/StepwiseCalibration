
close all
clear all;
tf = 20;

group = 'C';
whichcells = 'E';
xx1 = 0; 
yy1 = 0; 
C0 = 0.200;
if group == 'C' && whichcells == 'E'
params = [0.25 2.47 0.55 0.16 0.81 0.36 3.28 0.00 0.00]; %E0771 control
xx2 = 6; yy2 = 0.2;
Vec = [0 0.60]*C0;
elseif group == 'T' && whichcells == 'E'
params = [0.25 9.89 1.88 0.49 0.81 0.07 3.28 0.21 0.07]; %E0771 treated
xx2 = 0.4; yy2 = 0.1;
Vec = [0.05 0.65]*C0;
elseif group == 'C' && whichcells == 'M'
params = [0.30 2.70 0.25 0.75 0.21 0.00 1.76 0.00 0.00]; %MC38 control
xx2 = 6; yy2 = 0.2;
Vec = [0.05 0.20]*C0;
elseif group == 'T' && whichcells == 'M'
params = [0.30 0.56 0.54 0.10 0.21 0.35 1.76 2.89 0.10]; %MC38 responders
xx2 = 1; yy2 = 0.4;
Vec = [0 0.95]*C0;
elseif group == 'b' && whichcells == 'M'
params = [0.30 0.56 0.54 0.10 1.31 0.05 1.76 2.89 0.10]; %MC38 nonresponders b_I
xx2 = 9; yy2 = 0.3;
Vec = [0 0.15]*C0;
elseif group == 'k' && whichcells == 'M'
params = [0.30 0.56 0.11 0.10 0.21 0.05 1.76 2.89 0.10]; %MC38 nonresponders g_I
xx2 = 9; yy2 = 0.3;
Vec = [0 0.15]*C0;
elseif group == 'u' && whichcells == 'M'
params = [0.30 0.07 0.54 0.10 0.21 0.05 1.76 2.19 0.10]; %MC38 nonresponders u_C + gam
xx2 = 9; yy2 = 6;
Vec = [0 0.15]*C0;
end
 g_C = params(1);
 u_C = params(2);%*(1+params(8));
 g_I = params(3);%*(1+params(8));
 a_V = params(4);
 b_I = params(5);
 g_V = params(6);
 u_V = params(7);



 
%   t = 0:0.05:tf;
%  drug = zeros(size(t));
% for jj = 1:numel(t)
%     if t(jj) < 3
%         drug(jj) = 1+D*exp(-r*t(jj));
%     elseif t(jj) < 6
%         drug(jj) = 1+D*exp(-r*(t(jj)-3));
%     else
%         drug(jj) = 1+D*exp(-r*(t(jj)-6));
%     end
% end
drug = 1;

%Equations: 
%        dC/dt = g_C*C - u_C*C*I
%        dI/dt = g_I*I*(C - I) + a_V*V*(C - I) - b_I*I*C
%        dV/dt = g_V*(C + I - V) - u_V*V*C

%For simplicity allowing V to be 3 constants
V = Vec(1);

figure
f = @(t,Y) [g_C*Y(1) - u_C*(max(drug))*Y(1)*Y(2); ...
             g_I*(max(drug)).*Y(2)*(Y(1) - Y(2)) + a_V*V*(Y(1) - Y(2))-b_I*Y(1)*Y(2)];

y1 = linspace(0,xx2,30);
y2 = linspace(0,yy2,10);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid.
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
b = subplot(1,2,1);
quiver(x,y,u,v,'r'); 
xlabel('Cancerous volume (cm$^3$)')
ylabel('Immune volume (cm$^3$)')
axis([xx1 xx2 yy1 yy2])
hold on
 II = 0:0.01:10;
 TT = 0:0.01:10;
 %Tumor nulls
 T = 0;
 plot(T*ones(size(II)),II,'g--','linewidth',3)
 Im = g_C/u_C;
 plot(TT,Im*ones(size(TT)),'g--','linewidth',3)
 
%Immune nulls
 Im = (-(g_I*TT-b_I*TT-a_V*V)-sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
 plot(TT,Im,'b--','linewidth',2)
  Im = (-(g_I*TT-b_I*TT-a_V*V)+sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
 plot(TT,Im,'b--','linewidth',2)

for y20 = C0*[0.05 0.10 0.20]
    [ts,ys] = ode45(f,[0,tf],[C0;y20]);
    plot(ys(:,1),ys(:,2),'LineWidth',2)
    plot(ys(1,1),ys(1,2),'mo','MarkerFaceColor','m') % starting point
    plot(ys(end,1),ys(end,2),'gs','MarkerFaceColor','g') % ending point
end
set(b,'FontName','Times New Roman','FontSize',20);


% b = subplot(2,3,4);
% hold on
% for y20 = C0*[0.05 0.10 0.20]
%     [ts,ys] = ode45(f,[0,tf],[C0;y20]);
%     plot(ts,ys(:,1)+ys(:,2))
% end
% xlabel('Time (days)')
% ylabel('Total tumor volume (cm$^3$)')
% set(b,'FontName','Times New Roman','FontSize',20);

V = Vec(2);
f = @(t,Y) [g_C*Y(1) - u_C*drug.*Y(1)*Y(2); ...
             g_I*drug.*Y(2)*(Y(1) - Y(2)) + a_V*V*(Y(1) - Y(2))-b_I*Y(1)*Y(2)];

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid.
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
b = subplot(1,2,2);
quiver(x,y,u,v,'r'); 
xlabel('Cancerous volume (cm$^3$)')
ylabel('Immune volume (cm$^3$)')
axis([xx1 xx2 yy1 yy2])
hold on
 II = 0:0.01:10;
 TT = 0:0.01:10;
 %Tumor nulls
 T = 0;
 plot(T*ones(size(II)),II,'g--','linewidth',3)
 Im = g_C/u_C;
 plot(TT,Im*ones(size(TT)),'g--','linewidth',3)
 
 %Immune nulls
 Im = (-(g_I*TT-b_I*TT-a_V*V)-sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
 plot(TT,Im,'b--','linewidth',2)
  Im = (-(g_I*TT-b_I*TT-a_V*V)+sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
 plot(TT,Im,'b--','linewidth',2)
 
for y20 = C0*[0.05 0.10 0.20]
    [ts,ys] = ode45(f,[0,tf],[C0;y20]);
    plot(ys(:,1),ys(:,2),'LineWidth',2)
    plot(ys(1,1),ys(1,2),'mo','MarkerFaceColor','m') % starting point
    plot(ys(end,1),ys(end,2),'gs','MarkerFaceColor','g') % ending point
end
set(b,'FontName','Times New Roman','FontSize',20);

% b = subplot(2,3,5);
% hold on
% for y20 = C0*[0.05 0.10 0.20]
%     [ts,ys] = ode45(f,[0,tf],[C0;y20]);
%     plot(ts,ys(:,1)+ys(:,2))
% end
% xlabel('Time (days)')
% ylabel('Total tumor volume (cm$^3$)')
% set(b,'FontName','Times New Roman','FontSize',20);

% V = Vec(3);
%  
% f = @(t,Y) [g_C*Y(1) - u_C*drug.*Y(1)*Y(2); ...
%              g_I*drug.*Y(2)*(Y(1) - Y(2)) + a_V*V*(Y(1) - Y(2))-b_I*Y(1)*Y(2)];
% 
% % creates two matrices one for all the x-values on the grid, and one for
% % all the y-values on the grid.
% [x,y] = meshgrid(y1,y2);
% u = zeros(size(x));
% v = zeros(size(x));
% 
% % we can use a single loop over each element to compute the derivatives at
% % each point (y1, y2)
% t=0; % we want the derivatives at each point at t=0, i.e. the starting time
% for i = 1:numel(x)
%     Yprime = f(t,[x(i); y(i)]);
%     u(i) = Yprime(1);
%     v(i) = Yprime(2);
% end
% b = subplot(1,3,3);
% quiver(x,y,u,v,'r'); 
% xlabel('Cancerous volume (cm$^3$)')
% ylabel('Immune volume (cm$^3$)')
% axis([xx1 xx2 yy1 yy2])
% hold on
%  II = 0:0.01:10;
%  TT = 0:0.01:10;
%  %Tumor nulls
%  T = 0;
%  plot(T*ones(size(II)),II,'g--','linewidth',3)
%  Im = g_C/u_C;
%  plot(TT,Im*ones(size(TT)),'g--','linewidth',3)
%  
%  %Immune nulls
%  Im = (-(g_I*TT-b_I*TT-a_V*V)-sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
%  plot(TT,Im,'b--','linewidth',2)
%   Im = (-(g_I*TT-b_I*TT-a_V*V)+sqrt(((g_I*TT-b_I*TT-a_V*V).^2) - 4*(-g_I)*(a_V*V*TT)))/(2*(-g_I));
%  plot(TT,Im,'b--','linewidth',2)
%  
% for y20 = C0*[0.05 0.10 0.20]
%     [ts,ys] = ode45(f,[0,tf],[C0;y20]);
%     plot(ys(:,1),ys(:,2),'LineWidth',2)
%     plot(ys(1,1),ys(1,2),'mo','MarkerFaceColor','m') % starting point
%     plot(ys(end,1),ys(end,2),'gs','MarkerFaceColor','g') % ending point
% end
% 
set(b,'FontName','Times New Roman','FontSize',20);

% b = subplot(2,3,6);
% hold on
% for y20 = C0*[0.05 0.10 0.20]
%     [ts,ys] = ode45(f,[0,tf],[C0;y20]);
%     plot(ts,ys(:,1)+ys(:,2))
% end
% xlabel('Time (days)')
% ylabel('Total tumor volume (cm$^3$)')
% set(b,'FontName','Times New Roman','FontSize',20);

set(gcf, 'Position', get(0, 'Screensize'));

savefig([group 'NullsCIV' whichcells '.fig'])
saveas(gcf,[group 'NullsCIV' whichcells],'png');  

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%end of file