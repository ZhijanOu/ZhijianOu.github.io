clc;clear;close all;
% function C=DppSeg(MFCCs,Ts,gamma)
% run FtrExt;

run start_up.m;
% filename='Mv97626c';
filename='1339254'; gamma=0;
fstr=[filename,'.mat'];
load(fstr);

% parameter setting
%% Hub4m97
Tstp=round(100/Ts); Twin=round(500/Ts); Tn=size(MFCCs,2);
max_l=round(2500/Ts); lambda=1;

%% Tel Record
% Tstp=round(100/Ts); Twin=round(500/Ts); Tn=size(MFCCs,2);
% max_l=round(2400/Ts); lambda=1.4;

% Find candidate dpp items 
scan_v=Twin+1:Tstp:Tn-Twin;
scan_l=length(scan_v);
q_can=zeros(1,length(scan_v));
for i=1:scan_l
    q_can(i)=SymKL(MFCCs(:,scan_v(i)-Twin+1:scan_v(i)),MFCCs(:,scan_v(i)+1:scan_v(i)+Twin));
%     q_can(i)=BIC(MFCCs(:,scan_v(i)-Twin+1:scan_v(i)),MFCCs(:,scan_v(i)+1:scan_v(i)+Twin),1);
end
q_can_temp=q_can;
scan_v_temp=scan_v;
thrs=mean(q_can);%+0.2*std(q_can);
[q_can,q_can_Idx]=findpeaks(q_can);
scan_v=scan_v(q_can_Idx);
dpp_can=scan_v(find(q_can>thrs));


% frm_idx=(1:size(MFCCs,2))*Ts/1000*fs+1;
% dpp_can_idx=round(frm_idx(dpp_can));

% Building the quality vector
q=zeros(1,length(dpp_can));
dpp_can=[1,dpp_can,Tn];
for i=1:length(dpp_can)-2
    ldata=MFCCs(:,min(dpp_can(i),dpp_can(i+1)-Twin):dpp_can(i+1)-1);
    rdata=MFCCs(:,dpp_can(i+1):max(dpp_can(i+2),dpp_can(i+1)+Twin));
    q(i)=log(SymKL(ldata,rdata));
    % q(i)=BIC(ldata,rdata,1.5);
end
dpp_can([1,end])=[];

%% Building the similarity matrix: Gaussian Kernel
Threshold=0.01; sigma=sqrt(-max_l^2/log(Threshold));
S=exp(- (bsxfun(@minus,dpp_can,dpp_can').^2/ sigma^2));
S=S.*(S>Threshold);

% MAP inference with SeDpp
M=diag(sqrt(q));
L=M*S*M;
save('L-kernel1.mat','L','dpp_can','q_can_temp','scan_v_temp');
C=SeDppMap(M*S*M,gamma);
C=sort(dpp_can(C));

% The validatoin step
run VldStp;

% % Plotting result
% C_index=round(frm_idx(C));
% Cvct=zeros(1,length(speech));
% Cvct(C_index)=1;
% time=(1:length(speech))/fs;
% 
% figure, hold on;
% plot(time,speech);
% plot(time,Cvct,'r');
% plot(dpp_can_idx/fs,q/max(q),'-*k');