
clear all
close all
set(0,'defaulttextinterpreter','latex')
load('HypoxicFractions.mat')

allexperimentaldays = [0 2 5];
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
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)

xlabel('Days')
ylabel('Percent hypoxic')
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 3*','Antibody dose','location','southwest')
ylim([0 100])



figure
hold

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)


xlabel('Days')
ylabel('Percent hypoxic')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1*','Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 4','Antibody dose','location','southeast')
ylim([0 100])


%%

%Slow growers
day0 =  [RC2(2,1),RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
day2 =  [RC2(2,2),RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
day5 =  [RC2(2,3),RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];


means = [mean(day0),mean(day2),mean(day5)];

figure
plot(allexperimentaldays,means,'LineWidth',3)
hold


%fast growers
day0 =  [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1),NT1(2,1),NT2(2,1),NT4(2,1)];
day2 =  [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2),NT1(2,2),NT2(2,2),NT4(2,2)];
day5 =  [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3),NT1(2,3),NT2(2,3),NT4(2,3)];

means = [mean(day0),mean(day2),mean(day5)];

plot(allexperimentaldays,means,'LineWidth',3)


legend('Controlled','Uncontrolled','Location','best')

xlabel('Day')
ylabel('Percent hypoxic')
title('Mean percent hypoxia per time for outcome groups')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%% Group H fractions

close all
set(0,'defaulttextinterpreter','latex')

%Controlled
Rday0 = [RC2(2,1),RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
Rday2 = [RC2(2,2),RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
Rday5 = [RC2(2,3),RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];

Ralldays = [Rday0,Rday2,Rday5];
Rlabels = [zeros(size(Rday0)),2*ones(size(Rday2)),5*ones(size(Rday5))];

figure
boxplot(Ralldays,Rlabels,'Whisker',5,'colors','r')
xlabel('Day')
ylabel('Percent hypoxic')
% title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%Uncontrolled
Nday0 = [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1),NT1(2,1),NT2(2,1),NT4(2,1)];
Nday2 = [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2),NT1(2,2),NT2(2,2),NT4(2,2)];
Nday5 = [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3),NT1(2,3),NT2(2,3),NT4(2,3)];

Nalldays = [Nday0,Nday2,Nday5];

Nlabels = [zeros(size(Nday0)),2*ones(size(Nday2)),5*ones(size(Nday5))];

hold
boxplot(Nalldays,Nlabels,'Whisker',5,'colors','b')
% title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
% close all
Raverages = [mean(Rday0),mean(Rday2),mean(Rday5)];
Rmedians  = [median(Rday0),median(Rday2),median(Rday5)];
Rstdevs   = [std(Rday0),std(Rday2),std(Rday5)];
Rsizes = [numel(Rday0),numel(Rday2),numel(Rday5)];
Rtvals = tinv(0.95,Rsizes); 
Rsqrtsizes = sqrt(Rsizes);
RCIs = Rtvals.*(Rstdevs./Rsqrtsizes);
clear Rquartiles
Rquartiles(1,:) = quantile(Rday0,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday2,[0.25, 0.75]);
Rquartiles(end+1,:) = quantile(Rday5,[0.25, 0.75]);

figure
errorbar(allexperimentaldays,Rmedians,Rmedians'-Rquartiles(:,1),Rquartiles(:,2)-Rmedians','LineWidth',3)
hold
plot(allexperimentaldays,Rmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent hypoxic')
title('Controlled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

Naverages = [mean(Nday0),mean(Nday2),mean(Nday5)];
Nmedians  = [median(Nday0),median(Nday2),median(Nday5)];
Nstdevs   = [std(Nday0),std(Nday2),std(Nday5)];
Nsizes = [numel(Nday0),numel(Nday2),numel(Nday5)];
Ntvals = tinv(0.95,Nsizes); 
Nsqrtsizes = sqrt(Nsizes);
NCIs = Ntvals.*(Nstdevs./Nsqrtsizes);
clear Nquartiles
Nquartiles(1,:) = quantile(Nday0,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday2,[0.25, 0.75]);
Nquartiles(end+1,:) = quantile(Nday5,[0.25, 0.75]);

figure
errorbar(allexperimentaldays,Nmedians,Nmedians'-Nquartiles(:,1),Nquartiles(:,2)-Nmedians','LineWidth',3)
hold
plot(allexperimentaldays,Nmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent Hypoxic')
title('Uncontrolled growth')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
 save('ExpoGroupHFractions.mat')
