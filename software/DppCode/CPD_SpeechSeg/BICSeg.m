% clc;clear;close all;
% run FtrExt.m;
function SegResult=BICSeg(MFCCs,Ts)

%% Hub4m97
lambda=1.2;
StpCoarse=round(200/Ts);
StpFine=round(100/Ts);
EvaRng=round(2000/Ts);
StpEva=round(500/Ts);
Padding=round(500/Ts);
TrlBffr=round(0/Ts);

%% Tel Record
% lambda=1.5;
% StpCoarse=round(200/Ts);
% StpFine=round(100/Ts);
% EvaRng=round(2000/Ts);
% StpEva=round(500/Ts);
% Padding=round(500/Ts);
% TrlBffr=round(0/Ts);

Tn=size(MFCCs,2);
pstrt=1;
i=pstrt+EvaRng;
SegResult=[];

while(i<Tn)
    BICvalue=WinBIC(MFCCs(:,pstrt:i),StpCoarse,Padding,i-pstrt-Padding,lambda);
%     plot(BICvalue);
    [maxValue,maxIdx]=max(BICvalue);
    maxIdx=(maxIdx-1)*StpCoarse;
    if (maxValue>0 && maxIdx<i-pstrt+1-TrlBffr)
%         p1=max(maxIdx+Padding-SrchRng-1,Padding);
%         p2=min(maxIdx+Padding+SrchRng-1,i-pstrt+1-Padding);
%         BICvalue=WinBIC(MFCCs(:,pstrt:i),StpFine,p1,p2,lambda);
        BICvalue=WinBIC(MFCCs(:,pstrt:i),StpFine,Padding,i-pstrt-Padding,lambda);
%         plot(BICvalue);
        [~,maxIdxFine]=max(BICvalue);
        SegResult=[SegResult,(maxIdxFine-1)*StpFine+pstrt+Padding-2];
%         SegResult=[SegResult,(maxIdxFine-1)*StpFine+pstrt+p1-2];
        pstrt=i+1;
        i=pstrt+EvaRng;
    else
        i=i+StpEva;
    end
end

% time=(1:length(speech))/fs;
% frame_v=(1:Tn)*0.01;
% SegResult_v=zeros(1,Tn);
% SegResult_v(SegResult)=1;

% figure, hold on;
% plot(time,speech);
% plot(frame_v,SegResult_v,'r');

