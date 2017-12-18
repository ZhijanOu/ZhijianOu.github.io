%% Hub4m97 data
%% LOADING DATA AREA
clear;clc;close all;
run start_up.m;
load TestDataList.mat;
BadList=[9,12,15,18,21,22,24,33,34,37];
TestDataList(BadList)=[];
FileNum=length(TestDataList);

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
    load(TestDataList{i});
    SegRef=SegRef-time(1);

%% DppSeg
    gamma=0;
    C=DppSeg(MFCCs,Ts,gamma);
    SegAuto_Dpp=C/100;
    DppResult(i,:)=SegEva(SegAuto_Dpp,SegRef,collar);
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

save('SegExpResult.mat');
