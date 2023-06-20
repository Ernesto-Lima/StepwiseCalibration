%% Immune cells controls
close all
set(0,'defaulttextinterpreter','latex')

CD8 = [9.31	5.28 8.45						
       21.9	5.41 6.06
       20.9	7.47 11.2
       3.53 7.93 5.95];

CD4 = [13.9	6.87	5.94
       32.5	8.76	4.32
       31	5.48	6.5
       5.3	7.88	7.89];

figure
hold
immunedays = [0 3 6];

% plot(immunedays,CD8(1,:),'--','LineWidth',3)
% plot(immunedays,CD8(2,:),'--','LineWidth',3)
% plot(immunedays,CD8(3,:),'--','LineWidth',3)
% plot(immunedays,CD8(4,:),'--','LineWidth',3)
% plot(immunedays,CD4(1,:),'-','LineWidth',3)
% plot(immunedays,CD4(2,:),'-','LineWidth',3)
% plot(immunedays,CD4(3,:),'-','LineWidth',3)
% plot(immunedays,CD4(4,:),'-','LineWidth',3)

% xlabel('Days')
% ylabel('Immune fraction')
% title('Controls')
% set(gca,'FontSize',20)
% set(gca,'FontName','Times New Roman')
% legend('CD8 1','CD8 2','CD8 3','CD8 4','CD4 1','CD4 2','CD4 3','CD4 4','location','best')
% ylim([0 60])

CD8upper = [21.65 7.815 10.5125];
CD8lower = [4.975 5.3125 5.9775];
CD4upper = [32.125 8.54 7.5425];
CD4lower = [7.45 5.8275 4.725];

CD8medians = [median(CD8(:,1)),median(CD8(:,2)),median(CD8(:,3))];
CD4medians = [median(CD4(:,1)),median(CD4(:,2)),median(CD4(:,3))];

% figure
% hold
% plot(immunedays,median(CD8),'-','LineWidth',3)
% plot(immunedays,median(CD4),'-','LineWidth',3)
% plot(immunedays,median(CD8)+median(CD4),'-','LineWidth',3)
errorbar(immunedays,median(CD8),median(CD8)-CD8lower,CD8upper-median(CD8),'LineWidth',3)
errorbar(immunedays,median(CD4),median(CD4)-CD4lower,CD4upper-median(CD4),'LineWidth',3)
% errorbar(immunedays,median(CD8)+median(CD4),median(CD8)+median(CD4)-(CD8lower+CD4lower),CD8upper+CD4upper-(median(CD8)+median(CD4)),'LineWidth',3)
xlabel('Days')
ylabel('Immune fraction')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
% legend('CD8','CD4','CD8+CD4','location','best')
legend('CD8','CD4','location','best')

%% Immune cells treated
% close all
% clear all
set(0,'defaulttextinterpreter','latex')

TCD8 = [12.2	4.39    30.4		
      4.84	22.3	47.8
      4.17	9.55	39	
      3.5	9.48     0];

TCD4 = [13.2	11.4 18.9
       8.53 13.5 24.6	
       7.85	8.59 41.2	
       7.43 2.99	0];

figure
hold
immunedays = [0 3 6];

% plot(immunedays,TCD8(1,:),'--','LineWidth',3)
% plot(immunedays,TCD8(2,:),'--','LineWidth',3)
% plot(immunedays,TCD8(3,:),'--','LineWidth',3)
% plot(immunedays(1:2),TCD8(4,1:2),'--','LineWidth',3)
% plot(immunedays,TCD4(1,:),'-','LineWidth',3)
% plot(immunedays,TCD4(2,:),'-','LineWidth',3)
% plot(immunedays,TCD4(3,:),'-','LineWidth',3)
% plot(immunedays(1:2),TCD4(4,1:2),'--','LineWidth',3)
% 
% xlabel('Days')
% ylabel('Immune fraction')
% title('Treated')
% set(gca,'FontSize',20)
% set(gca,'FontName','Times New Roman')
% legend('CD8 1','CD8 2','CD8 3','CD8 4','CD4 1','CD4 2','CD4 3','CD4 4','location','best')
% ylim([0 60])

TCD8upper = [10.36 19.1125 47.8];
TCD8lower = [3.6675 5.6625 30.4];
TCD4upper = [12.0325 12.975 41.2];
TCD4lower = [7.535 4.39 18.9];

TCD8medians = [median(TCD8(:,1)),median(TCD8(:,2)),median(TCD8(1:3,3))];
TCD4medians = [median(TCD4(:,1)),median(TCD4(:,2)),median(TCD4(1:3,3))];

% figure
% hold
% plot(immunedays,median(CD8),'-','LineWidth',3)
% plot(immunedays,median(CD4),'-','LineWidth',3)
% plot(immunedays,median(CD8)+median(CD4),'-','LineWidth',3)
errorbar(immunedays,TCD8medians,TCD8medians-TCD8lower,TCD8upper-TCD8medians,'LineWidth',3)
errorbar(immunedays,TCD4medians,TCD4medians-TCD4lower,TCD4upper-TCD4medians,'LineWidth',3)
% errorbar(immunedays,CD8medians+CD4medians,CD8medians+CD4medians-(CD8lower+CD4lower),CD8upper+CD4upper-(CD8medians+CD4medians),'LineWidth',3)
xlabel('Days')
ylabel('Immune fraction')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
% legend('CD8','CD4','CD8+CD4','location','best')
legend('CD8','CD4','location','best')

save('ImmuneFractions.mat')


%% Combined CD8 and CD4 boxplots
% figure
% subplot(1,2,1)
% boxplot(CD8+CD4,[0,3,6],'Whisker',3)
% set(findobj(gca,'type','line'),'linew',1.5)
% set(gca,'FontSize',20)
% set(gca,'FontName','Times New Roman')
% xlabel('Days')
% ylabel('Immune fraction')
% title('Controls')
% ylim([0 80])
% 
% TCD4 = [13.2	11.4 18.9
%        8.53 13.5 24.6	
%        7.85	8.59 0	
%        7.43 2.99 41.2];
% 
% subplot(1,2,2)
% boxplot(TCD8+TCD4,[0,3,6],'Whisker',3)
% set(findobj(gca,'type','line'),'linew',1.5)
% set(gca,'FontSize',20)
% set(gca,'FontName','Times New Roman')
% xlabel('Days')
% ylabel('Immune fraction')
% title('Treated')
% ylim([0 80])

%% CD8 boxplots
figure
subplot(1,2,1)
boxplot(CD8,[0,3,6],'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD8 fraction')
title('Controls')
ylim([0 60])

TCD81 = TCD8(:,1)';
TCD82 = TCD8(:,2)';
TCD83 = TCD8(:,3)';
TCD83(TCD83==0) = [];

TCD8labels = [zeros(size(TCD81)), 3*ones(size(TCD82)), 6*ones(size(TCD83))];

subplot(1,2,2)
boxplot([TCD81,TCD82,TCD83],TCD8labels,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD8 fraction')
title('Treated')
ylim([0 60])

%% CD4 boxplots
figure
subplot(1,2,1)
boxplot(CD4,[0,3,6],'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD4 fraction')
title('Controls')
ylim([0 60])

TCD41 = TCD4(:,1)';
TCD42 = TCD4(:,2)';
TCD43 = TCD4(:,3)';
TCD43(TCD43==0) = [];  

TCD4labels = [zeros(size(TCD41)), 3*ones(size(TCD42)), 6*ones(size(TCD43))];

subplot(1,2,2)
boxplot([TCD41,TCD42,TCD43],TCD4labels,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD4 fraction')
title('Treated')
ylim([0 60])

%% CD8 boxplots for model calibration
figure
subplot(1,2,1)
boxplot(CD8,[0,3,6],'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD8 fraction')
title('Controls')
ylim([0 60])

TCD81 = CD8(:,1)';
TCD82 = TCD8(:,1)';
TCD83 = TCD8(:,2)';
TCD84 = TCD8(:,3)';
TCD84(TCD84==0) = [];

TCD8labels = [zeros(size(TCD81)), 3*ones(size(TCD82)), 6*ones(size(TCD83)),9*ones(size(TCD84))];

subplot(1,2,2)
boxplot([TCD81,TCD82,TCD83,TCD84],TCD8labels,'Whisker',3)
set(findobj(gca,'type','line'),'linew',1.5)
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
xlabel('Days')
ylabel('CD8 fraction')
title('Treated')
ylim([0 60])
