


RC1 = [0 2 3 7 12 17 20; 
    57.65	142.50	61.16	96.89	614.94	2658.60	3346.06];
RC2 = [0 2 3 7 12 17 20; 
    45.33	139.28	68.11	124.69	145.13	427.76	1009.77];
NC1 = [0 2 3 7 12 17 20;
    94.20	276.04	260.87	288.15	1206.55	3226.66	4496.46];
NC2 = [0 2 3 5 7 12;
    146.37	131.00	470.27	800.90	2042.99	2023.93];
NC3 = [0 2 3 5 7 12; 
    137.05	543.36	785.75	1000.06	1156.69	2778.13];

day0 = [RC1(2,1),RC2(2,1),NC1(2,1),NC2(2,1),NC3(2,1)];
day2 = [RC1(2,2),RC2(2,2),NC1(2,2),NC2(2,2),NC3(2,2)];
day3 = [RC1(2,3),RC2(2,3),NC1(2,3),NC2(2,3),NC3(2,3)];
day5 = [NC2(2,4),NC3(2,4)];
day7 = [RC1(2,4),RC2(2,4),NC1(2,4),NC2(2,5),NC3(2,5)];
day12 = [RC1(2,5),RC2(2,5),NC1(2,5),NC2(2,6),NC3(2,6)];
day17 = [RC1(2,6),RC2(2,6),NC1(2,6)];
day20 = [RC1(2,7),RC2(2,7),NC1(2,7)];

means = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),mean(day12),mean(day17),mean(day20)];

figure
plot([0 2 3 5 7 12 17 20],means,'LineWidth',3)
hold

RT1 = [0 2 3 7 12; 
    57.85	84.54	63.42	110.23	605.77];
RT2 = [0 2 3 7 12 17 20; 
    125.93	136.89	157.76	253.89	347.28	826.24	1254.71];
NT1 = [0 2 3 7 12 17 20;
    84.37	207.33	187.16	518.10	2009.14	4606.95	7395.53];
NT2 = [0 2 3 7 12 17;
    102.08	148.76	143.58	399.48	1370.74	3529.60];
NT3 = [0 2 3 5 7 12; 
    143.69	359.80	338.15	538.35	730.50	970.25];


day0 = [RT1(2,1),RT2(2,1),NT1(2,1),NT2(2,1),NT3(2,1)];
day2 = [RT1(2,2),RT2(2,2),NT1(2,2),NT2(2,2),NT3(2,2)];
day3 = [RT1(2,3),RT2(2,3),NT1(2,3),NT2(2,3),NT3(2,3)];
day5 = NT3(2,4);
day7 = [RT1(2,4),RT2(2,4),NT1(2,4),NT2(2,4),NT3(2,5)];
day12 = [RT1(2,5),RT2(2,5),NT1(2,5),NT2(2,5),NT3(2,6)];
day17 = [RT2(2,6),NT1(2,6),NT2(2,6)];
day20 = [RT2(2,7),NT1(2,7)];

means = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),mean(day12),mean(day17),mean(day20)];

plot([0 2 3 5 7 12 17 20],means,'LineWidth',3)


RT3 = [0 2 3 7 12 17 20; 
    73.48	110.23	96.89	104.76	270.96	872.93	1376.87];
RT4 = [0 2 3 7 12 17 20; 
    101.02	86.35	50.07	37.40	13.99	0.00	0.00];
NT4 = [0 2 3 5 7 12;
    119.92	242.78	283.04	497.64	970.25	2612.31];

day0 = [RT3(2,1),RT4(2,1),NT4(2,1)];
day2 = [RT3(2,2),RT4(2,2),NT4(2,2)];
day3 = [RT3(2,3),RT4(2,3),NT4(2,3)];
day5 = NT4(2,4);
day7 = [RT3(2,4),RT4(2,4),NT4(2,5)];
day12 = [RT3(2,5),RT4(2,5),NT4(2,6)];
day17 = [RT3(2,6),RT4(2,6)];
day20 = [RT3(2,7),RT4(2,7)];

means = [mean(day0),mean(day2),mean(day3),mean(day5),mean(day7),mean(day12),mean(day17),mean(day20)];
plot([0 2 3 5 7 12 17 20],means,'LineWidth',3)

legend('Controls','Monotherapy','Dual-therapy','Location','best')

xlabel('Day')
ylabel('Tumor volume (mm$^3$)')
title('Mean tumor volumes per time for treatment groups')
set(gca,'FontSize',20)
set(gca,'FontName','Times New Roman')