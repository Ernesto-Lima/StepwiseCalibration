x = 0:0.01:1.8;
figure
hold
for jj = 1
    for aa = 0.05:0.05:0.5
        y = x.^(jj)./(aa + x.^(jj));
        plot(x,y,'LineWidth',2)
    end
end
plot(0.3*ones(size(x)),x,'k--')
set(gca,'FontName','Times New Roman');
set(gca,'FontSize',20);
xlabel('Drug dose (mg)')
ylabel('Rate behavior with respect to drug dose')
axis([0 1.8 0 1])