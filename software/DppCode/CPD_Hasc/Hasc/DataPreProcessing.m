clc;close all; clear;
run start_up.m;
load FileName.mat;

for i=1:length(FileName)
    filename=FileName{i};
%     filename='HASC1001';
    fdata=[filename,'.csv'];
    fref=[filename,'.label'];

    fid=fopen(fdata);
    Data=textscan(fid,'%f%f%f%f','delimiter',',');
    time=Data{1};
    sig=sqrt(Data{2}.^2+Data{3}.^2+Data{4}.^2);
    fclose(fid);

    fid=fopen(fref);
    Data=textscan(fid,'%f%f%s','delimiter',',','commentStyle', '#');
    RefStart=Data{1};
    RefEnd=Data{2};
    fclose(fid);

    %% Change the Start Point to Zero
    StartP=time(1);
    time=time-StartP;
    RefEnd=RefEnd-StartP;
    RefStart=RefStart-StartP;

    %% Sampling from the Irregular Time Serie
    SamTime=0:0.01:time(end);
    SamSig=interp1(time,sig,SamTime);
    SegRef=unique([RefStart;RefEnd]);
    SegRef=sort(SegRef);
    SegRef([1,end])=[];
    DelList=[];
    i=1;
    while i<length(SegRef)
        if SegRef(i+1)-SegRef(i)<2
            DelList=[DelList,i];
        end
        i=i+1;
    end
    SegRef(DelList)=[];

    filepath=['./TestData/',filename,'.mat'];
    save(filepath,'SamSig','SamTime','SegRef');
end
% figure, hold on;
% plot(SamTime,SamSig);
