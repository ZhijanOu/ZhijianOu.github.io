clc;clear;close all;
run start_up.m;
fid=fopen('FilenameList');
FileName=textscan(fid,'%s');
fclose(fid);

FileName=FileName{1};

for i=1:length(FileName)
    fstr=FileName{i};
    fstr=fstr(1:length(fstr)-4);
    save('temp.mat');
    run PreFtrExt.m;
    save(['./Hub4m97/',fstr,'.mat']);
    clear;
    load('temp.mat');
    display([fstr,' completed']);
end