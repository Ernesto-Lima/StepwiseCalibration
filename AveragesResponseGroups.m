
clear all
close all
set(0,'defaulttextinterpreter','latex')

%Slow growers control
RC2 = [0 2 3 7 12 17 20; 
    45.33	139.28	68.11	124.69	145.13	427.76	1009.77];

%Slow growers treated
RT1 = [0 2 3 7 12; 
    57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 
    125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
RT3 = [0 2 3 7 12 17 20; 
    73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 
    101.02	86.35	50.07	37.40	13.99	0.00	0.00];
NT3 = [0 2 3 5 7 12; 
    143.69	359.80	338.15	538.35	730.50	970.25];

%Fast growers controls
RC1 = [0 2 3 7 12 17 20; 
    57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
NC1 = [0 2 3 7 12 17 20;
    94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;
    146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 
    137.05	543.36	785.75	1000.06	1156.69	2778.13];

%Fast growers treated
NT1 = [0 2 3 7 12 17 20;
    84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17;
    102.08	148.76	143.58	399.48	1370.74	3529.60];
NT4 = [0 2 3 5 7 12;
    119.92	242.78	283.04	497.64	970.25	2612.31];

allexperimentaldays = [0 2 3 5 7 12 17 20];
%%
%2000 mm^3 threshold

figure
hold

plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k-','LineWidth',2)
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 3*','Antibody dose','location','northwest')
ylim([0 8000])

figure
hold

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k-','LineWidth',2)
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1*','Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 4','Antibody dose','location','northwest')
ylim([0 8000])

%%

%Slow growers
RC2 = [0 2 3 7 12 17 20; 
    45.33	139.28	68.11	124.69	145.13	427.76	1009.77];
RT1 = [0 2 3 7 12; 
    57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 
    125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
RT3 = [0 2 3 7 12 17 20; 
    73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 
    101.02	86.35	50.07	37.40	13.99	0.00	0.00];
NT3 = [0 2 3 5 7 12; 
    143.69	359.80	338.15	538.35	730.50	970.25];

day0 =  [RC2(2,1),RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
day2 =  [RC2(2,2),RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
day3 =  [RC2(2,3),RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];
day5 =   NT3(2,4);
day7 =  [RC2(2,4),RT1(2,4),RT2(2,4),RT3(2,4),RT4(2,4),NT3(2,5)];
day12 = [RC2(2,5),RT1(2,5),RT2(2,5),RT3(2,5),RT4(2,5),NT3(2,6)];
day17 = [RC2(2,6),RT2(2,6),RT3(2,6),RT4(2,6)];
day20 = [RC2(2,7),RT2(2,7),RT3(2,7),RT4(2,7)];

means = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),mean(day12),mean(day17),mean(day20)];

figure
plot(allexperimentaldays,means,'LineWidth',3)
hold


RC1 = [0 2 3 7 12 17 20; 
    57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
NC1 = [0 2 3 7 12 17 20;
    94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;
    146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 
    137.05	543.36	785.75	1000.06	1156.69	2778.13];
NT1 = [0 2 3 7 12 17 20;
    84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17;
    102.08	148.76	143.58	399.48	1370.74	3529.60];
NT4 = [0 2 3 5 7 12;
    119.92	242.78	283.04	497.64	970.25	2612.31];

day0 =  [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1),NT1(2,1),NT2(2,1),NT4(2,1)];
day2 =  [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2),NT1(2,2),NT2(2,2),NT4(2,2)];
day3 =  [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3),NT1(2,3),NT2(2,3),NT4(2,3)];
day5 =  [NC2(2,4),NC3(2,4),NT4(2,4)];
day7 =  [RC1(2,4),NC1(2,4),NC2(2,5),NC3(2,5),NT1(2,4),NT2(2,4),NT4(2,5)];
day12 = [RC1(2,5),NC1(2,5),NC2(2,6),NC3(2,6),NT1(2,5),NT2(2,5),NT4(2,6)];
day17 = [RC1(2,6),NC1(2,6),NT1(2,6),NT2(2,6)];
day20 = [RC1(2,7),NC1(2,7),NT1(2,7)];


means = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),mean(day12),mean(day17),mean(day20)];

plot(allexperimentaldays,means,'LineWidth',3)


legend('Controlled','Uncontrolled','Location','best')

xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Mean tumor volumes per time for outcome groups')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')



%% Group volumes

close all
set(0,'defaulttextinterpreter','latex')

%Controlled
Rday0 = [RC2(2,1),RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
Rday2 = [RC2(2,2),RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
Rday3 = [RC2(2,3),RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];
Rday5 = NT3(2,4);
Rday7 = [RC2(2,4),RT1(2,4),RT2(2,4),RT3(2,4),RT4(2,4),NT3(2,5)];
Rday12 = [RC2(2,5),RT1(2,5),RT2(2,5),RT3(2,5),RT4(2,5),NT3(2,6)];
Rday17 = [RC2(2,6),RT2(2,6),RT3(2,6),RT4(2,6)];
Rday20 = [RC2(2,7),RT2(2,7),RT3(2,7),RT4(2,7)];

Ralldays = [Rday0,Rday2,Rday3,Rday5,Rday7,Rday12,Rday17,Rday20];

Rlabels = [zeros(size(Rday0)),2*ones(size(Rday2)),3*ones(size(Rday3)),...
          5*ones(size(Rday5)),7*ones(size(Rday7)),12*ones(size(Rday12)),...
          17*ones(size(Rday17)),20*ones(size(Rday20))];
      

figure
boxplot(Ralldays,Rlabels,'Whisker',5,'colors','r')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
% title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%Uncontrolled
Nday0 = [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1),NT1(2,1),NT2(2,1),NT4(2,1)];
Nday2 = [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2),NT1(2,2),NT2(2,2),NT4(2,2)];
Nday3 = [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3),NT1(2,3),NT2(2,3),NT4(2,3)];
Nday5 = [NC2(2,4),NC3(2,4),NT4(2,4)];
Nday7 = [RC1(2,4),NC1(2,4),NC2(2,5),NC3(2,5),NT1(2,4),NT2(2,4),NT4(2,5)];
Nday12 = [RC1(2,5),NC1(2,5),NC2(2,6),NC3(2,6),NT1(2,5),NT2(2,5),NT4(2,6)];
Nday17 = [RC1(2,6),NC1(2,6),NT1(2,6),NT2(2,6)];
Nday20 = [RC1(2,7),NC1(2,7),NT1(2,7)];

Nalldays = [Nday0,Nday2,Nday3,Nday5,Nday7,Nday12,Nday17,Nday20];

Nlabels = [zeros(size(Nday0)),2*ones(size(Nday2)),3*ones(size(Nday3)),...
          5*ones(size(Nday5)),7*ones(size(Nday7)),12*ones(size(Nday12)),...
          17*ones(size(Nday17)),20*ones(size(Nday20))];

hold
boxplot(Nalldays,Nlabels,'Whisker',5,'colors','b')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
% title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
% close all
Raverages = [mean(Rday0),mean(Rday2),mean(Rday3),mean(Rday5),...
             mean(Rday7),mean(Rday12),mean(Rday17),mean(Rday20)];
Rmedians  = [median(Rday0),median(Rday2),median(Rday3),median(Rday5),...
            median(Rday7),median(Rday12),median(Rday17),median(Rday20)];
Rstdevs   = [std(Rday0),std(Rday2),std(Rday3),std(Rday5),std(Rday7),...
            std(Rday12),std(Rday17),std(Rday20)];
Rsizes = [numel(Rday0),numel(Rday2),numel(Rday3),numel(Rday5),...
          numel(Rday7),numel(Rday12),numel(Rday17),numel(Rday20)];
Rtvals = tinv(0.95,Rsizes); 
Rsqrtsizes = sqrt(Rsizes);
RCIs = Rtvals.*(Rstdevs./Rsqrtsizes);
clear Rquartiles
Rquartiles(1,:) = quantile(Rday0,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday2,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday3,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday5,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday7,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday12,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday17,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday20,[0.25, 0.75]);

figure
errorbar(allexperimentaldays,Rmedians,Rmedians'-Rquartiles(:,1),Rquartiles(:,2)-Rmedians','LineWidth',3)
hold
plot(allexperimentaldays,Rmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

Naverages = [mean(Nday0),mean(Nday2),mean(Nday3),mean(Nday5),...
             mean(Nday7),mean(Nday12),mean(Nday17),mean(Nday20)];
Nmedians  = [median(Nday0),median(Nday2),median(Nday3),median(Nday5),...
            median(Nday7),median(Nday12),median(Nday17),median(Nday20)];
Nstdevs   = [std(Nday0),std(Nday2),std(Nday3),std(Nday5),std(Nday7),...
            std(Nday12),std(Nday17),std(Nday20)];
Nsizes = [numel(Nday0),numel(Nday2),numel(Nday3),numel(Nday5),...
          numel(Nday7),numel(Nday12),numel(Nday17),numel(Nday20)];
Ntvals = tinv(0.95,Nsizes); 
Nsqrtsizes = sqrt(Nsizes);
NCIs = Ntvals.*(Nstdevs./Nsqrtsizes);
clear Nquartiles
Nquartiles(1,:) = quantile(Nday0,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday2,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday3,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday5,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday7,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday12,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday17,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday20,[0.25, 0.75]);

figure
errorbar(allexperimentaldays,Nmedians,Nmedians'-Nquartiles(:,1),Nquartiles(:,2)-Nmedians','LineWidth',3)
hold
plot(allexperimentaldays,Nmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
% Removing day 5
allexpdaysbut5 = [0 2 3 7 12 17 20];

Raverages = [mean(Rday0),mean(Rday2),mean(Rday3),...
             mean(Rday7),mean(Rday12),mean(Rday17),mean(Rday20)];
Rmedians  = [median(Rday0),median(Rday2),median(Rday3),...
            median(Rday7),median(Rday12),median(Rday17),median(Rday20)];
Rstdevs   = [std(Rday0),std(Rday2),std(Rday3),std(Rday7),...
            std(Rday12),std(Rday17),std(Rday20)];
Rsizes = [numel(Rday0),numel(Rday2),numel(Rday3),...
          numel(Rday7),numel(Rday12),numel(Rday17),numel(Rday20)];
Rtvals = tinv(0.95,Rsizes); 
Rsqrtsizes = sqrt(Rsizes);
RCIs = Rtvals.*(Rstdevs./Rsqrtsizes);
clear Rquartiles
Rquartiles(1,:) = quantile(Rday0,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday2,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday3,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday7,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday12,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday17,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday20,[0.25, 0.75]);

figure
errorbar(allexpdaysbut5,Rmedians,Rmedians'-Rquartiles(:,1),Rquartiles(:,2)-Rmedians','LineWidth',3)
hold
plot(allexpdaysbut5,Rmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

Naverages = [mean(Nday0),mean(Nday2),mean(Nday3),...
             mean(Nday7),mean(Nday12),mean(Nday17),mean(Nday20)];
Nmedians  = [median(Nday0),median(Nday2),median(Nday3),...
            median(Nday7),median(Nday12),median(Nday17),median(Nday20)];
Nstdevs   = [std(Nday0),std(Nday2),std(Nday3),std(Nday7),...
            std(Nday12),std(Nday17),std(Nday20)];
Nsizes = [numel(Nday0),numel(Nday2),numel(Nday3),...
          numel(Nday7),numel(Nday12),numel(Nday17),numel(Nday20)];
Ntvals = tinv(0.95,Nsizes); 
Nsqrtsizes = sqrt(Nsizes);
NCIs = Ntvals.*(Nstdevs./Nsqrtsizes);
clear Nquartiles
Nquartiles(1,:) = quantile(Nday0,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday2,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday3,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday7,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday12,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday17,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday20,[0.25, 0.75]);

figure
errorbar(allexpdaysbut5,Nmedians,Nmedians'-Nquartiles(:,1),Nquartiles(:,2)-Nmedians','LineWidth',3)
hold
plot(allexpdaysbut5,Nmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
 save('ExpoGroupTumorVolumes.mat')
