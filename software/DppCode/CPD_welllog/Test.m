clc;clear;close all;
run start_up.m;
fid=fopen('WellLogData');
Data=textscan(fid,'%d');
Data=double(Data{1}');
fclose(fid);

%% Outliers Removal
% plot(Data,'-*');
Data([1211:1221,1427:1431,2773:2779,3945:3963])=[];

% figure, hold on;
% plot(Data/max(Data)*5);
C=DppSeg(Data,0);
SegAuto=C;

%% Ploting
Data_l=length(Data);
time=1:Data_l;
Auto_v=zeros(1,Data_l);
Auto_v(SegAuto)=1;

h1=figure, hold on;
plot(time,Data);
plot(time,Auto_v*160000,'g');
axis([0 4000 75000 160000]);
% plot(time,Data/100000);
% plot(time,Auto_v*1.6,'g');
% axis([0 4000 0.75 1.61]);
ylabel('Nuclear Response');
xlabel('Time');
set(h1,'units', 'centimeters', 'pos', [0 0 20 10]);

box on;
set(gca, 'fontsize', 24, 'linewidth',0.1);
set(get(gca,'Children'),'linewidth',2,'markersize',10);
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);