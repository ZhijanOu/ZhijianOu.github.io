clc;clear;close all;
load ExpResult.mat;
figure, hold on;
subplot(1,2,1);
h=errorbar(0:2:6,p_sta(:,1),3*p_sta(:,2)/sqrt(rpttm),'--');
errorbar_tick(h,20);
axis([-0.5 6.5 -0.6 0.1]);
xlabel('\gamma');
ylabel('log (p / p_{ref})');
box on;
set(gca, 'fontsize', 24, 'linewidth',0.1);
set(get(gca,'Children'),'linewidth',4,'markersize',10);
set(get(gca,'XLabel'),'FontSize',32);
set(get(gca,'YLabel'),'FontSize',32);


% figure, hold on;
subplot(1,2,2);
h=errorbar(0:2:6,t_sta(:,1),3*t_sta(:,2)/sqrt(rpttm),'--');
errorbar_tick(h,20);
axis([-0.5 6.5 0 0.1]);
xlabel('\gamma');
ylabel('t / t_{ref}');
box on;
set(gca, 'fontsize', 24, 'linewidth',0.1);
set(get(gca,'Children'),'linewidth',4,'markersize',10);
set(get(gca,'XLabel'),'FontSize',32);
set(get(gca,'YLabel'),'FontSize',32);
