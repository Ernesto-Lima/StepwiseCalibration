clear all
close all

RespondersC1 = [127.14
    57.65
45.33];
RespondersC2 = [142.50
139.28];
RespondersC3 = [247.24
    61.16
68.11];
RespondersC4 = [228.74];
RespondersC5 = [];
RespondersC6 = [433.44
    96.89
124.69];
RespondersC7 = [758.10];
RespondersC8 = [400.61];
RespondersC9 = [614.94
145.13];
RespondersC10 = [];
RespondersC11 = [];
RespondersC12 = [2658.60
427.76];
RespondersC13 = [3346.06
1009.77];

RespondersT1 = [126.78
117.36
57.85
73.48
101.02
125.93];
RespondersT2 = [84.54
110.23
86.35
136.89];
RespondersT3 = [133.79
276.38
63.42
96.89
50.07
157.76];
RespondersT4 = [168.13
243.72];
RespondersT5 = [203.74];
RespondersT6 = [344.62
220.43
110.23
104.76
37.40
253.89];
RespondersT7 = [477.58];
RespondersT8 = [561.95];
RespondersT9 = [477.63
    605.77
270.96
13.99
347.28];
RespondersT10 = [1251.79];
RespondersT11 = [1726.17];
RespondersT12 = [872.93
0.00
826.24];
RespondersT13 = [1376.87
0.00
1254.71];

NonRespondersC1 = [133.68
    94.20
146.37
137.05];
NonRespondersC2 = [276.04
131.00
543.36];
NonRespondersC3 = [315.17
260.87
470.27
785.75];
NonRespondersC4 = [571.64
800.90
1000.06];
NonRespondersC5 = [735.01];
NonRespondersC6 = [915.53
288.15
2042.99
1156.69];
NonRespondersC7 = [];
NonRespondersC8 = [2571.14];
NonRespondersC9 = [4667.70
    1206.55
2023.93
2778.13];
NonRespondersC10 = [];
NonRespondersC11 = [];
NonRespondersC12 = [3226.66];
NonRespondersC13 = [4496.46];

NonRespondersT1 = [162.81
113.54
135.08
136.54
    84.37
102.08
143.69
119.92];
NonRespondersT2 = [207.33
148.76
359.80
242.78];
NonRespondersT3 = [323.90
217.57
241.68
323.84
    187.16
143.58
338.15
283.04];
NonRespondersT4 = [466.64
287.00
293.33
420.75
    538.35
497.64];
NonRespondersT5 = [879.66
    441.04];
NonRespondersT6 = [1319.11
546.59
393.18
407.47
    518.10
399.48
730.50
970.25];
NonRespondersT7 = [446.26
321.18];
NonRespondersT8 = [620.01
597.09
475.14];
NonRespondersT9 = [2009.14
1370.74
970.25
2612.31];
NonRespondersT10 = [1222.79];
NonRespondersT11 = [];
NonRespondersT12 = [4606.95
3529.60];
NonRespondersT13 = [7395.53];

%%

Responders1 = [RespondersC1;RespondersT1];
Responders2 = [RespondersC2;RespondersT2];
Responders3 = [RespondersC3;RespondersT3];
Responders4 = [RespondersC4;RespondersT4];
Responders5 = [RespondersC5;RespondersT5];
Responders6 = [RespondersC6;RespondersT6];
Responders7 = [RespondersC7;RespondersT7];
Responders8 = [RespondersC8;RespondersT8];
Responders9 = [RespondersC9;RespondersT9];
Responders10 = [RespondersC10;RespondersT10];
Responders11 = [RespondersC11;RespondersT11];
Responders12 = [RespondersC12;RespondersT12];
Responders13 = [RespondersC13;RespondersT13];
Rexptimes = [0 2 3 5 6 7 9 10 12 13 15 17 20];

NonResponders1 = [NonRespondersC1;NonRespondersT1];
NonResponders2 = [NonRespondersC2;NonRespondersT2];
NonResponders3 = [NonRespondersC3;NonRespondersT3];
NonResponders4 = [NonRespondersC4;NonRespondersT4];
NonResponders5 = [NonRespondersC5;NonRespondersT5];
NonResponders6 = [NonRespondersC6;NonRespondersT6];
NonResponders7 = [NonRespondersC7;NonRespondersT7];
NonResponders8 = [NonRespondersC8;NonRespondersT8];
NonResponders9 = [NonRespondersC9;NonRespondersT9];
NonResponders10 = [NonRespondersC10;NonRespondersT10];
NonResponders12 = [NonRespondersC12;NonRespondersT12];
NonResponders13 = [NonRespondersC13;NonRespondersT13];
Nexptimes = [0 2 3 5 6 7 9 10 12 13 17 20];


Responders = [Responders1;Responders2;Responders3;Responders4;Responders5;Responders6;Responders7;Responders8;Responders9;Responders10;Responders11;Responders12;Responders13];
NonResponders = [NonResponders1;NonResponders2;NonResponders3;NonResponders4;NonResponders5;NonResponders6;NonResponders7;NonResponders8;NonResponders9;NonResponders10;NonResponders12;NonResponders13];

gR = [zeros(length(Responders1), 1); 2*ones(length(Responders2), 1); 3*ones(length(Responders3), 1); 5*ones(length(Responders4), 1); 6*ones(length(Responders5), 1); 7*ones(length(Responders6), 1); 9*ones(length(Responders7), 1); 10*ones(length(Responders8), 1); 12*ones(length(Responders9), 1); 13*ones(length(Responders10), 1); 15*ones(length(Responders11), 1); 17*ones(length(Responders12), 1); 20*ones(length(Responders13), 1)];
gN = [zeros(length(NonResponders1), 1); 2*ones(length(NonResponders2), 1); 3*ones(length(NonResponders3), 1); 5*ones(length(NonResponders4), 1); 6*ones(length(NonResponders5), 1); 7*ones(length(NonResponders6), 1); 9*ones(length(NonResponders7), 1); 10*ones(length(NonResponders8), 1); 12*ones(length(NonResponders9), 1); 13*ones(length(NonResponders10), 1); 17*ones(length(NonResponders12), 1); 20*ones(length(NonResponders13), 1)];
%%
close all

figure
boxplot(Responders,gR,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Rmedians = [bpchil(14).YData(1),bpchil(15).YData(1),bpchil(16).YData(1),bpchil(17).YData(1),bpchil(18).YData(1),bpchil(19).YData(1),bpchil(20).YData(1),bpchil(21).YData(1),bpchil(22).YData(1),bpchil(23).YData(1),bpchil(24).YData(1),bpchil(25).YData(1),bpchil(26).YData(1)];
Rmedians = fliplr(Rmedians);
Rlowerq = [bpchil(14+13).YData(1),bpchil(15+13).YData(1),bpchil(16+13).YData(1),bpchil(17+13).YData(1),bpchil(18+13).YData(1),bpchil(19+13).YData(1),bpchil(20+13).YData(1),bpchil(21+13).YData(1),bpchil(22+13).YData(1),bpchil(23+13).YData(1),bpchil(24+13).YData(1),bpchil(25+13).YData(1),bpchil(26+13).YData(1)];
Rlowerq = fliplr(Rlowerq);
Rupperq = [bpchil(14+13).YData(2),bpchil(15+13).YData(2),bpchil(16+13).YData(2),bpchil(17+13).YData(2),bpchil(18+13).YData(2),bpchil(19+13).YData(2),bpchil(20+13).YData(2),bpchil(21+13).YData(2),bpchil(22+13).YData(2),bpchil(23+13).YData(2),bpchil(24+13).YData(2),bpchil(25+13).YData(2),bpchil(26+13).YData(2)];
Rupperq = fliplr(Rupperq);

hold on
% x = repmat(1:13,length(Responders),1);
% scatter(x(:),Responders(:),50,'k','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(RespondersC1),1),RespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(RespondersT1),1),RespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersC2),1),RespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersT2),1),RespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersC3),1),RespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersT3),1),RespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(RespondersC4),1),RespondersC4(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(RespondersT4),1),RespondersT4(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(RespondersC5),1),RespondersC5(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(RespondersT5),1),RespondersT5(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(RespondersC6),1),RespondersC6(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(RespondersT6),1),RespondersT6(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(RespondersC7),1),RespondersC7(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(RespondersT7),1),RespondersT7(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(RespondersC8),1),RespondersC8(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(RespondersT8),1),RespondersT8(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(RespondersC9),1),RespondersC9(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(RespondersT9),1),RespondersT9(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(RespondersC10),1),RespondersC10(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(RespondersT10),1),RespondersT10(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(RespondersC11),1),RespondersC11(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(RespondersT11),1),RespondersT11(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(RespondersC12),1),RespondersC12(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(RespondersT12),1),RespondersT12(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(13*ones(length(RespondersC13),1),RespondersC13(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(13*ones(length(RespondersT13),1),RespondersT13(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
% plot(x',Responders','LineWidth',1.5)
plot(0:14,zeros(1,15),'k--')
legend('Controls','Treated','location','northwest')
title('Responding tumor volumes over time')
ylabel('Tumor volume (mm^3)')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')



figure
boxplot(NonResponders,gN,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Nmedians = [bpchil(13).YData(1),bpchil(14).YData(1),bpchil(15).YData(1),bpchil(16).YData(1),bpchil(17).YData(1),bpchil(18).YData(1),bpchil(19).YData(1),bpchil(20).YData(1),bpchil(21).YData(1),bpchil(22).YData(1),bpchil(23).YData(1),bpchil(24).YData(1)];
Nmedians = fliplr(Nmedians);
Nlowerq = [bpchil(13+12).YData(1),bpchil(14+12).YData(1),bpchil(15+12).YData(1),bpchil(16+12).YData(1),bpchil(17+12).YData(1),bpchil(18+12).YData(1),bpchil(19+21).YData(1),bpchil(20+12).YData(1),bpchil(21+12).YData(1),bpchil(22+12).YData(1),bpchil(23+12).YData(1),bpchil(24+12).YData(1)];
Nlowerq = fliplr(Nlowerq);
Nupperq = [bpchil(13+12).YData(2),bpchil(14+12).YData(2),bpchil(15+12).YData(2),bpchil(16+12).YData(2),bpchil(17+12).YData(2),bpchil(18+12).YData(2),bpchil(19+21).YData(2),bpchil(20+12).YData(2),bpchil(21+12).YData(2),bpchil(22+12).YData(2),bpchil(23+12).YData(2),bpchil(24+12).YData(2)];
Nupperq = fliplr(Nupperq);
hold on
scatter(1*ones(length(NonRespondersC1),1),NonRespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersT1),1),NonRespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersC2),1),NonRespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersT2),1),NonRespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersC3),1),NonRespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersT3),1),NonRespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(NonRespondersC4),1),NonRespondersC4(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(NonRespondersT4),1),NonRespondersT4(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(NonRespondersC5),1),NonRespondersC5(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(NonRespondersT5),1),NonRespondersT5(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(NonRespondersC6),1),NonRespondersC6(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(NonRespondersT6),1),NonRespondersT6(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(NonRespondersC7),1),NonRespondersC7(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(NonRespondersT7),1),NonRespondersT7(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(NonRespondersC8),1),NonRespondersC8(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(NonRespondersT8),1),NonRespondersT8(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(NonRespondersC9),1),NonRespondersC9(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(NonRespondersT9),1),NonRespondersT9(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(NonRespondersC10),1),NonRespondersC10(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(NonRespondersT10),1),NonRespondersT10(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(NonRespondersC12),1),NonRespondersC12(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(NonRespondersT12),1),NonRespondersT12(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(NonRespondersC13),1),NonRespondersC13(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(NonRespondersT13),1),NonRespondersT13(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
% plot(x',Responders','LineWidth',1.5)
plot(0:14,zeros(1,15),'k--')
legend('Controls','Treated','location','northwest')
title('Non-responding tumor volumes over time')
ylabel('Tumor volume (mm^3)')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')

%%
Control1 = [RespondersC1;NonRespondersC1];
Control2 = [RespondersC2;NonRespondersC2];
Control3 = [RespondersC3;NonRespondersC3];
Control4 = [RespondersC4;NonRespondersC4];
Control5 = [RespondersC5;NonRespondersC5];
Control6 = [RespondersC6;NonRespondersC6];
Control7 = [RespondersC7;NonRespondersC7];
Control8 = [RespondersC8;NonRespondersC8];
Control9 = [RespondersC9;NonRespondersC9];
Control12 = [RespondersC12;NonRespondersC12];
Control13 = [RespondersC13;NonRespondersC13];
Cexptimes = [0 2 3 5 6 7 9 10 12 17 20];

Treated1 = [RespondersT1;NonRespondersT1];
Treated2 = [RespondersT2;NonRespondersT2];
Treated3 = [RespondersT3;NonRespondersT3];
Treated4 = [RespondersT4;NonRespondersT4];
Treated5 = [RespondersT5;NonRespondersT5];
Treated6 = [RespondersT6;NonRespondersT6];
Treated7 = [RespondersT7;NonRespondersT7];
Treated8 = [RespondersT8;NonRespondersT8];
Treated9 = [RespondersT9;NonRespondersT9];
Treated10 = [RespondersT10;NonRespondersT10];
Treated11 = [RespondersT11;NonRespondersT11];
Treated12 = [RespondersT12;NonRespondersT12];
Treated13 = [RespondersT13;NonRespondersT13];
Texptimes = [0 2 3 5 6 7 9 10 12 13 15 17 20];


Controls = [Control1;Control2;Control3;Control4;Control5;Control6;Control7;Control8;Control9;Control12;Control13];
Treated = [Treated1;Treated2;Treated3;Treated4;Treated5;Treated6;Treated7;Treated8;Treated9;Treated10;Treated11;Treated12;Treated13];

gC = [zeros(length(Control1), 1); 2*ones(length(Control2), 1); 3*ones(length(Control3), 1); 5*ones(length(Control4), 1); 6*ones(length(Control5), 1); 7*ones(length(Control6), 1); 9*ones(length(Control7), 1); 10*ones(length(Control8), 1); 12*ones(length(Control9), 1); 17*ones(length(Control12), 1); 20*ones(length(Control13), 1)];
gT = [zeros(length(Treated1), 1); 2*ones(length(Treated2), 1); 3*ones(length(Treated3), 1); 5*ones(length(Treated4), 1); 6*ones(length(Treated5), 1); 7*ones(length(Treated6), 1); 9*ones(length(Treated7), 1); 10*ones(length(Treated8), 1); 12*ones(length(Treated9), 1); 13*ones(length(Treated10), 1); 15*ones(length(Treated11), 1); 17*ones(length(Treated12), 1); 20*ones(length(Treated13), 1)];

%%

close all

figure
boxplot(Controls,gC,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
lines = findobj(gcf, 'type', 'line', 'Tag', 'Median');
ax = gca();  
b = ax.Children;
bpchil = b.Children;
Cmedians = [bpchil(12).YData(1),bpchil(13).YData(1),bpchil(14).YData(1),bpchil(15).YData(1),bpchil(16).YData(1),bpchil(17).YData(1),bpchil(18).YData(1),bpchil(19).YData(1),bpchil(20).YData(1),bpchil(21).YData(1),bpchil(22).YData(1)];
Cmedians = fliplr(Cmedians);
Clowerq = [bpchil(12+11).YData(1),bpchil(13+11).YData(1),bpchil(14+11).YData(1),bpchil(15+11).YData(1),bpchil(16+11).YData(1),bpchil(17+11).YData(1),bpchil(18+11).YData(1),bpchil(19+11).YData(1),bpchil(20+11).YData(1),bpchil(21+11).YData(1),bpchil(22+11).YData(1)];
Clowerq = fliplr(Clowerq);
Cupperq = [bpchil(12+11).YData(2),bpchil(13+11).YData(2),bpchil(14+11).YData(2),bpchil(15+11).YData(2),bpchil(16+11).YData(2),bpchil(17+11).YData(2),bpchil(18+11).YData(2),bpchil(19+11).YData(2),bpchil(20+11).YData(2),bpchil(21+11).YData(2),bpchil(22+11).YData(2)];
Cupperq = fliplr(Cupperq);
hold on
% x = repmat(1:13,length(Responders),1);
% scatter(x(:),Responders(:),50,'k','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(RespondersC1),1),RespondersC1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersC1),1),NonRespondersC1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersC2),1),RespondersC2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersC2),1),NonRespondersC2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersC3),1),RespondersC3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersC3),1),NonRespondersC3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(RespondersC4),1),RespondersC4(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(NonRespondersC4),1),NonRespondersC4(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(RespondersC5),1),RespondersC5(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(NonRespondersC5),1),NonRespondersC5(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(RespondersC6),1),RespondersC6(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(NonRespondersC6),1),NonRespondersC6(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(RespondersC7),1),RespondersC7(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(NonRespondersC7),1),NonRespondersC7(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(RespondersC8),1),RespondersC8(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(NonRespondersC8),1),NonRespondersC8(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(RespondersC9),1),RespondersC9(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(NonRespondersC9),1),NonRespondersC9(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(RespondersC12),1),RespondersC12(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(NonRespondersC12),1),NonRespondersC12(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(RespondersC13),1),RespondersC13(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(NonRespondersC13),1),NonRespondersC13(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
% plot(x',Responders','LineWidth',1.5)
plot(0:14,zeros(1,15),'k--')
legend('Responders','Non-Responders','location','northwest')
title('Control tumor volumes over time')
ylabel('Tumor volume (mm^3)')
xlabel('Days post treatment')
ylim([-100 5000])
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
Tmedians = [bpchil(14).YData(1),bpchil(15).YData(1),bpchil(16).YData(1),bpchil(17).YData(1),bpchil(18).YData(1),bpchil(19).YData(1),bpchil(20).YData(1),bpchil(21).YData(1),bpchil(22).YData(1),bpchil(23).YData(1),bpchil(24).YData(1),bpchil(25).YData(1),bpchil(26).YData(1)];
Tmedians = fliplr(Tmedians);
Tlowerq = [bpchil(14+13).YData(1),bpchil(15+13).YData(1),bpchil(16+13).YData(1),bpchil(17+13).YData(1),bpchil(18+13).YData(1),bpchil(19+13).YData(1),bpchil(20+13).YData(1),bpchil(21+13).YData(1),bpchil(22+13).YData(1),bpchil(23+13).YData(1),bpchil(24+13).YData(1),bpchil(25+13).YData(1),bpchil(26+13).YData(1)];
Tlowerq = fliplr(Tlowerq);
Tupperq = [bpchil(14+13).YData(2),bpchil(15+13).YData(2),bpchil(16+13).YData(2),bpchil(17+13).YData(2),bpchil(18+13).YData(2),bpchil(19+13).YData(2),bpchil(20+13).YData(2),bpchil(21+13).YData(2),bpchil(22+13).YData(2),bpchil(23+13).YData(2),bpchil(24+13).YData(2),bpchil(25+13).YData(2),bpchil(26+13).YData(2)];
Tupperq = fliplr(Tupperq);
hold on
scatter(1*ones(length(RespondersT1),1),RespondersT1(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(1*ones(length(NonRespondersT1),1),NonRespondersT1(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(RespondersT2),1),RespondersT2(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(2*ones(length(NonRespondersT2),1),NonRespondersT2(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(RespondersT3),1),RespondersT3(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(3*ones(length(NonRespondersT3),1),NonRespondersT3(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(RespondersT4),1),RespondersT4(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(4*ones(length(NonRespondersT4),1),NonRespondersT4(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(RespondersT5),1),RespondersT5(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(5*ones(length(NonRespondersT5),1),NonRespondersT5(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(RespondersT6),1),RespondersT6(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(6*ones(length(NonRespondersT6),1),NonRespondersT6(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(RespondersT7),1),RespondersT7(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(7*ones(length(NonRespondersT7),1),NonRespondersT7(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(RespondersT8),1),RespondersT8(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(8*ones(length(NonRespondersT8),1),NonRespondersT8(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(RespondersT9),1),RespondersT9(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(9*ones(length(NonRespondersT9),1),NonRespondersT9(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(RespondersT10),1),RespondersT10(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(10*ones(length(NonRespondersT10),1),NonRespondersT10(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(RespondersT11),1),RespondersT11(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(11*ones(length(NonRespondersT11),1),NonRespondersT11(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(RespondersT12),1),RespondersT12(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(12*ones(length(NonRespondersT12),1),NonRespondersT12(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(13*ones(length(RespondersT13),1),RespondersT13(:),50,'b','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
scatter(13*ones(length(NonRespondersT13),1),NonRespondersT13(:),50,'r','filled','MarkerFaceAlpha',0.6','jitter','on','jitterAmount',0.05);
% plot(x',Responders','LineWidth',1.5)
plot(0:14,zeros(1,15),'k--')
legend('Responders','Non-Responders','location','northwest')
title('Treated tumor volumes over time')
ylabel('Tumor volume (mm^3)')
xlabel('Days post treatment')
set(gca,'linew',1.5)
set(gca,'FontSize',30)
set(gca,'FontName','Times New Roman')
ylim([-100 8000])

save('TumorVolumes.mat')
