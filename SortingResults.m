%%

close all
set(0,'defaulttextinterpreter','latex')

RC1 = [0 2 3 7 12 17 20; 57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
RC2 = [0 2 3 7 12 17 20; 45.33	139.28	68.11	124.69	145.13	427.76	1009.77];

RT1 = [0 2 3 7 12 ; 57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
RT3 = [0 2 3 7 12 17 20; 73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 101.02	86.35	50.07	37.40	13.99	0.00	0.00];

NC1 = [0 2 3 7 12 17 20;94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 137.05	543.36	785.75	1000.06	1156.69	2778.13];

NT1 = [0 2 3 7 12 17 20;84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17 ;102.08	148.76	143.58	399.48	1370.74	3529.60];
NT3 = [0 2 3 5 7 12; 143.69	359.80	338.15	538.35	730.50	970.25];
NT4 = [0 2 3 5 7 12;119.92	242.78	283.04	497.64	970.25	2612.31];

%%
%Without day zero normalization
figure
hold

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 2*','Treated mouse 3*','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

figure
hold

plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

%% control vs treated

figure
hold

plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)

plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','northwest')
ylim([0 8000])

figure
hold


plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','northwest')
ylim([0 8000])


%%

mouse = RC1;
excel = 0.1457;

close all
clear expfit
count = 1;
for jj = -1:0.001:0.30
    expfit(1,count) = jj;
    expfit(2,count) = sum((mouse(2,:)-mouse(2,1)*exp(mouse(1,:)*jj)).^2);
    count = count + 1;
end

a = find(expfit(2,:)==min(expfit(2,:)))
b = expfit(1,a)

figure
plot(mouse(1,:),mouse(2,:),'k','LineWidth',3)
hold
plot(mouse(1,:),mouse(2,1)*exp(mouse(1,:)*excel),'r','LineWidth',3)
plot(mouse(1,:),mouse(2,1)*exp(mouse(1,:)*b),'b','LineWidth',3)

%%
%Expo fits

figure
hold

plot(RC2(1,:),RC2(2,:),'--','LineWidth',3)
plot(RT1(1,:),RT1(2,:),'-','LineWidth',3)
plot(RT2(1,:),RT2(2,:),'-','LineWidth',3)
plot(RT3(1,:),RT3(2,:),'-','LineWidth',3)
plot(RT4(1,:),RT4(2,:),'-','LineWidth',3)
plot(NT3(1,:),NT3(2,:),'-','LineWidth',3)
plot(0,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
% plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 3*','Antibody dose','"Response" threshold','location','northwest')
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
plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,2000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,2000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,2000*ones(size(0:20)),'k--')
plot(0:20,4000*ones(size(0:20)),'k--')
plot(0:20,6000*ones(size(0:20)),'k--')
% plot(12*ones(size(0:100:8000)),0:100:8000,'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1*','Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 8000])

%% Group volumes

close all
set(0,'defaulttextinterpreter','latex')

%Responders
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
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%Non-responders
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

figure
boxplot(Nalldays,Nlabels,'Whisker',5,'colors','b')
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

% 
% averages = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),...
%             mean(day12),mean(day17),mean(day20)];
% medians  = [median(day0),median(day2),median(day3),median(day5),...
%             median(day7),median(day12),median(day17),median(day20)];
% stdevs   = [std(day0),std(day2),std(day3),std(day5),std(day7),std(day12),...
%             std(day17),std(day20)];
% sizes = numel(day0),numel(day2),numel(day3),numel(day5),numel(day7),...
%         numel(day12),numel(day17),numel(day20)];
% tvals = tinv(0.95,sizes); 
% sqrtsizes = sqrt(numel(??,1));
% CIs = tval*(stdevs./sqrtsizes);
% ?q = quantile(?,[0.25, 0.75]);
% 

% save('ExpoGroupTumorVolumes.mat')


