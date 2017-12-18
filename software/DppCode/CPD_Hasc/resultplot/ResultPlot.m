clc;clear;close all;
load Roc_Dpp3.mat; %% gamma=3
FPR_dpp=FPR;
TPR_dpp=TPR;
% load Roc_Dpp1.mat;
% FPR_dpp1=FPR;
% TPR_dpp1=TPR;
load ROC_RuLSIF.mat;
FPR_Ru=FPR;
TPR_Ru=TPR;

%% plotting area
FPR_v_dpp=0.04:0.03:0.62;
FPR_v_Ru=0.04:0.03:0.7;
dpp_v=[];
% dpp_v1=[];
Ru_v=[];
for i=1:length(FPR_v_dpp)
    [~,idx]=min(abs(FPR_dpp-FPR_v_dpp(i)));
    dpp_v=[dpp_v,idx];
end
    
for i=1:length(FPR_v_Ru)
%     [~,idx]=min(abs(FPR_dpp1-FPR_v(i)));
%     dpp_v1=[dpp_v1,idx];
    [~,idx]=min(abs(FPR_Ru-FPR_v_Ru(i)));
    Ru_v=[Ru_v,idx];
end

% dpp_v=1:3:53;
% Ru_v=1:30:450;

h=figure, hold on; 
plot(FPR_dpp(dpp_v),TPR_dpp(dpp_v),'ro-');
% plot(FPR_dpp1(dpp_v),TPR_dpp1(dpp_v),'g^-');
plot(FPR_Ru(Ru_v),TPR_Ru(Ru_v),'b+-');
axis([0 1 0.5 1]);
legend('BwDppCpd','RuLSIF','Location','SouthEast');
xlabel('FPR');
ylabel('TPR');
set(h,'units', 'centimeters', 'pos', [0 0 20 7]);


box on;
set(gca, 'fontsize', 24, 'linewidth',0.1);
set(get(gca,'Children'),'linewidth',2,'markersize',10);
set(get(gca,'XLabel'),'FontSize',24);
set(get(gca,'YLabel'),'FontSize',24);