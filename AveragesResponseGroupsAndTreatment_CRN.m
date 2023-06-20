
clear all
close all
set(0,'defaulttextinterpreter','latex')

%Controls
RC1 = [0 2 3 7 12 17 20; 
    57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
RC2 = [0 2 3 7 12 17 20; 
    45.33	139.28	68.11	124.69	145.13	427.76	1009.77];
NC1 = [0 2 3 7 12 17 20;
    94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;
    146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 
    137.05	543.36	785.75	1000.06	1156.69	2778.13];

%Responders
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

%Non-responders
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
plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k-','LineWidth',2)
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','northwest')
legend('Control mouse 2','Control mouse 1*','Control mouse 1','Control mouse 2','Control mouse 3','Antibody dose','location','northwest')
ylim([0 8000])

figure
hold
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
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 3*','Antibody dose','location','northwest')
ylim([0 8000])


figure
hold
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
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Treated mouse 1','Treated mouse 2','Treated mouse 4','Antibody dose','location','northwest')
ylim([0 8000])


%% Group volumes

set(0,'defaulttextinterpreter','latex')

%Controls
NCday0 = [RC2(2,1),RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1)];
NCday2 = [RC2(2,2),RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2)];
NCday3 = [RC2(2,3),RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3)];
% Nday5 = [NC2(2,4),NC3(2,4)];
NCday7 = [RC2(2,4),RC1(2,4),NC1(2,4),NC2(2,5),NC3(2,5)];
NCday12 = [RC2(2,5),RC1(2,5),NC1(2,5),NC2(2,6),NC3(2,6)];
NCday17 = [RC2(2,6),RC1(2,6),NC1(2,6)];
NCday20 = [RC2(2,7),RC1(2,7),NC1(2,7)];

NCalldays = [NCday0,NCday2,NCday3,NCday7,NCday12,NCday17,NCday20];

NClabels = [zeros(size(NCday0)),2*ones(size(NCday2)),3*ones(size(NCday3)),...
          7*ones(size(NCday7)),12*ones(size(NCday12)),...
          17*ones(size(NCday17)),20*ones(size(NCday20))];

figure
boxplot(NCalldays,NClabels,'Whisker',5,'colors','b')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])

%Slow growers, treated
RTday0 = [RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
RTday2 = [RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
RTday3 = [RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];
% Rday5 = NT3(2,4);
RTday7 = [RT1(2,4),RT2(2,4),RT3(2,4),RT4(2,4),NT3(2,5)];
RTday12 = [RT1(2,5),RT2(2,5),RT3(2,5),RT4(2,5),NT3(2,6)];
RTday17 = [RT2(2,6),RT3(2,6),RT4(2,6)];
RTday20 = [RT2(2,7),RT3(2,7),RT4(2,7)];

RTalldays = [RTday0,RTday2,RTday3,RTday7,RTday12,RTday17,RTday20];

RTlabels = [zeros(size(RTday0)),2*ones(size(RTday2)),3*ones(size(RTday3)),...
          7*ones(size(RTday7)),12*ones(size(RTday12)),...
          17*ones(size(RTday17)),20*ones(size(RTday20))];

figure
boxplot(RTalldays,RTlabels,'Whisker',5,'colors','r')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])

%Fast growers, treated
NTday0 = [NT1(2,1),NT2(2,1),NT4(2,1)];
NTday2 = [NT1(2,2),NT2(2,2),NT4(2,2)];
NTday3 = [NT1(2,3),NT2(2,3),NT4(2,3)];
% NTday5 = [NT4(2,4)];
NTday7 = [NT1(2,4),NT2(2,4),NT4(2,5)];
NTday12 = [NT1(2,5),NT2(2,5),NT4(2,6)];
NTday17 = [NT1(2,6),NT2(2,6)];
NTday20 = [NT1(2,7)];

NTalldays = [NTday0,NTday2,NTday3,NTday7,NTday12,NTday17,NTday20];

NTlabels = [zeros(size(NTday0)),2*ones(size(NTday2)),3*ones(size(NTday3)),...
          7*ones(size(NTday7)),12*ones(size(NTday12)),...
          17*ones(size(NTday17)),20*ones(size(NTday20))];

figure
boxplot(NTalldays,NTlabels,'Whisker',5,'colors','b')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])
%%
allexpdaysbut5 = [0 2 3 7 12 17 20];

RTmaxes = [max(RTday0),max(RTday2),max(RTday3),...
           max(RTday7),max(RTday12),max(RTday17),max(RTday20)];
RTmins = [min(RTday0),min(RTday2),min(RTday3),...
          min(RTday7),min(RTday12),min(RTday17),min(RTday20)];
RTaverages = [mean(RTday0),mean(RTday2),mean(RTday3),...
             mean(RTday7),mean(RTday12),mean(RTday17),mean(RTday20)];
RTmedians  = [median(RTday0),median(RTday2),median(RTday3),...
            median(RTday7),median(RTday12),median(RTday17),median(RTday20)];
RTstdevs   = [std(RTday0),std(RTday2),std(RTday3),std(RTday7),...
            std(RTday12),std(RTday17),std(RTday20)];
RTsizes = [numel(RTday0),numel(RTday2),numel(RTday3),...
          numel(RTday7),numel(RTday12),numel(RTday17),numel(RTday20)];
RTtvals = tinv(0.95,RTsizes); 
RTsqrtsizes = sqrt(RTsizes);
RTCIs = RTtvals.*(RTstdevs./RTsqrtsizes);
clear RTquartiles
RTquartiles(1,:) = quantile(RTday0,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday2,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday3,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday7,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday12,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday17,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday20,[0.25, 0.75]);

figure
% errorbar(allexpdaysbut5,RTmedians,RTmedians'-RTquartiles(:,1),RTquartiles(:,2)-RTmedians','LineWidth',3)
errorbar(allexpdaysbut5,RTaverages,RTaverages-RTmins,RTmaxes-RTaverages,'LineWidth',3)
hold
plot(allexpdaysbut5,RTmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])


NCmaxes = [max(NCday0),max(NCday2),max(NCday3),...
           max(NCday7),max(NCday12),max(NCday17),max(NCday20)];
NCmins = [min(NCday0),min(NCday2),min(NCday3),...
          min(NCday7),min(NCday12),min(NCday17),min(NCday20)];
NCaverages = [mean(NCday0),mean(NCday2),mean(NCday3),...
             mean(NCday7),mean(NCday12),mean(NCday17),mean(NCday20)];
NCmedians  = [median(NCday0),median(NCday2),median(NCday3),...
            median(NCday7),median(NCday12),median(NCday17),median(NCday20)];
NCstdevs   = [std(NCday0),std(NCday2),std(NCday3),std(NCday7),...
            std(NCday12),std(NCday17),std(NCday20)];
NCsizes = [numel(NCday0),numel(NCday2),numel(NCday3),...
          numel(NCday7),numel(NCday12),numel(NCday17),numel(NCday20)];
NCtvals = tinv(0.95,NCsizes); 
NCsqrtsizes = sqrt(NCsizes);
NCCIs = NCtvals.*(NCstdevs./NCsqrtsizes);
clear NCquartiles
NCquartiles(1,:) = quantile(NCday0,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday2,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday3,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday7,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday12,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday17,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday20,[0.25, 0.75]);

figure
% errorbar(allexpdaysbut5,NCmedians,NCmedians'-NCquartiles(:,1),NCquartiles(:,2)-NCmedians','LineWidth',3)
errorbar(allexpdaysbut5,NCaverages,NCaverages-NCmins,NCmaxes-NCaverages,'LineWidth',3)
hold
plot(allexpdaysbut5,NCmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])

NTmaxes = [max(NTday0),max(NTday2),max(NTday3),...
           max(NTday7),max(NTday12),max(NTday17),max(NTday20)];
NTmins = [min(NTday0),min(NTday2),min(NTday3),...
          min(NTday7),min(NTday12),min(NTday17),min(NTday20)];
NTaverages = [mean(NTday0),mean(NTday2),mean(NTday3),...
             mean(NTday7),mean(NTday12),mean(NTday17),mean(NTday20)];
NTmedians  = [median(NTday0),median(NTday2),median(NTday3),...
            median(NTday7),median(NTday12),median(NTday17),median(NTday20)];
NTstdevs   = [std(NTday0),std(NTday2),std(NTday3),std(NTday7),...
            std(NTday12),std(NTday17),std(NTday20)];
NTsizes = [numel(NTday0),numel(NTday2),numel(NTday3),...
          numel(NTday7),numel(NTday12),numel(NTday17),numel(NTday20)];
NTtvals = tinv(0.95,NTsizes); 
NTsqrtsizes = sqrt(NTsizes);
NTCIs = NTtvals.*(NTstdevs./NTsqrtsizes);
clear NTquartiles
NTquartiles(1,:) = quantile(NTday0,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday2,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday3,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday7,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday12,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday17,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday20,[0.25, 0.75]);

figure
% errorbar(allexpdaysbut5,NTmedians,NTmedians'-NTquartiles(:,1),NTquartiles(:,2)-NTmedians','LineWidth',3)
errorbar(allexpdaysbut5,NTaverages,NTaverages-NTmins,NTmaxes-NTaverages,'LineWidth',3)
hold
plot(allexpdaysbut5,NTmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])


%%
 save('ExpoGroupTumorVolumesCRN.mat')
