clc;clear;close all;
run CoalMiningData.m;
run start_up.m;

Y=CountCdf;
data_l=length(Y);
C=DppSeg(Y,0);

Year_v=1851:0.01:1963;
C_v=zeros(1,length(Year_v));

for i=C
C_v(Year_v==i+1850)=1;
end

h1=figure, hold on;
plot(Year,Y);
plot(Year_v, C_v*205-5,'g');

axis([1851 1963 0 200]);
xlabel('Year');
ylabel('Cumulative Counts');
set(h1,'units', 'centimeters', 'pos', [0 0 20 10]);

box on;
set(gca, 'fontsize', 24, 'linewidth',0.5);
set(get(gca,'Children'),'linewidth',2,'markersize',10);
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);