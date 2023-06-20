%%Figures comparing data for mice treated with both drugs

%Volumes
close all
set(0,'defaulttextinterpreter','latex')

PercentError = 0.05; %from caliper measurements

figure
hold

RT3 = [0 2 3 7 12 17 20; 73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 101.02	86.35	50.07	37.40	13.99	0.00	0.00];
NT4 = [0 2 3 5 7 12; 143.69	359.80	338.15	538.35	730.50	970.25];

errorbar(RT4(1,:),RT4(2,:),RT4(2,:)*PercentError,'-','LineWidth',3)
errorbar(RT3(1,:),RT3(2,:),RT3(2,:)*PercentError,'-','LineWidth',3)
errorbar(NT4(1,:),NT4(2,:),NT4(2,:)*PercentError,'-','LineWidth',3)
plot(0,1000,'gs','MarkerFaceColor','g','MarkerSize',10)
% plot(5,250,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(3,1000,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,1000,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,500*ones(size(0:20)),'k--')
plot(0:20,1000*ones(size(0:20)),'k--')
plot(0:20,1500*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Tumor volume ($mm^3$)')
title('Mice treated with both anti-PD1 and CTLA4')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
% legend('Rank 1','Rank 4','Rank 10','Antibody dose','"Response" threshold','location','northwest')
legend('Rank 1','Rank 4','Rank 10','Antibody dose','location','northwest')
ylim([0 2000])


%Hypoxic fractions
figure
hold

load('/Users/Angela/Box/Immune/MC38 in C57BL:6/Codes/HypoxicFractions.mat')

errorbar(RT4(1,:),RT4(2,:),RT4(2,:)-RT4(3,:),RT4(4,:)-RT4(2,:),'-','LineWidth',3)
errorbar(RT3(1,:),RT3(2,:),RT3(2,:)-RT3(3,:),RT3(4,:)-RT3(2,:),'-','LineWidth',3)
errorbar(NT4(1,:),NT4(2,:),NT4(2,:)-NT4(3,:),NT4(4,:)-NT4(2,:),'-','LineWidth',3)
plot(0,95,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,95,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,95,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,25*ones(size(0:20)),'k--')
plot(0:20,50*ones(size(0:20)),'k--')
plot(0:20,75*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Hypoxic percentage')
title('Mice treated with both anti-PD1 and CTLA4')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
% legend('Rank 1','Rank 4','Rank 10','Antibody dose','"Response" threshold','location','northwest')
legend('Rank 1','Rank 4','Rank 10','Antibody dose','location','southeast')
ylim([0 100])
xlim([0 10])


%Hypoxic fractions + immune data
figure
hold

load('/Users/Angela/Box/Immune/MC38 in C57BL:6/Codes/HypoxicFractions.mat')

errorbar(RT4(1,:),RT4(2,:),RT4(2,:)-RT4(3,:),RT4(4,:)-RT4(2,:),'-','LineWidth',3)
errorbar(RT3(1,:),RT3(2,:),RT3(2,:)-RT3(3,:),RT3(4,:)-RT3(2,:),'-','LineWidth',3)
errorbar(NT4(1,:),NT4(2,:),NT4(2,:)-NT4(3,:),NT4(4,:)-NT4(2,:),'-','LineWidth',3)

load('/Users/Angela/Box/Immune/MC38 in C57BL:6/Codes/ImmuneFractions.mat')
Imdatamed = [CD8medians(1),TCD8medians];
Imdataupp = [CD8upper(1),TCD8upper];
Imdatalow = [CD8lower(1),TCD8lower];
Imexptimes = [immunedays,immunedays(end)+3];

errorbar(Imexptimes, Imdatamed, Imdatamed-Imdatalow, Imdataupp-Imdatamed, 'ko','MarkerFaceColor','k','LineWidth',2)

plot(0,95,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,95,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,95,'gs','MarkerFaceColor','g','MarkerSize',10)

plot(0:20,25*ones(size(0:20)),'k--')
plot(0:20,50*ones(size(0:20)),'k--')
plot(0:20,75*ones(size(0:20)),'k--')

xlabel('Days')
ylabel('Hypoxic percentage')
title('Mice treated with both anti-PD1 and CTLA4')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
% legend('Rank 1','Rank 4','Rank 10','Antibody dose','"Response" threshold','location','northwest')
legend('Rank 1','Rank 4','Rank 10','Immune data','Antibody dose','location','southeast')
ylim([0 100])
xlim([0 10])

figure
imagesc(CT(:,:,slice)+1000*ROI(:,:,slice))
