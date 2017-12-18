% clear;clc;close all;
% run FtrExt.m;

function q=DISTBICSeg(MFCCs,Ts)

% parameter setting

%% Hub4m97

Tstp=round(100/Ts); Twin=round(500/Ts); Tn=size(MFCCs,2); alpha=0.2; DiscardDist=round(1000/Ts);
lambda=1;

%% Tel Record
% Tstp=round(100/Ts); Twin=round(500/Ts); Tn=size(MFCCs,2); alpha=0.2; DiscardDist=round(1000/Ts);
% lambda=1.2;
% Find candidate dpp items 
scan_v=Twin:Tstp:Tn-Twin;
scan_l=length(scan_v);
q_can=zeros(1,length(scan_v));
for i=1:scan_l
    q_can(i)=SymKL(MFCCs(:,scan_v(i)-Twin+1:scan_v(i)),MFCCs(:,scan_v(i)+1:scan_v(i)+Twin));
end

% Check if the candidate is significant
sigma=std(q_can); 
Thrs=sigma*alpha;
[qmax,imax,qmin,imin]=extrema(q_can);
[imax,TempIdx]=sort(imax);
qmax=qmax(TempIdx);
imax([1,end])=[];
qmax([1,end])=[];

[imin,TempIdx]=sort(imin);
qmin=qmin(TempIdx);

q=[];
for i=1:length(imax)
    if abs(qmax(i)-qmin(i))>Thrs && abs(qmax(i)-qmin(i+1))>Thrs
        q=[q,[qmax(i);scan_v(imax(i))]];
    end
end

con=1;
while (con)
    DelList=[];
    for i=1:length(q)-1
        if any(i==DelList)||any(i+1==DelList)
            ifbreak=1;
            
        else
            ifbreak=0;
        end
        if size(q,2)==1
            con=0;break;
        end
        if ~ifbreak && q(2,i+1)-q(2,i)<DiscardDist
            [~,TempIdx]=min([q(1,i),q(1,i+1)]);
            DelList=[DelList,i+TempIdx-1];
        end
    end
    q(:,DelList)=[];
    if isempty(DelList)==1
        con=0;
    end
end

%% Merging step
con=1;
q=q(2,:);
while con
    q=[1,q,Tn];
    q_l=length(q);
    DeltaBIC=zeros(1,q_l-2);
    for i=2:q_l-1
        DeltaBIC(i-1)=BIC(MFCCs(:,q(i-1):q(i)),MFCCs(:,q(i):q(i+1)),lambda);
    end
    DelList=DeltaBIC<0;
    q([1,end])=[];
    q(DelList)=[];
if sum(DelList)==0
    con=0;
end
end

% plot(q_can);

% time=(1:length(speech))/fs;
% frame_v=(1:Tn)*0.01;
% SegResult_v=zeros(1,Tn);
% SegResult_v(q)=1;
% 
% figure, hold on;
% plot(time,speech);
% plot(frame_v,SegResult_v,'r');