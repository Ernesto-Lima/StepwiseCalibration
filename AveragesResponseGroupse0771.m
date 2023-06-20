
clear all
close all
set(0,'defaulttextinterpreter','latex')

%Controls
C1 = [0 3 5 6 9 14 19 23; 
    235.78	373.77	453.37	674.93	1513.13	1189.59	3025.68	3661.55];
C2 = [0 3 5 6 9 14 19 23 26 28; 
    204.10	265.87	466.89	337.24	338.53	317.78	218.17	154.87	363.53	427.76];
C3 = [0 3 5 6 9 14 19; 
    518.85	813.89	1345.46	1300.55	2932.41	4335.41	5445.81];
C4 = [0 3 5 6 9 14 19 23 26 28; 
    93.40	206.63	316.36	369.32	83.73	735.01	964.19	1166.41	3028.43	5128.40];
C5 = [0 3 5 6 9 14 19 23 26; 
    184.63	329.22	472.55	466.37	1109.94	2016.56	2583.22	4392.45	6847.11];
C6 = [0 3 5 6 9 14 19; 
    294.16	358.45	353.72	525.58	1159.84	2470.75	2693.27];
C7 = [0 3 5 6 9 14 19 23 26 28; 
    228.63	217.60	139.17	220.83	374.26	893.62	1156.98	2963.62	4986.05	4241.26];
C8 = [0 3 5 6 9 14 19; 
    235.77	448.44	845.73	636.74	1405.75	2786.39	4492.66];
C9 = [0 3 5 6 9 14 19; 
    209.01	261.70	473.12	561.56	564.15	758.10	1627.36];
C10 = [0 3 5 6 9 14 19; 
    171.81	350.03	281.21	408.55	372.70	368.75	1052.48];
C11 = [0 3 5 6 9 14 19 23 26 28; 
    200.96	140.61	195.71	177.18	166.80	166.68	192.64	437.71	1505.98	1481.77];

%Treated
T1 = [0 3 5 6 9 14 19 23 26 28; 
    107.48	50.94	45.82	63.98	35.17	0.00	0.00	0.00	0.00	0.00];
T2 = [0 3 5 6 9 14 19 23 26 28; 
    241.62	162.68	295.44	166.18	146.98	0.00	0.00	0.00	0.00	0.00];
T3 = [0 3 5 6 9 14 19 23 26 28; 
    174.41	160.87	128.52	110.40	221.75	0.00	0.00	0.00	0.00	0.00];
T4 = [0 3 5 6 9 14 19 23 26 28; 
    96.55	96.92	155.05	153.01	56.54	51.43	91.82	0.00	0.00	0.00];
T5 = [0 3 5 6 9 14 19 23 26 28; 
    118.69	133.79	79.38	68.20	38.75	12.31	0.00	0.00	0.00	0.00];
T6 = [0 3 5 6 9 14 19 23 26 28; 
    276.15	229.57	147.93	263.18	42.47	49.46	0.00	0.00	161.75	0.00];
T7 = [0 3 5 6 9 14 19 23 26 28; 
    155.02	115.25	167.33	130.86	148.84	0.00	0.00	0.00	0.00	0.00];
T8 = [0 3 5 6 9 14 19; 
    301.90	352.33	576.24	360.21	396.74	810.80	863.01];
T9 = [0 3 5 6 9 14 19 23 26 28; 
    128.61	127.06	141.51	106.07	74.97	0.00	0.00	0.00	0.00	0.00];
T10 = [0 3 5 6 9 14 19 23 26 28; 
    200.58	163.43	162.78	142.25	0.00	0.00	0.00	0.00	0.00	0.00];
%% Plots controls vs treated
close all

figure
hold
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
ylabel('Tumor volume (mm$^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')


figure
hold
plot(0,400,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(3,400,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(6,400,'gs','MarkerFaceColor','g','MarkerSize',10)
plot(T1(1,:),T1(2,:),'-','LineWidth',3)
plot(T2(1,:),T2(2,:),'-','LineWidth',3)
plot(T3(1,:),T3(2,:),'-','LineWidth',3)
plot(T4(1,:),T4(2,:),'-','LineWidth',3)
plot(T5(1,:),T5(2,:),'-','LineWidth',3)
plot(T6(1,:),T6(2,:),'-','LineWidth',3)
plot(T7(1,:),T7(2,:),'-','LineWidth',3)
% plot(T8(1,:),T8(2,:),'-','LineWidth',3)
plot(T9(1,:),T9(2,:),'-','LineWidth',3)
plot(T10(1,:),T10(2,:),'-','LineWidth',3)
xlabel('Days')
ylabel('Tumor volume (mm$^3$)')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Antibody dose','location','northeast')


%%
mouse = T1;

close all
clear expfit
count = 1;
for jj = -0.30:0.001:0.30
    expfit(1,count) = jj;
    expfit(2,count) = sum((mouse(2,:)-mouse(2,1)*exp(mouse(1,:)*jj)).^2);
    count = count + 1;
end

a = find(expfit(2,:)==min(expfit(2,:)))
b = expfit(1,a)

figure
plot(mouse(1,:),mouse(2,:),'k','LineWidth',3)
hold
plot(mouse(1,:),mouse(2,1)*exp(mouse(1,:)*b),'b','LineWidth',3)
legend(num2str(b))


%% Group volumes

set(0,'defaulttextinterpreter','latex')

%Controls
Cday0 = [C1(2,1),C2(2,1),C3(2,1),C4(2,1),C5(2,1),C6(2,1),C7(2,1),C8(2,1),C9(2,1),C10(2,1),C11(2,1)];
Cday3 = [C1(2,2),C2(2,2),C3(2,2),C4(2,2),C5(2,2),C6(2,2),C7(2,2),C8(2,2),C9(2,2),C10(2,2),C11(2,2)];
Cday5 = [C1(2,3),C2(2,3),C3(2,3),C4(2,3),C5(2,3),C6(2,3),C7(2,3),C8(2,3),C9(2,3),C10(2,3),C11(2,3)];
Cday6 = [C1(2,4),C2(2,4),C3(2,4),C4(2,4),C5(2,4),C6(2,4),C7(2,4),C8(2,4),C9(2,4),C10(2,4),C11(2,4)];
Cday9 = [C1(2,5),C2(2,5),C3(2,5),C4(2,5),C5(2,5),C6(2,5),C7(2,5),C8(2,5),C9(2,5),C10(2,5),C11(2,5)];
Cday14 = [C1(2,6),C2(2,6),C3(2,6),C4(2,6),C5(2,6),C6(2,6),C7(2,6),C8(2,6),C9(2,6),C10(2,6),C11(2,6)];
Cday19 = [C1(2,7),C2(2,7),C3(2,7),C4(2,7),C5(2,7),C7(2,7),C11(2,7)];
Cday23 = [C1(2,8),C2(2,8),C4(2,8),C5(2,8),C7(2,8),C11(2,8)];
Cday26 = [C2(2,9),C4(2,9),C5(2,9),C7(2,9),C11(2,9)];
Cday28 = [C2(2,10),C4(2,10),C7(2,10),C11(2,10)];

Calldays = [Cday0,Cday3,Cday5,Cday6,Cday9,Cday14,Cday19,Cday23,Cday26,Cday28];

%Treated, not including T8 outlier
Tday0 = [T1(2,1),T2(2,1),T3(2,1),T4(2,1),T5(2,1),T6(2,1),T7(2,1),T9(2,1),T10(2,1)];
Tday3 = [T1(2,2),T2(2,2),T3(2,2),T4(2,2),T5(2,2),T6(2,2),T7(2,2),T9(2,2),T10(2,2)];
Tday5 = [T1(2,3),T2(2,3),T3(2,3),T4(2,3),T5(2,3),T6(2,3),T7(2,3),T9(2,3),T10(2,3)];
Tday6 = [T1(2,4),T2(2,4),T3(2,4),T4(2,4),T5(2,4),T6(2,4),T7(2,4),T9(2,4),T10(2,4)];
Tday9 = [T1(2,5),T2(2,5),T3(2,5),T4(2,5),T5(2,5),T6(2,5),T7(2,5),T9(2,5),T10(2,5)];
Tday14 = [T1(2,6),T2(2,6),T3(2,6),T4(2,6),T5(2,6),T6(2,6),T7(2,6),T9(2,6),T10(2,6)];
Tday19 = [T1(2,7),T2(2,7),T3(2,7),T4(2,7),T5(2,7),T6(2,7),T7(2,7),T9(2,7),T10(2,7)];
Tday23 = [T1(2,8),T2(2,8),T3(2,8),T4(2,8),T5(2,8),T6(2,8),T7(2,8),T9(2,8),T10(2,8)];
Tday26 = [T1(2,9),T2(2,9),T3(2,9),T4(2,9),T5(2,9),T6(2,9),T7(2,9),T9(2,9),T10(2,9)];
Tday28 = [T1(2,10),T2(2,10),T3(2,10),T4(2,10),T5(2,10),T6(2,10),T7(2,10),T9(2,10),T10(2,10)];

Talldays = [Tday0,Tday3,Tday5,Tday6,Tday9,Tday14,Tday19,Tday23,Tday26,Tday28];

%%
close all
allexpdays = [0 3 5 6 9 14 19 23 26 28];

Cmaxes = [max(Cday0),max(Cday3),max(Cday5),max(Cday6),max(Cday9),...
           max(Cday14),max(Cday19),max(Cday23),max(Cday26),max(Cday28)];
Cmins = [min(Cday0),min(Cday3),min(Cday5),min(Cday6),min(Cday9),...
           min(Cday14),min(Cday19),min(Cday23),min(Cday26),min(Cday28)];
Caverages = [mean(Cday0),mean(Cday3),mean(Cday5),mean(Cday6),mean(Cday9),...
           mean(Cday14),mean(Cday19),mean(Cday23),mean(Cday26),mean(Cday28)];
Cmedians  = [median(Cday0),median(Cday3),median(Cday5),median(Cday6),median(Cday9),...
           median(Cday14),median(Cday19),median(Cday23),median(Cday26),median(Cday28)];
Cstdevs   = [std(Cday0),std(Cday3),std(Cday5),std(Cday6),std(Cday9),...
           std(Cday14),std(Cday19),std(Cday23),std(Cday26),std(Cday28)];
Csizes = [numel(Cday0),numel(Cday3),numel(Cday5),numel(Cday6),numel(Cday9),...
           numel(Cday14),numel(Cday19),numel(Cday23),numel(Cday26),numel(Cday28)];
Ctvals = tinv(0.95,Csizes); 
Csqrtsizes = sqrt(Csizes);
CCIs = Ctvals.*(Cstdevs./Csqrtsizes);
clear Cquartiles
Cquartiles(1,:) = quantile(Cday0,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday3,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday5,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday6,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday9,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday14,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday19,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday23,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday26,[0.25, 0.75]);
Cquartiles(end+1,:) = quantile(Cday28,[0.25, 0.75]);

figure
errorbar(allexpdays,Caverages,Caverages-Cmins,Cmaxes-Caverages,'LineWidth',3)
hold
plot(allexpdays,Cmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Controls')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 8000])

Tmaxes = [max(Tday0),max(Tday3),max(Tday5),max(Tday6),max(Tday9),...
           max(Tday14),max(Tday19),max(Tday23),max(Tday26),max(Tday28)];
Tmins = [min(Tday0),min(Tday3),min(Tday5),min(Tday6),min(Tday9),...
           min(Tday14),min(Tday19),min(Tday23),min(Tday26),min(Tday28)];
Taverages = [mean(Tday0),mean(Tday3),mean(Tday5),mean(Tday6),mean(Tday9),...
           mean(Tday14),mean(Tday19),mean(Tday23),mean(Tday26),mean(Tday28)];
Tmedians  = [median(Tday0),median(Tday3),median(Tday5),median(Tday6),median(Tday9),...
           median(Tday14),median(Tday19),median(Tday23),median(Tday26),median(Tday28)];
Tstdevs   = [std(Tday0),std(Tday3),std(Tday5),std(Tday6),std(Tday9),...
           std(Tday14),std(Tday19),std(Tday23),std(Tday26),std(Tday28)];
Tsizes = [numel(Tday0),numel(Tday3),numel(Tday5),numel(Tday6),numel(Tday9),...
           numel(Tday14),numel(Tday19),numel(Tday23),numel(Tday26),numel(Tday28)];
Ttvals = tinv(0.95,Tsizes); 
Tsqrtsizes = sqrt(Tsizes);
TCIs = Ttvals.*(Tstdevs./Tsqrtsizes);
clear Tquartiles
Tquartiles(1,:) = quantile(Tday0,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday3,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday5,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday6,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday9,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday14,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday19,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday23,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday26,[0.25, 0.75]);
Tquartiles(end+1,:) = quantile(Tday28,[0.25, 0.75]);

figure
errorbar(allexpdays,Taverages,Taverages-Tmins,Tmaxes-Taverages,'LineWidth',3)
hold
plot(allexpdays,Tmedians,'ro','MarkerFaceColor','r','MarkerSize',10)
xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Treated')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
ylim([0 1000])


%%
 save('TumorVolumese.mat')
