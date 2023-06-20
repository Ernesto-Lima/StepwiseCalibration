clear all
close all

RespondersC1 = [0
4.553031882];
RespondersC2 = [43.00197972
74.83573326];
RespondersC3 = [82.17928073
81.85586735];

RespondersT1 = [70.45621781
9.648831284
69.83635559
0];
RespondersT2 = [70.73954984
77.90301999
78.59639312
0.201168694];
RespondersT3 = [0
27.71014493
47.11853307
81.28043282];

NonRespondersC1 = [0
88.53877047
1.579961464];
NonRespondersC2 = [42.16070554
86.51951615
96.3912699];
NonRespondersC3 = [93.20511021
73.90814314
95.83096139];

NonRespondersT1 = [0.392296719
23.79126731
29.405965
0];
NonRespondersT2 = [97.26416312
90.42154567
77.07435642
89.29782904];
NonRespondersT3 = [99.18509895
99.42800073
94.04026311
79.57173834];


%%

Responders1 = [RespondersC1;RespondersT1];
Responders2 = [RespondersC2;RespondersT2];
Responders3 = [RespondersC3;RespondersT3];

Rexptimes = [0 2 5];

NonResponders1 = [NonRespondersC1;NonRespondersT1];
NonResponders2 = [NonRespondersC2;NonRespondersT2];
NonResponders3 = [NonRespondersC3;NonRespondersT3];

Nexptimes = [0 2 5];


Responders = [Responders1;Responders2;Responders3];
NonResponders = [NonResponders1;NonResponders2;NonResponders3];

gR = [zeros(length(Responders1), 1); 2*ones(length(Responders2), 1); 5*ones(length(Responders3), 1)];
gN = [zeros(length(NonResponders1), 1); 2*ones(length(NonResponders2), 1); 5*ones(length(NonResponders3), 1)];
%%
close all

figure
boxplot(Responders,gR,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Rmedians = [bpchil(4).YData(1),bpchil(5).YData(1),bpchil(6).YData(1)];
Rmedians = fliplr(Rmedians);
Rlowerq = [bpchil(4+3).YData(1),bpchil(5+3).YData(1),bpchil(6+3).YData(1)];
Rlowerq = fliplr(Rlowerq);
Rupperq = [bpchil(4+3).YData(2),bpchil(5+3).YData(2),bpchil(6+3).YData(2)];
Rupperq = fliplr(Rupperq);

hold on
scatter(1*ones(length(RespondersC1),1),RespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(RespondersT1),1),RespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersC2),1),RespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersT2),1),RespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersC3),1),RespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersT3),1),RespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
plot(0:6,zeros(1,7),'k--')
legend('Controls','Treated','location','northwest')
title('Responding tumor hypoxic fractions over time')
ylabel('Hypoxic fraction')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')
ylim([-10 110])


figure
boxplot(NonResponders,gN,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Nmedians = [bpchil(4).YData(1),bpchil(5).YData(1),bpchil(6).YData(1)];
Nmedians = fliplr(Nmedians);
Nlowerq = [bpchil(4+3).YData(1),bpchil(5+3).YData(1),bpchil(6+3).YData(1)];
Nlowerq = fliplr(Nlowerq);
Nupperq = [bpchil(4+3).YData(2),bpchil(5+3).YData(2),bpchil(6+3).YData(2)];
Nupperq = fliplr(Nupperq);
hold on
scatter(1*ones(length(NonRespondersC1),1),NonRespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersT1),1),NonRespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersC2),1),NonRespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersT2),1),NonRespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersC3),1),NonRespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersT3),1),NonRespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
plot(0:6,zeros(1,7),'k--')
legend('Controls','Treated','location','northwest')
title('Non-responding tumor hypoxic fractions over time')
ylabel('Hypoxic fraction')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')
ylim([-10 110])

%%
Control1 = [RespondersC1;NonRespondersC1];
Control2 = [RespondersC2;NonRespondersC2];
Control3 = [RespondersC3;NonRespondersC3];
Cexptimes = [0 2 5];

Treated1 = [RespondersT1;NonRespondersT1];
Treated2 = [RespondersT2;NonRespondersT2];
Treated3 = [RespondersT3;NonRespondersT3];
Texptimes = [0 2 5];


Controls = [Control1;Control2;Control3];
Treated = [Treated1;Treated2;Treated3];

gC = [zeros(length(Control1), 1); 2*ones(length(Control2), 1); 5*ones(length(Control3), 1)];
gT = [zeros(length(Treated1), 1); 2*ones(length(Treated2), 1); 5*ones(length(Treated3), 1)];

%%

close all

figure
boxplot(Controls,gC,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Cmedians = [bpchil(4).YData(1),bpchil(5).YData(1),bpchil(6).YData(1)];
Cmedians = fliplr(Cmedians);
Clowerq = [bpchil(4+3).YData(1),bpchil(5+3).YData(1),bpchil(6+3).YData(1)];
Clowerq = fliplr(Clowerq);
Cupperq = [bpchil(4+3).YData(2),bpchil(5+3).YData(2),bpchil(6+3).YData(2)];
Cupperq = fliplr(Cupperq);
hold on
scatter(1*ones(length(RespondersC1),1),RespondersC1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersC1),1),NonRespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersC2),1),RespondersC2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersC2),1),NonRespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersC3),1),RespondersC3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersC3),1),NonRespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
plot(0:6,zeros(1,7),'k--')
legend('Responders','Non-Responders','location','northwest')
title('Control tumor hypoxic fractions over time')
ylabel('Hypoxic fraction')
xlabel('Days post treatment')
ylim([-10 110])
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')



figure
boxplot(Treated,gT,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Tmedians = [bpchil(4).YData(1),bpchil(5).YData(1),bpchil(6).YData(1)];
Tmedians = fliplr(Tmedians);
Tlowerq = [bpchil(4+3).YData(1),bpchil(5+3).YData(1),bpchil(6+3).YData(1)];
Tlowerq = fliplr(Tlowerq);
Tupperq = [bpchil(4+3).YData(2),bpchil(5+3).YData(2),bpchil(6+3).YData(2)];
Tupperq = fliplr(Tupperq);
hold on
scatter(1*ones(length(RespondersT1),1),RespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersT1),1),NonRespondersT1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersT2),1),RespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersT2),1),NonRespondersT2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersT3),1),RespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersT3),1),NonRespondersT3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
plot(0:6,zeros(1,7),'k--')
legend('Responders','Non-Responders','location','northwest')
title('Treated tumor hypoxic fractions over time')
ylabel('Hypoxic fraction')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')
ylim([-10 110])

save('HypoxicFractions.mat')

%%
%FMISO data
close all
set(0,'defaulttextinterpreter','latex')

holistic = [0.00	43.00	82.18
4.55	74.84	81.86
70.46	70.74	0.00
9.65	77.90	27.71
69.84	78.60	47.12
0.00	0.20	81.28
0.00	42.16	93.21
0.39	97.26	99.19
23.79	90.42	99.43
29.41	77.07	94.04
88.54	86.52	73.91
1.58	96.39	95.83
0.00	89.30	79.57];

perday = [3.34	18.20	95.71 %mean+2SD
28.29	58.45	91.07
83.35	44.54	2.65
47.76	63.28	45.07
81.22	55.17	57.83
0.00	0.00	86.96
0.00	15.02	98.12
17.55	91.92	99.87
53.68	80.49	99.98
61.55	46.06	97.69
95.64	73.80	82.44
4.03	90.90	97.52
8.24	62.74	85.47];

figure
hold
RC1 = [0 2 5; holistic(1,:)];
RC2 = [0 2 5; holistic(2,:)];

RT1 = [0 2 5; holistic(3,:)];
RT2 = [0 2 5; holistic(4,:)];
RT3 = [0 2 5; holistic(5,:)];
RT4 = [0 2 5; holistic(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])

figure
hold

NC1 = [0 2 5; holistic(7,:)];
NC2 = [0 2 5; holistic(11,:)];
NC3 = [0 2 5; holistic(12,:)];

NT1 = [0 2 5; holistic(8,:)];
NT2 = [0 2 5; holistic(9,:)];
NT3 = [0 2 5; holistic(10,:)];
NT4 = [0 2 5; holistic(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])


figure
hold
RC1 = [0 2 5; perday(1,:)];
RC2 = [0 2 5; perday(2,:)];

RT1 = [0 2 5; perday(3,:)];
RT2 = [0 2 5; perday(4,:)];
RT3 = [0 2 5; perday(5,:)];
RT4 = [0 2 5; perday(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])


figure
hold

NC1 = [0 2 5; perday(7,:)];
NC2 = [0 2 5; perday(11,:)];
NC3 = [0 2 5; perday(12,:)];

NT1 = [0 2 5; perday(8,:)];
NT2 = [0 2 5; perday(9,:)];
NT3 = [0 2 5; perday(10,:)];
NT4 = [0 2 5; perday(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])

%%
close all

figure
subplot(2,2,1)
boxplot(holistic(1:6,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Across all days threshold, responders')
ylim([-40 110])

subplot(2,2,3)
boxplot(perday(1:6,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Per day thresholds, responders')
ylim([-40 110])


subplot(2,2,2)
boxplot(holistic(7:end,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Across all days threshold, non-responders')
ylim([-40 110])

subplot(2,2,4)
boxplot(perday(7:end,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Per day thresholds, non-responders')
ylim([-40 110])


%%
close all

MeanMuscleSUVallMice = [0.07	0.15	0.09
0.07	0.14	0.11
0.11	0.11	0.067
0.07	0.16	0.1
0.1	0.17	0.09
0.02	0.06	0.11
0.05	0.1	0.08
0.06	0.11	0.1
0.1	0.08	0.1
0.1	0.16	0.09
0.12	0.15	0.1
0.09	0.17	0.15
0.08	0.11	0.08];


figure
boxplot(MeanMuscleSUVallMice,[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Day')
ylabel('Mean muscle SUV')
title('All mice')
ylim([0 0.2])


%%
close all

figure
hold
RC1 = [0 2 5; MeanMuscleSUVallMice(1,:)];
RC2 = [0 2 5; MeanMuscleSUVallMice(2,:)];

RT1 = [0 2 5; MeanMuscleSUVallMice(3,:)];
RT2 = [0 2 5; MeanMuscleSUVallMice(4,:)];
RT3 = [0 2 5; MeanMuscleSUVallMice(5,:)];
RT4 = [0 2 5; MeanMuscleSUVallMice(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,0.1*ones(size(0:10)),'k--')
plot(0:10,0.2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean muscle SUV')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.02 0.18])

figure
hold

NC1 = [0 2 5; MeanMuscleSUVallMice(7,:)];
NC2 = [0 2 5; MeanMuscleSUVallMice(11,:)];
NC3 = [0 2 5; MeanMuscleSUVallMice(12,:)];

NT1 = [0 2 5; MeanMuscleSUVallMice(8,:)];
NT2 = [0 2 5; MeanMuscleSUVallMice(9,:)];
NT3 = [0 2 5; MeanMuscleSUVallMice(10,:)];
NT4 = [0 2 5; MeanMuscleSUVallMice(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,0.1*ones(size(0:10)),'k--')
plot(0:10,0.2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean muscle SUV')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.02 0.18])


%%
close all
figure

errorbar([0 2 5],[0.08 0.13 0.10],[0.03 0.04 0.02],'LineWidth',2,'LineStyle','none','Color',[0 0 0])
hold
plot([0 2 5],[0.08 0.13 0.10],'ko','MarkerFaceColor','k')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Day')
ylabel('Mean muscle SUV')
xlim([-1 6])



%%
close all

MeanTumorSUVallMice = [0.11	0.19	0.16
0.11	0.23	0.19
0.17	0.23	0.09
0.12	0.25	0.14
0.19	0.23	0.15
0.05	0.07	0.23
0.06	0.13	0.23
0.11	0.18	0.22
0.13	0.16	0.25
0.13	0.18	0.23
0.06	0.17	0.2
0.07	0.3	    0.29
0.06	0.21	0.22];


figure
boxplot(MeanTumorSUVallMice,[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Day')
ylabel('Mean tumor SUV')
title('All mice')
ylim([0 0.4])



%%
close all
figure
hold
RC1 = [0 2 5; MeanTumorSUVallMice(1,:)];
RC2 = [0 2 5; MeanTumorSUVallMice(2,:)];

RT1 = [0 2 5; MeanTumorSUVallMice(3,:)];
RT2 = [0 2 5; MeanTumorSUVallMice(4,:)];
RT3 = [0 2 5; MeanTumorSUVallMice(5,:)];
RT4 = [0 2 5; MeanTumorSUVallMice(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,0.1*ones(size(0:10)),'k--')
plot(0:10,0.2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean tumor SUV')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.05 0.3])

figure
hold

NC1 = [0 2 5; MeanTumorSUVallMice(7,:)];
NC2 = [0 2 5; MeanTumorSUVallMice(11,:)];
NC3 = [0 2 5; MeanTumorSUVallMice(12,:)];

NT1 = [0 2 5; MeanTumorSUVallMice(8,:)];
NT2 = [0 2 5; MeanTumorSUVallMice(9,:)];
NT3 = [0 2 5; MeanTumorSUVallMice(10,:)];
NT4 = [0 2 5; MeanTumorSUVallMice(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,0.1*ones(size(0:10)),'k--')
plot(0:10,0.2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean tumor SUV')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.05 0.3])

%%
close all
figure
hold
RC1 = [0 2 5; MeanTumorSUVallMice(1,:)./MeanMuscleSUVallMice(1,:)];
RC2 = [0 2 5; MeanTumorSUVallMice(2,:)./MeanMuscleSUVallMice(2,:)];

RT1 = [0 2 5; MeanTumorSUVallMice(3,:)./MeanMuscleSUVallMice(3,:)];
RT2 = [0 2 5; MeanTumorSUVallMice(4,:)./MeanMuscleSUVallMice(4,:)];
RT3 = [0 2 5; MeanTumorSUVallMice(5,:)./MeanMuscleSUVallMice(5,:)];
RT4 = [0 2 5; MeanTumorSUVallMice(6,:)./MeanMuscleSUVallMice(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,1*ones(size(0:10)),'k--')
plot(0:10,2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean SUV ratio (tumor/muscle)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.5 3])

figure
hold

NC1 = [0 2 5; MeanTumorSUVallMice(7,:)./MeanMuscleSUVallMice(7,:)];
NC2 = [0 2 5; MeanTumorSUVallMice(11,:)./MeanMuscleSUVallMice(11,:)];
NC3 = [0 2 5; MeanTumorSUVallMice(12,:)./MeanMuscleSUVallMice(12,:)];

NT1 = [0 2 5; MeanTumorSUVallMice(8,:)./MeanMuscleSUVallMice(8,:)];
NT2 = [0 2 5; MeanTumorSUVallMice(9,:)./MeanMuscleSUVallMice(9,:)];
NT3 = [0 2 5; MeanTumorSUVallMice(10,:)./MeanMuscleSUVallMice(10,:)];
NT4 = [0 2 5; MeanTumorSUVallMice(13,:)./MeanMuscleSUVallMice(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,1*ones(size(0:10)),'k--')
plot(0:10,2*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Mean SUV ratio (tumor/muscle)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0.5 3])


%%
ratio = MeanTumorSUVallMice./MeanMuscleSUVallMice;
figure
subplot(1,2,1)
boxplot(ratio(1:6,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Day')
ylabel('Mean SUV ratio (tumor/muscle)')
title('Responders')
ylim([0 3])

subplot(1,2,2)
boxplot(ratio(7:end,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Day')
ylabel('Mean SUV ratio (tumor/muscle)')
title('Non-responders')
ylim([0 3])

%% Hypoxia per day using mean + 3SD
close all
set(0,'defaulttextinterpreter','latex')

perday = [0.00	6.83	90.34
4.55	39.44	86.88
70.46	10.93	0.00
9.65	40.37	36.43
69.84	35.10	52.91
0.00	0.00	84.24
0.00	0.00	96.14
0.39	83.75	99.52
23.79	57.73	99.89
29.41	20.44	95.89
88.54	48.43	78.22
1.58	80.71	96.71
0.00	29.65	82.49];

figure
hold
RC1 = [0 2 5; perday(1,:)];
RC2 = [0 2 5; perday(2,:)];

RT1 = [0 2 5; perday(3,:)];
RT2 = [0 2 5; perday(4,:)];
RT3 = [0 2 5; perday(5,:)];
RT4 = [0 2 5; perday(6,:)];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])


figure
hold

NC1 = [0 2 5; perday(7,:)];
NC2 = [0 2 5; perday(11,:)];
NC3 = [0 2 5; perday(12,:)];

NT1 = [0 2 5; perday(8,:)];
NT2 = [0 2 5; perday(9,:)];
NT3 = [0 2 5; perday(10,:)];
NT4 = [0 2 5; perday(13,:)];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])

figure
subplot(1,2,1)
boxplot(perday(1:6,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('3SD per day thresholds, responders')
ylim([-40 110])

subplot(1,2,2)
boxplot(perday(7:end,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('3SD per day thresholds, non-responders')
ylim([-40 110])


%% Hypoxia per day using mean + 2SD with +-1SD for error bars
close all
set(0,'defaulttextinterpreter','latex')

perday = [3.34	18.20	95.71
28.29	58.45	91.07
83.35	44.54	2.65
47.76	63.28	45.07
81.22	55.17	57.83
0.00	0.00	86.96
0.00	15.02	98.12
17.55	91.92	99.87
53.68	80.49	99.98
61.55	46.06	97.69
95.64	73.80	82.44
4.03	90.90	97.52
8.24	62.74	85.47];

upper = [23.70	43.00	99.62
46.27	74.84	95.98
90.57	70.74	27.21
66.20	77.90	62.06
87.13	78.60	66.11
0.12	0.20	91.76
0.47	42.16	99.90
35.95	97.26	100.00
68.24	90.42	100.00
80.53	77.07	99.30
98.05	86.52	89.36
7.76	96.39	98.48
22.78	89.30	90.18];

lower = [0.00	6.83	90.34
4.55	39.44	86.88
70.46	10.93	0.00
9.65	40.37	36.43
69.84	35.10	52.91
0.00	0.00	84.24
0.00	0.00	96.14
0.39	83.75	99.52
23.79	57.73	99.89
29.41	20.44	95.89
88.54	48.43	78.22
1.58	80.71	96.71
0.00	29.65	82.49];

figure
hold
RC1 = [0 2 5; perday(1,:);lower(1,:);upper(1,:)];
RC2 = [0 2 5; perday(2,:);lower(2,:);upper(2,:)];

RT1 = [0 2 5; perday(3,:);lower(3,:);upper(3,:)];
RT2 = [0 2 5; perday(4,:);lower(4,:);upper(4,:)];
RT3 = [0 2 5; perday(5,:);lower(5,:);upper(5,:)];
RT4 = [0 2 5; perday(6,:);lower(6,:);upper(6,:)];

% plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
% plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
% plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
% plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
% plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
% plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)

errorbar(RC1(1,:),RC1(2,:),RC1(2,:)-lower(1,:),upper(1,:)-RC1(2,:),'--','LineWidth',3)
errorbar(RC2(1,:),RC2(2,:),RC2(2,:)-lower(2,:),upper(2,:)-RC2(2,:),'--','LineWidth',3)
errorbar(RT1(1,:),RT1(2,:),RT1(2,:)-lower(3,:),upper(3,:)-RT1(2,:),'-','LineWidth',3)
errorbar(RT2(1,:),RT2(2,:),RT2(2,:)-lower(4,:),upper(4,:)-RT2(2,:),'-','LineWidth',3)
errorbar(RT3(1,:),RT3(2,:),RT3(2,:)-lower(5,:),upper(5,:)-RT3(2,:),'-','LineWidth',3)
errorbar(RT4(1,:),RT4(2,:),RT4(2,:)-lower(6,:),upper(6,:)-RT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])


figure
hold

NC1 = [0 2 5; perday(7,:);lower(7,:);upper(7,:)];
NC2 = [0 2 5; perday(11,:);lower(11,:);upper(11,:)];
NC3 = [0 2 5; perday(12,:);lower(12,:);upper(12,:)];

NT1 = [0 2 5; perday(8,:);lower(8,:);upper(8,:)];
NT2 = [0 2 5; perday(9,:);lower(9,:);upper(9,:)];
NT3 = [0 2 5; perday(10,:);lower(10,:);upper(10,:)];
NT4 = [0 2 5; perday(13,:);lower(13,:);upper(13,:)];
 
% plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
% plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
% plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
% plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
% plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
% plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
% plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)

errorbar(NC1(1,:),NC1(2,:),NC1(2,:)-lower(7,:),upper(7,:)-NC1(2,:),'--','LineWidth',3)
errorbar(NC2(1,:),NC2(2,:),NC2(2,:)-lower(11,:),upper(11,:)-NC2(2,:),'--','LineWidth',3)
errorbar(NC3(1,:),NC3(2,:),NC3(2,:)-lower(12,:),upper(12,:)-NC3(2,:),'-','LineWidth',3)
errorbar(NT1(1,:),NT1(2,:),NT1(2,:)-lower(8,:),upper(8,:)-NT1(2,:),'-','LineWidth',3)
errorbar(NT2(1,:),NT2(2,:),NT2(2,:)-lower(9,:),upper(9,:)-NT2(2,:),'-','LineWidth',3)
errorbar(NT3(1,:),NT3(2,:),NT3(2,:)-lower(10,:),upper(10,:)-NT3(2,:),'-','LineWidth',3)
errorbar(NT4(1,:),NT4(2,:),NT4(2,:)-lower(13,:),upper(13,:)-NT4(2,:),'-','LineWidth',3)

plot(0:10,25*ones(size(0:10)),'k--')
plot(0:10,50*ones(size(0:10)),'k--')
plot(0:10,75*ones(size(0:10)),'k--')

xlabel('Days')
ylabel('Hypoxic fraction')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','location','best')
ylim([0 100])

figure
subplot(1,2,1)
boxplot(perday(1:6,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Per day thresholds, responders')
ylim([-40 110])

subplot(1,2,2)
boxplot(perday(7:end,:),[0,2,5],'Whisker',3,'notch','on')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('Hypoxic fraction')
title('Per day thresholds, non-responders')
ylim([-40 110])

save('HypoxicFractions.mat')
