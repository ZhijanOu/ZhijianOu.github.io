%%% TelRecord data
%% LOADING DATA AREA
clear;clc;close all;
load FileName.mat;
BadList=[8,11,18,20,21,23,24,27,28,32,33,34,35,38,39,40,42,43,45,46,48,53,54,61,63,67,70,74,...
    76,77,81,82,84,87,96,98,194];
FileName(BadList)=[];
FileNum=length(FileName);
save('TestTelDataList.mat','FileName');

%% TESTING AREA
collar=0.75;
DppResult=zeros(FileNum,6);
DppResult1=zeros(FileNum,6);
DppResult2=zeros(FileNum,6);
DppResult3=zeros(FileNum,6);
BICResult=zeros(FileNum,6);
DistResult=zeros(FileNum,6);

for i=1:FileNum
%% Load data
    load(FileName{i});
    filename=FileName{i};
%% DppSeg
    gamma=0;
    C=DppSeg(MFCCs,Ts,gamma);
    SegAuto_Dpp=C/100;
    DppResult(i,:)=SegEva(SegAuto_Dpp,SegRef,collar);
%     SegAuto=SegAuto_Dpp;
%     run Mat2Res.m;
%% DppSeg1
    gamma=1;
    C=DppSeg(MFCCs,Ts,gamma);
    SegAuto_Dpp=C/100;
    DppResult1(i,:)=SegEva(SegAuto_Dpp,SegRef,collar);
%% DppSeg2
    gamma=2;
    C=DppSeg(MFCCs,Ts,gamma);
    SegAuto_Dpp=C/100;
    DppResult2(i,:)=SegEva(SegAuto_Dpp,SegRef,collar);
%% DppSeg3
    gamma=3;
    C=DppSeg(MFCCs,Ts,gamma);
    SegAuto_Dpp=C/100;
    DppResult3(i,:)=SegEva(SegAuto_Dpp,SegRef,collar);
%% BICSeg
    C=BICSeg(MFCCs,Ts);
    SegAuto_BIC=C/100;
    BICResult(i,:)=SegEva(SegAuto_BIC,SegRef,collar);
%% DISTBICSeg
    C=DISTBICSeg(MFCCs,Ts);
    SegAuto_Dist=C/100;
    DistResult(i,:)=SegEva(SegAuto_Dist,SegRef,collar);
end

EvaDpp=SegCal(sum(DppResult));
EvaDpp1=SegCal(sum(DppResult1));
EvaDpp2=SegCal(sum(DppResult2));
EvaDpp3=SegCal(sum(DppResult3));
EvaBIC=SegCal(sum(BICResult));
EvaDist=SegCal(sum(DistResult));

DppResSep=zeros(FileNum,5);
DppResSep1=zeros(FileNum,5);
DppResSep2=zeros(FileNum,5);
DppResSep3=zeros(FileNum,5);
BICResSep=zeros(FileNum,5);
DistResSep=zeros(FileNum,5);

for i=1:FileNum
    DppResSep(i,:)=SegCal(DppResult(i,:));
    DppResSep1(i,:)=SegCal(DppResult1(i,:));
    DppResSep2(i,:)=SegCal(DppResult2(i,:));
    DppResSep3(i,:)=SegCal(DppResult3(i,:));
    BICResSep(i,:)=SegCal(BICResult(i,:));
    DistResSep(i,:)=SegCal(DistResult(i,:));
end

save('SegExpResultTel.mat');
