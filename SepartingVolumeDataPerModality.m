%%
%FMISO data
close all
set(0,'defaulttextinterpreter','latex')

figure
hold
RC1 = [0 2 3 7 12 17 20; 57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
RC2 = [0 2 3 7 12 17 20; 45.33	139.28	68.11	124.69	145.13	427.76	1009.77];

RT1 = [0 2 3 7 12 ; 57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
RT3 = [0 2 3 7 12 17 20; 73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 101.02	86.35	50.07	37.40	13.99	0.00	0.00];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

figure
hold

NC1 = [0 2 3 7 12 17 20;94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 137.05	543.36	785.75	1000.06	1156.69	2778.13];

NT1 = [0 2 3 7 12 17 20;84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17 ;102.08	148.76	143.58	399.48	1370.74	3529.60];
NT3 = [0 2 3 5 7 12; 143.69	359.80	338.15	538.35	730.50	970.25];
NT4 = [0 2 3 5 7 12;119.92	242.78	283.04	497.64	970.25	2612.31];
 
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

%%
%MRI data

figure
hold

RC1 = [0 3 5 7 9 10; 127.14	247.24	228.74	433.44	758.10	400.61];

RT1 = [0 3 5 7 9; 126.78	133.79	168.13		344.62	477.58];
RT2 = [0 3 5 6 7 10 12 13 15; 117.36	276.38	243.72	203.74	220.43	561.95	477.63	1251.79	1726.17];

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('MRI responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Treated mouse 1','Treated mouse 2','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])
xlim([0 20])

figure
hold

NC1 = [0 3 5 6 7 10 12;133.68	315.17	571.64	735.01	915.53	2571.14	4667.70];

NT1 = [0 3 5 6 7;162.81	323.90	466.64	879.66	1319.11];
NT2 = [0 3 5 7 9 10;113.54	217.57	287.00		546.59	446.26	620.01];
NT3 = [0 3 5 7 9 10; 135.08	241.68	293.33		393.18	321.18	597.09];
NT4 = [0 3 5 6 7 10 13;136.54	323.84	420.75	441.04	407.47	475.14	1222.79];

plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')


xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('MRI non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])
xlim([0 20])


%%
%FMISO data
close all
clear all
set(0,'defaulttextinterpreter','latex')

PercentError = 0.05; %from caliper measurements

figure
hold
RC1 = [0 2 3 7 12 17 20; 57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
RC2 = [0 2 3 7 12 17 20; 45.33	139.28	68.11	124.69	145.13	427.76	1009.77];

RT1 = [0 2 3 7 12 ; 57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
RT3 = [0 2 3 7 12 17 20; 73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 101.02	86.35	50.07	37.40	13.99	0.00	0.00];


errorbar(RC1(1,:),RC1(2,:),RC1(2,:)*PercentError,'--','LineWidth',3)
errorbar(RC2(1,:),RC2(2,:),RC2(2,:)*PercentError,'--','LineWidth',3)
errorbar(RT1(1,:),RT1(2,:),RT1(2,:)*PercentError,'-','LineWidth',3)
errorbar(RT2(1,:),RT2(2,:),RT2(2,:)*PercentError,'-','LineWidth',3)
errorbar(RT3(1,:),RT3(2,:),RT3(2,:)*PercentError,'-','LineWidth',3)
errorbar(RT4(1,:),RT4(2,:),RT4(2,:)*PercentError,'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('FMISO responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

figure
hold

NC1 = [0 2 3 7 12 17 20;94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 137.05	543.36	785.75	1000.06	1156.69	2778.13];

NT1 = [0 2 3 7 12 17 20;84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17 ;102.08	148.76	143.58	399.48	1370.74	3529.60];
NT3 = [0 2 3 5 7 12; 143.69	359.80	338.15	538.35	730.50	970.25];
NT4 = [0 2 3 5 7 12;119.92	242.78	283.04	497.64	970.25	2612.31];

 
errorbar(NC1(1,:),NC1(2,:),NC1(2,:)*PercentError,'--','LineWidth',3)
errorbar(NC2(1,:),NC2(2,:),NC2(2,:)*PercentError,'--','LineWidth',3)
errorbar(NC3(1,:),NC3(2,:),NC3(2,:)*PercentError,'--','LineWidth',3)
errorbar(NT1(1,:),NT1(2,:),NT1(2,:)*PercentError,'-','LineWidth',3)
errorbar(NT2(1,:),NT2(2,:),NT2(2,:)*PercentError,'-','LineWidth',3)
errorbar(NT3(1,:),NT3(2,:),NT3(2,:)*PercentError,'-','LineWidth',3)
errorbar(NT4(1,:),NT4(2,:),NT4(2,:)*PercentError,'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('FMISO non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

save('IndividualMouseTumorVolumes.mat')

