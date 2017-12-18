clc;clear;close all;
run start_up.m;
load('FileName.mat');
FileNum=length(FileName);
% FileNum=10;
Result=zeros(FileNum,6);
EvaSpa=zeros(FileNum,5);
collar=1.5;
Ts=0.01;
max_l_list=round((0.5:0.5:30)/Ts);
Par_l=length(max_l_list);
TPR=zeros(1,Par_l);
FPR=zeros(1,Par_l);
gamma=3;

for j=1:Par_l
    max_l=max_l_list(j);
    for i=1:FileNum
        fstr=FileName{i};
        load([fstr,'.mat']);
        
        %     figure, hold on;
        %     plot(SamTime,SamSig);
        C=DppSeg(SamSig,Ts,gamma,max_l);
        SegAuto=C*Ts;
        
        %% Evaluation
        Result(i,:)=SegEva(SegAuto,SegRef,collar);
        EvaSpa(i,:)=SegCal(Result(i,:));
    end
    Eva=SegCal(sum(Result));
    TPR(j)=Eva(4);
    FPR(j)=1-Eva(3);
end
save('Roc_Dpp3.mat');

%% Ploting
% Time_l=length(SamTime);
% SegAuto_v=zeros(1,Time_l);
% SegRef_v=zeros(1,Time_l);
% SegAuto_v(C)=1;
% SegRef_v(round(SegRef/Ts))=0.5;
%
% figure, hold on;
% plot(SamTime,SamSig/max(SamSig));
% plot(SamTime,SegAuto_v,'g');
% plot(SamTime,SegRef_v,'r');
