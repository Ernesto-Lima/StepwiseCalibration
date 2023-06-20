%FMISO data
close all
set(0,'defaulttextinterpreter','latex')

figure
hold
RC1 = [0 2 5; 29.944	133.352	14.904];
RC2 = [0 2 5; 76.784	57.224	50.176];

RT1 = [0 2 5; 65.232	57.224	13.288];
RT2 = [0 2 5; 72.216	112.848	27.6];
RT3 = [0 2 5; 54.264	57.224	24.432];
RT4 = [0 2 5; 78.488	83.512	44.36];

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
title('FMISO responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 1000])

figure
hold

NC1 = [0 2 5;52.416	32.656	56.984];
NC2 = [0 2 5;25.896	64.152	85.176];
NC3 = [0 2 5;41.52	111.064	238.904];

NT1 = [0 2 5;22.432	61.992	54.976];
NT2 = [0 2 5;75.12	34.16	88.112];
NT3 = [0 2 5;32.456	72.408	40.136];
NT4 = [0 2 5;38.456	47.168	88.544];
 
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
title('FMISO non-responders')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')
legend('Control mouse 1','Control mouse 2','Control mouse 3','Treated mouse 1','Treated mouse 2','Treated mouse 3','Treated mouse 4','Antibody dose','"Response" threshold','location','northwest')
ylim([0 1000])