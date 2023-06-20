
clear all
close all
set(0,'defaulttextinterpreter','latex')

allexperimentaldays = [0 5];

C1 = allexperimentaldays;
C2 = allexperimentaldays;
C3 = allexperimentaldays;
C4 = allexperimentaldays;
C5 = allexperimentaldays;
C6 = allexperimentaldays;
C7 = allexperimentaldays;
C8 = allexperimentaldays;
C9 = allexperimentaldays;
C10 = allexperimentaldays;
C11 = allexperimentaldays;
T1 = allexperimentaldays;
T2 = allexperimentaldays;
T3 = allexperimentaldays;
T4 = allexperimentaldays;
T5 = allexperimentaldays;
T6 = allexperimentaldays;
T7 = allexperimentaldays;
T8 = allexperimentaldays;
T9 = allexperimentaldays;
T10 = allexperimentaldays;

C1(2,:) = [8.53     87.59];
C2(2,:) = [64.80	54.19];
C3(2,:) = [86.37	88.81];
C4(2,:) = [96.15	61.77];
C5(2,:) = [91.92	85.92];
C6(2,:) = [84.92	87.95];
C7(2,:) = [92.53	92.37];
C8(2,:) = [98.53	94.30];
C9(2,:) = [61.97	83.22];
C10(2,:) = [75.05	98.40];
C11(2,:) = [8.92	39.25];

T1(2,:) = [81.43	61.76];
T2(2,:) = [94.26	92.40];
T3(2,:) = [81.75	87.41];
T4(2,:) = [86.45	31.94];
T5(2,:) = [72.36	71.57];
T6(2,:) = [94.31	92.89];
T7(2,:) = [87.45	88.57];
T8(2,:) = [52.24	99.88];
T9(2,:) = [58.35	91.76];
T10(2,:) = [18.52	90.22];

%% Control vs treated plots

figure
hold
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(C1(1,:),C1(2,:),'--','LineWidth',3)
plot(C2(1,:),C2(2,:),'--','LineWidth',3)
plot(C3(1,:),C3(2,:),'--','LineWidth',3)
plot(C4(1,:),C4(2,:),'--','LineWidth',3)
plot(C5(1,:),C5(2,:),'--','LineWidth',3)
plot(C6(1,:),C6(2,:),'--','LineWidth',3)
plot(C7(1,:),C7(2,:),'--','LineWidth',3)
plot(C8(1,:),C8(2,:),'--','LineWidth',3)
plot(C9(1,:),C9(2,:),'--','LineWidth',3)
plot(C10(1,:),C10(2,:),'--','LineWidth',3)
plot(C11(1,:),C11(2,:),'--','LineWidth',3)
xlabel('Days')
ylabel('Percent hypoxic')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','southwest')
ylim([0 100])


figure
hold
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(T1(1,:),T1(2,:),'--','LineWidth',3)
plot(T2(1,:),T2(2,:),'--','LineWidth',3)
plot(T3(1,:),T3(2,:),'--','LineWidth',3)
plot(T4(1,:),T4(2,:),'--','LineWidth',3)
plot(T5(1,:),T5(2,:),'--','LineWidth',3)
plot(T6(1,:),T6(2,:),'--','LineWidth',3)
plot(T7(1,:),T7(2,:),'--','LineWidth',3)
% plot(T8(1,:),T8(2,:),'--','LineWidth',3)
plot(T9(1,:),T9(2,:),'--','LineWidth',3)
plot(T10(1,:),T10(2,:),'--','LineWidth',3)
xlabel('Days')
ylabel('Percent hypoxic')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','southeast')
ylim([0 100])

%% Group H fractions

close all
set(0,'defaulttextinterpreter','latex')

%Controls
Cday0 = [C1(2,1),C2(2,1),C3(2,1),C4(2,1),C5(2,1),C6(2,1),C7(2,1),C8(2,1),C9(2,1),C10(2,1),C11(2,1)];
Cday5 = [C1(2,2),C2(2,2),C3(2,2),C4(2,2),C5(2,2),C6(2,2),C7(2,2),C8(2,2),C9(2,2),C10(2,2),C11(2,2)];

Calldays = [Cday0,Cday5];

Clabels = [zeros(size(Cday0)),5*ones(size(Cday5))];

figure
boxplot(Calldays,Clabels,'Whisker',5)
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 100])

%Treated
Tday0 = [T1(2,1),T2(2,1),T3(2,1),T4(2,1),T5(2,1),T6(2,1),T7(2,1),T9(2,1),T10(2,1)];
Tday5 = [T1(2,2),T2(2,2),T3(2,2),T4(2,2),T5(2,2),T6(2,2),T7(2,2),T9(2,2),T10(2,2)];

Talldays = [Tday0,Tday5];
Tlabels = [zeros(size(Tday0)),5*ones(size(Tday5))];

figure
boxplot(Talldays,Tlabels,'Whisker',5)
xlabel('Day')
ylabel('Percent hypoxic')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 100])


%%
% close all

Cmaxes = [max(Cday0),max(Cday5)];
Cmins = [min(Cday0),min(Cday5)];
Caverages = [mean(Cday0),mean(Cday5)];
Cmedians  = [median(Cday0),median(Cday5)];
Cstdevs   = [std(Cday0),std(Cday5)];
Csizes = [numel(Cday0),numel(Cday5)];
Ctvals = tinv(0.95,Csizes); 
Csqrtsizes = sqrt(Csizes);
CCIs = Ctvals.*(Cstdevs./Csqrtsizes);
clear Cquartiles
Cquartiles(1,:) = quantile(Cday0,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday5,[0.25, 0.75]);

Tmaxes = [max(Tday0),max(Tday5)];
Tmins = [min(Tday0),min(Tday5)];
Taverages = [mean(Tday0),mean(Tday5)];
Tmedians  = [median(Tday0),median(Tday5)];
Tstdevs   = [std(Tday0),std(Tday5)];
Tsizes = [numel(Tday0),numel(Tday5)];
Ttvals = tinv(0.95,Tsizes); 
Tsqrtsizes = sqrt(Tsizes);
TCIs = Ttvals.*(Tstdevs./Tsqrtsizes);
clear Tquartiles
Tquartiles(1,:) = quantile(Tday0,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday5,[0.25, 0.75]);

%%
 save('HypoxicFractionse.mat')