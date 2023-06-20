clear all;
close all; 
tf = 20;

%Equations: 
%        dT/dt = g_T*T - u_T*Im*T    
%        dIm/dt = g_I*Im*(1 - Im) + a_V*V*(1 - Im)
%        dV/dt = g_V*(1 - V) + a_I*Im*(1 - V) - u_V*V*T

%Solving the dV/dt == 0 get
% V = (g_V+a_I*Im)/(u_V*T+g_V+a_I*Im)

figure
set(gca,'FontSize',20)

y1 = linspace(0,2,50);
y2 = linspace(0,2,50);

% creates two matrices one for all the x-values on the grid, and one for
% all the y-values on the grid.
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
 
 II = 0:0.01:2;
 TT = 0:0.01:2;

 for jj = 1:8
 b = subplot(2,4,jj);
 
 if jj < 5
    params = [0.15 0.1 0.001 0.002*5^(jj-1) 0.2 0.2 0.04e-3];
 else
    params = [0.15 0.3 0.001 0.002*5^(jj-5) 0.2 0.2 0.04e-3];
 end
 g_T = params(1);
 u_T = params(2);
 g_I = params(3);
 a_V = params(4);
 g_V = params(5);
 a_I = params(6); 
 u_V = params(7);
 
 f = @(t,Y) [g_T*Y(1) - u_T*Y(1)*Y(2); ...
             g_I*Y(2)*(1 - Y(2)) + a_V*((g_V+a_I*Y(2))/(u_V*Y(1)+g_V+a_I*Y(2)))*(1 - Y(2))];

% we can use a single loop over each element to compute the derivatives at
% each point (y1, y2)
t=0; % we want the derivatives at each point at t=0, i.e. the starting time
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
h = quiver(x,y,u,v,'r');
% hs = get(h,'MaxHeadSize');
% set(h,'MaxHeadSize',0.0005)
set(h,'AutoScale','on', 'AutoScaleFactor', 10)
xlabel('T (cm^3)')
ylabel('Im')
axis([0 0.5 0 1.55])
hold on

 %Tumor nulls
 T = 0;
 plot(T*ones(size(II)),II,'b--','linewidth',2)
 Im = g_T/u_T;
 plot(TT,Im*ones(size(TT)),'b--','linewidth',2)
 
 %Immune nulls
 Im = 1;
 plot(TT,Im*ones(size(TT)),'k--','linewidth',2)
 

for y20 = [0.05 0.23 1.1]
    [ts,ys] = ode45(f,[0,tf],[100;y20]);
    plot(ys(:,1)/1000,ys(:,2),'LineWidth',2)
    plot(ys(1,1)/1000,ys(1,2),'mo','MarkerFaceColor','m','markersize',10) % starting point
    plot(ys(end,1)/1000,ys(end,2),'go','MarkerFaceColor','g','markersize',10) % ending point
end
plot(0,1,'ro','MarkerFaceColor','r','markersize',10)
set(b,'FontName','Times New Roman');
set(b,'FontSize',20);
 end
hold off

%%

clear all;
tf = 50;

params = [0.15 0.2 0.15 0.02 0.2 0.2 0.04e-3];

 g_T = params(1);
 u_T = params(2);
 g_I = params(3);
 a_V = params(4);
 g_V = params(5);
 a_I = params(6); 
 u_V = params(7);

%Equations: 
%        dT/dt = g_T*T - u_T*Im*T    
%        dIm/dt = g_I*Im*(1 - Im) + a_V*V*(1 - Im)
%        dV/dt = g_V*V*(1 - V) + a_I*Im*(1 - V) - u_V*V*T

%For simplicity allowing V to be 3 constants
V = 0.1;

 figure
 f = @(t,Y) [g_T*Y(1) - u_T*Y(1)*Y(2); ...
             g_I*Y(2)*(1 - Y(2)) + a_V*V*(1 - Y(2))];

y1 = linspace(0,500,50);
y2 = linspace(0,2,20);

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
subplot(1,3,1)
quiver(x,y,u,v,'r'); 
xlabel('V')
ylabel('Im')
xlabel('T')
ylabel('Im')
axis([0 500 0 1.2])
hold on
 II = 0:0.01:2;
 TT = 0:0.01:500;
 %Tumor nulls
 T = 0;
 plot(T*ones(size(II)),II,'b--','linewidth',2)
 Im = g_T/u_T;
 plot(TT,Im*ones(size(TT)),'b--','linewidth',2)
 
 %Immune nulls
 Im = 1;
 plot(TT,Im*ones(size(TT)),'k--','linewidth',2)

for y20 = [0.05 0.23 1.1]
    [ts,ys] = ode45(f,[0,tf],[100;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'mo') % starting point
    plot(ys(end,1),ys(end,2),'gs') % ending point
end
plot(0,1,'yo','markersize',3)
% hold off

V = 0.5;
 f = @(t,Y) [g_T*Y(1) - u_T*Y(1)*Y(2); ...
             g_I*Y(2)*(1 - Y(2)) + a_V*V*(1 - Y(2))];
y1 = linspace(0,500,50);
y2 = linspace(0,2,20);
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
subplot(1,3,2)
quiver(x,y,u,v,'r'); 
xlabel('V')
ylabel('Im')
xlabel('T')
ylabel('Im')
axis([0 500 0 1.2])
hold on
 II = 0:0.01:2;
 TT = 0:0.01:500;
 T = 0;
 plot(T*ones(size(II)),II,'b--','linewidth',2)
 Im = g_T/u_T;
 plot(TT,Im*ones(size(TT)),'b--','linewidth',2)
 Im = 1;
 plot(TT,Im*ones(size(TT)),'k--','linewidth',2)
for y20 = [0.05 0.23 1.1]
    [ts,ys] = ode45(f,[0,tf],[100;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'mo') % starting point
    plot(ys(end,1),ys(end,2),'gs') % ending point
end
plot(0,1,'yo','markersize',3)
% hold off

V = 0.8;
 
 f = @(t,Y) [g_T*Y(1) - u_T*Y(1)*Y(2); ...
             g_I*Y(2)*(1 - Y(2)) + a_V*V*(1 - Y(2))];
y1 = linspace(0,500,50);
y2 = linspace(0,2,20);
[x,y] = meshgrid(y1,y2);
u = zeros(size(x));
v = zeros(size(x));
for i = 1:numel(x)
    Yprime = f(t,[x(i); y(i)]);
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
subplot(1,3,3)
quiver(x,y,u,v,'r'); 
xlabel('V')
ylabel('Im')
xlabel('T')
ylabel('Im')
axis([0 500 0 1.2])
hold on
 II = 0:0.01:2;
 TT = 0:0.01:500;
 T = 0;
 plot(T*ones(size(II)),II,'b--','linewidth',2)
 Im = g_T/u_T;
 plot(TT,Im*ones(size(TT)),'b--','linewidth',2)
 Im = 1;
 plot(TT,Im*ones(size(TT)),'k--','linewidth',2)
for y20 = [0.05 0.23 1.1]
    [ts,ys] = ode45(f,[0,tf],[100;y20]);
    plot(ys(:,1),ys(:,2))
    plot(ys(1,1),ys(1,2),'mo') % starting point
    plot(ys(end,1),ys(end,2),'gs') % ending point
end
plot(0,1,'yo','markersize',3)
hold off
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%end of file