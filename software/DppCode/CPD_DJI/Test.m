clc;clear;close all;
run DataImport.m;
Data_l=length(Open);
Return=((Close-Open)./Open)';
% figure, hold on;
% plot(Return/max(Return)*5);
C=DppSeg(Return,0);

%% Generate Reference 
SegRef=zeros(1,Data_l);
% Ref={'1973-01-30';'1973-10-19';'1974-08-09';'1974-12-06'};
Ref={'1973-01-30';'1973-10-19';'1974-08-09';'1974-12-06'};
for i=1:length(Ref)
    for j=1:Data_l
        if strcmp(Date{j},Ref{i})
            SegRef(j)=1;
        end
    end
end


%% Ploting
time=1:Data_l;
SegAuto=zeros(1,Data_l);
SegAuto(C)=1;

figure, hold on;
plot(time,Return/max(Return));
h1=plot(time,SegAuto*4-3,'g');
h2=plot(time,SegRef*4-3,'r');
ylabel('DJIA Return');
xlabel('Time');
axis([0 755 -1 1]);
legend([h1 h2], 'BwDppCpd', 'Reference','Location','SouthWest');

box on;
set(gca, 'fontsize', 18, 'linewidth',0.5);
set(get(gca,'Children'),'linewidth',2,'markersize',10);
set(get(gca,'XLabel'),'FontSize',18);
set(get(gca,'YLabel'),'FontSize',18);