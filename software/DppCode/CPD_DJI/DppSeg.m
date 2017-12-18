% clc;clear;close all;
function C=DppSeg(Data,gamma)
% run FtrExt;

% parameter setting
%% Change Point Detection, Syhthetic Data
Tstp=round(10); Twin=round(100); Tn=size(Data,2);
max_l=round(100); lambda=1;


% Find candidate dpp items 
scan_v=Twin+1:Tstp:Tn-Twin;
scan_l=length(scan_v);
q_can=zeros(1,length(scan_v));
for i=1:scan_l
    q_can(i)=SymKL(Data(:,scan_v(i)-Twin+1:scan_v(i)),Data(:,scan_v(i)+1:scan_v(i)+Twin));
end
thrs=mean(q_can);%std(q_can);
% plot(scan_v,q_can/max(q_can)*10,'-*r');
[q_can,q_can_Idx]=findpeaks(q_can);
scan_v=scan_v(q_can_Idx);
dpp_can=scan_v(find(q_can>thrs));
% dpp_can=scan_v(q_can_Idx);

% Building the quality vector
q=zeros(1,length(dpp_can));
dpp_can=[1,dpp_can,Tn];
for i=1:length(dpp_can)-2
    ldata=Data(:,min(dpp_can(i),dpp_can(i+1)-Twin):dpp_can(i+1)-1);
    rdata=Data(:,dpp_can(i+1):max(dpp_can(i+2),dpp_can(i+1)+Twin));
    q(i)=log(SymKL(ldata,rdata))+2.5;
    % q(i)=SymKL(ldata,rdata);
    % q(i)=BIC(ldata,rdata,1.5);
end
dpp_can([1,end])=[];
dpp_can(q<0.1)=[];
q(q<0.1)=[];

%% Building the similarity matrix: Gaussian Kernel
Threshold=0.01; sigma=sqrt(-max_l^2/log(Threshold));
S=exp(- (bsxfun(@minus,dpp_can,dpp_can').^2/ sigma^2));
S=S.*(S>Threshold);

% figure, hold on;
% plot(dpp_can,q,'*-r');


% MAP inference with SeDpp
M=diag(sqrt(q));
C=SeDppMap(M*S*M,gamma);
C=sort(dpp_can(C));

% The validatoin step
% run VldStp;