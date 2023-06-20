
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
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)

xlabel('Days')
ylabel('Percent hypoxic')
title('Controlled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 2','Antibody dose','location','southeast')
ylim([0 100])

figure
hold

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
title('Controlled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Treated mouse 3*','Antibody dose','location','southwest')
ylim([0 100])



figure
hold

plot(RC1(1,:),RC1(2,:),'--','LineWidth',3)
plot(NC1(1,:),NC1(2,:),'--','LineWidth',3)
plot(NC2(1,:),NC2(2,:),'--','LineWidth',3)
plot(NC3(1,:),NC3(2,:),'--','LineWidth',3)
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)


xlabel('Days')
ylabel('Percent hypoxic')
title('Uncontrolled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1*','Control mouse 1','Control mouse 2','Control mouse 3','Antibody dose','location','southeast')
ylim([0 100])

figure
hold

plot(NT1(1,:),NT1(2,:),'-','LineWidth',3)
plot(NT2(1,:),NT2(2,:),'-','LineWidth',3)
plot(NT4(1,:),NT4(2,:),'-','LineWidth',3)
plot(0,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,20,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,20,'gs','MarkerFaceColor','g','MarkerSize',10)


xlabel('Days')
ylabel('Percent hypoxic')
title('Uncontrolled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Treated mouse 1','Treated mouse 2','Treated mouse 4','Antibody dose','location','southeast')
ylim([0 100])

%%

% %Slow growers
% day0 =  [RC2(2,1),RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
% day2 =  [RC2(2,2),RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
% day5 =  [RC2(2,3),RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];
% 
% 
% means = [mean(day0),mean(day2),mean(day5)];
% 
% figure
% plot(allexperimentaldays,means,'LineWidth',3)
% hold
% 
% 
% %fast growers
% day0 =  [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1),NT1(2,1),NT2(2,1),NT4(2,1)];
% day2 =  [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2),NT1(2,2),NT2(2,2),NT4(2,2)];
% day5 =  [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3),NT1(2,3),NT2(2,3),NT4(2,3)];
% 
% means = [mean(day0),mean(day2),mean(day5)];
% 
% plot(allexperimentaldays,means,'LineWidth',3)
% 
% 
% legend('Controlled','Uncontrolled','Location','best')
% 
% xlabel('Day')
% ylabel('Percent hypoxic')
% title('Mean percent hypoxia per time for outcome groups')
% set(gca,'FontSize',20)
% set(gca,'FontName','Times New Roman')


%% Group H fractions

close all
set(0,'defaulttextinterpreter','latex')

%Controlled, control
RCday0 = [RC2(2,1)];
RCday2 = [RC2(2,2)];
RCday5 = [RC2(2,3)];

RCalldays = [RCday0,RCday2,RCday5];
RClabels = [zeros(size(RCday0)),2*ones(size(RCday2)),5*ones(size(RCday5))];

figure
boxplot(RCalldays,RClabels,'Whisker',5,'colors','r')
xlabel('Day')
ylabel('Percent hypoxic')
title('Controlled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%Controlled, treated
RTday0 = [RT1(2,1),RT2(2,1),RT3(2,1),RT4(2,1),NT3(2,1)];
RTday2 = [RT1(2,2),RT2(2,2),RT3(2,2),RT4(2,2),NT3(2,2)];
RTday5 = [RT1(2,3),RT2(2,3),RT3(2,3),RT4(2,3),NT3(2,3)];

RTalldays = [RTday0,RTday2,RTday5];
RTlabels = [zeros(size(RTday0)),2*ones(size(RTday2)),5*ones(size(RTday5))];

figure
boxplot(RTalldays,RTlabels,'Whisker',5,'colors','r')
xlabel('Day')
ylabel('Percent hypoxic')
title('Controlled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%Uncontrolled, control
NCday0 = [RC1(2,1),NC1(2,1),NC2(2,1),NC3(2,1)];
NCday2 = [RC1(2,2),NC1(2,2),NC2(2,2),NC3(2,2)];
NCday5 = [RC1(2,3),NC1(2,3),NC2(2,3),NC3(2,3)];

NCalldays = [NCday0,NCday2,NCday5];

NClabels = [zeros(size(NCday0)),2*ones(size(NCday2)),5*ones(size(NCday5))];

figure
boxplot(NCalldays,NClabels,'Whisker',5,'colors','b')
title('Uncontrolled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


%Uncontrolled, treated
NTday0 = [NT1(2,1),NT2(2,1),NT4(2,1)];
NTday2 = [NT1(2,2),NT2(2,2),NT4(2,2)];
NTday5 = [NT1(2,3),NT2(2,3),NT4(2,3)];

NTalldays = [NTday0,NTday2,NTday5];

NTlabels = [zeros(size(NTday0)),2*ones(size(NTday2)),5*ones(size(NTday5))];

figure
boxplot(NTalldays,NTlabels,'Whisker',5,'colors','b')
title('Uncontrolled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
% close all
RCmaxes = [max(RCday0),max(RCday2),max(RCday5)];
RCmins = [min(RCday0),min(RCday2),min(RCday5)];
RCaverages = [mean(RCday0),mean(RCday2),mean(RCday5)];
RCmedians  = [median(RCday0),median(RCday2),median(RCday5)];
RCstdevs   = [std(RCday0),std(RCday2),std(RCday5)];
RCsizes = [numel(RCday0),numel(RCday2),numel(RCday5)];
RCtvals = tinv(0.95,RCsizes); 
RCsqrtsizes = sqrt(RCsizes);
RCCIs = RCtvals.*(RCstdevs./RCsqrtsizes);
clear RCquartiles
RCquartiles(1,:) = quantile(RCday0,[0.25, 0.75]);
RCquartiles(end+1,:) = quantile(RCday2,[0.25, 0.75]);
RCquartiles(end+1,:) = quantile(RCday5,[0.25, 0.75]);

figure
% errorbar(allexperimentaldays,RCmedians,RCmedians'-RCquartiles(:,1),RCquartiles(:,2)-RCmedians','LineWidth',3)
errorbar(allexperimentaldays,RCaverages,RCmins,RCmaxes,'LineWidth',3)
hold
% plot(allexperimentaldays,RCmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(allexperimentaldays,RCaverages,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent hypoxic')
title('Controlled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

RTmaxes = [max(RTday0),max(RTday2),max(RTday5)];
RTmins = [min(RTday0),min(RTday2),min(RTday5)];
RTaverages = [mean(RTday0),mean(RTday2),mean(RTday5)];
RTmedians  = [median(RTday0),median(RTday2),median(RTday5)];
RTstdevs   = [std(RTday0),std(RTday2),std(RTday5)];
RTsizes = [numel(RTday0),numel(RTday2),numel(RTday5)];
RTtvals = tinv(0.95,RTsizes); 
RTsqrtsizes = sqrt(RTsizes);
RTCIs = RTtvals.*(RTstdevs./RTsqrtsizes);
clear RTquartiles
RTquartiles(1,:) = quantile(RTday0,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday2,[0.25, 0.75]);
RTquartiles(end+1,:) = quantile(RTday5,[0.25, 0.75]);

figure
% errorbar(allexperimentaldays,RTmedians,RTmedians'-RTquartiles(:,1),RTquartiles(:,2)-RTmedians','LineWidth',3)
errorbar(allexperimentaldays,RTaverages,RTaverages-RTmins,RTmaxes-RTaverages,'LineWidth',3)
hold
% plot(allexperimentaldays,RTmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(allexperimentaldays,RTaverages,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent hypoxic')
title('Controlled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

NCmaxes = [max(NCday0),max(NCday2),max(NCday5)];
NCmins = [min(NCday0),min(NCday2),min(NCday5)];
NCaverages = [mean(NCday0),mean(NCday2),mean(NCday5)];
NCmedians  = [median(NCday0),median(NCday2),median(NCday5)];
NCstdevs   = [std(NCday0),std(NCday2),std(NCday5)];
NCsizes = [numel(NCday0),numel(NCday2),numel(NCday5)];
NCtvals = tinv(0.95,NCsizes); 
NCsqrtsizes = sqrt(NCsizes);
NCCIs = NCtvals.*(NCstdevs./NCsqrtsizes);
clear NCquartiles
NCquartiles(1,:) = quantile(NCday0,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday2,[0.25, 0.75]);
NCquartiles(end+1,:) = quantile(NCday5,[0.25, 0.75]);

figure
% errorbar(allexperimentaldays,NCmedians,NCmedians'-NCquartiles(:,1),NCquartiles(:,2)-NCmedians','LineWidth',3)
errorbar(allexperimentaldays,NCaverages,NCaverages-NCmins,NCmaxes-NCaverages,'LineWidth',3)
hold
% plot(allexperimentaldays,NCmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(allexperimentaldays,NCaverages,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent Hypoxic')
title('Uncontrolled growth, control')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

NTmaxes = [max(NTday0),max(NTday2),max(NTday5)];
NTmins = [min(NTday0),min(NTday2),min(NTday5)];
NTaverages = [mean(NTday0),mean(NTday2),mean(NTday5)];
NTmedians  = [median(NTday0),median(NTday2),median(NTday5)];
NTstdevs   = [std(NTday0),std(NTday2),std(NTday5)];
NTsizes = [numel(NTday0),numel(NTday2),numel(NTday5)];
NTtvals = tinv(0.95,NTsizes); 
NTsqrtsizes = sqrt(NTsizes);
NTCIs = NTtvals.*(NTstdevs./NTsqrtsizes);
clear NTquartiles
NTquartiles(1,:) = quantile(NTday0,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday2,[0.25, 0.75]);
NTquartiles(end+1,:) = quantile(NTday5,[0.25, 0.75]);

figure
% errorbar(allexperimentaldays,NTmedians,NTmedians'-NTquartiles(:,1),NTquartiles(:,2)-NTmedians','LineWidth',3)
errorbar(allexperimentaldays,NTaverages,NTaverages-NTmins,NTmaxes-NTaverages,'LineWidth',3)
hold
% plot(allexperimentaldays,NTmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
plot(allexperimentaldays,NTaverages,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Percent Hypoxic')
title('Uncontrolled growth, treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')

%%
 save('ExpoGroupHFractionsV2.mat')
