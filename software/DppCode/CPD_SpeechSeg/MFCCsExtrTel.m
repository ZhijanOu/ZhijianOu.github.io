clc;clear;close all;
run start_up.m;
load('FileName.mat');

for i=1:length(FileName)
    fstr=FileName{i};
    save('temp.mat');
    run PreFtrExt.m;
    SegRef=ReadRefTel(fstr);
    SegRef(SegRef<1)=[];
    time=length(speech)/fs;
    SegRef(abs(SegRef-time)<1)=[];
    save(['./TelRecords/',fstr,'.mat'],'speech','fs','MFCCs','Ts','SegRef');
    clear;
    load('temp.mat');
    display([fstr,' completed']);
end