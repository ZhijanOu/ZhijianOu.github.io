clc;close all;clear;
load L-kernel1.mat;
load DemoData.mat;

L=abs(L);


%% Plotting Area
pv=2:111;
imshow(L(pv,pv),'XData', [2 111], 'YData', [2 111]);

L_diag=diag(L);
timeline=(1:length(speech))/fs;
dpp_can_v=zeros(1,length(speech))-10;
dpp_can_v(round(dpp_can*0.01*fs))=L_diag;

ts=5*fs:14.2*fs;
ts1=5*fs:8.6*fs-1;
ts2=8.6*fs:11.38*fs-1;
ts3=11.38*fs:12.74*fs-1;
ts4=12.74*fs:14.2*fs;

figure, hold on;
plot(timeline(ts1),speech(ts1),'b');
plot(timeline(ts2),speech(ts2),'g');
plot(timeline(ts3),speech(ts3),'m');
plot(timeline(ts4),speech(ts4),'g');

% plot(timeline(ts1),speech(ts1),'b');
% plot(timeline(ts2),speech(ts2),'b');
% plot(timeline(ts3),speech(ts3),'b');
% plot(timeline(ts4),speech(ts4),'b');

% h1=plot(timeline(ts),dpp_can_v(ts)/max(L_diag),'g+');

h1=plot(timeline(round(scan_v_temp*0.01*fs)),q_can_temp/max(q_can_temp)*4,'r');

% h1=plot(timeline(ts),dpp_can_v(ts)*10-5,'g');
% plot(timeline(ts),dpp_can_v(ts)*-1,'r');


% legend(h1,'Change-Point Candidates');
legend(h1,'d scores');
xlabel('time /s');
axis([5.3 14.2 -1 1]);

box on;
set(gca, 'fontsize', 24, 'linewidth',0.5);
set(get(gca,'Children'),'linewidth',2,'markersize',10);
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);

wavwrite(speech(5*fs:14.2*fs),fs,'TestFile');