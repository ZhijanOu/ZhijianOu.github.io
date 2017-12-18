clc;clear;close all;
load FileName.mat;

% ita_list=0:0.01:20;
ita_list=2.4;
TPR=zeros(1,length(ita_list));
FPR=zeros(1,length(ita_list));

for k=1:length(ita_list)
    ita=ita_list(k);
%     ita=2.4;
    Ts=0.05; collar=1.5;
    FileNum=length(FileName);
    % FileNum=10;
    Result=zeros(FileNum,6);
    EvaSpa=zeros(FileNum,5);
    
    for i=1:FileNum
        
        fstr=FileName{i};
        load([fstr,'_score.mat']);
        
        
        %% Lowpass filter the signal
        fs=1/0.05;
        fc=0.01;
        Wn=(2/fs)*fc;
        b=fir1(20,Wn,'low',kaiser(21,3));
        % fvtool(b,1,'Fs',fs);
        score=filter(b,1,score);
        score=filter(b,1,score);
        
        %% Find Change Points
        [~,C]=findpeaks(score);
        C(score(C)<ita)=[];
        DelList=[];
        for j=1:length(C)-1
            if C(j+1)-C(j)<20
                [~,tempidx]=min([C(j),C(j+1)]);
                DelList=[DelList,tempidx+j-1];
            end
        end
        C(DelList)=[];
        SegAuto=SamTime(C)';
        
        %% Evaluation
        Result(i,:)=SegEva(SegAuto,SegRef,collar);
        EvaSpa(i,:)=SegCal(Result(i,:));
    end
    
    Eva=SegCal(sum(Result));
    TPR(k)=Eva(4);
    FPR(k)=1-Eva(3);
end

save('ROC_RuLSIF.mat','TPR','FPR');
plot(FPR,TPR);
% display(Eva);


% subplot(2,1,1);
% plot(SamTime,SamSig);
% subplot(2,1,2);
% plot(SamTime,score,'r');

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