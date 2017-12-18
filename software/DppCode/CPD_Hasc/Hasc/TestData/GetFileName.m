clc;clear;
fileFolder=fullfile('./');
dirOutput=dir(fullfile(fileFolder,'*'));
fileNames={dirOutput.name}';
FileName={};
for i=1:size(fileNames,1)
    str=fileNames{i};
    if length(str>6)
        if strcmp(str(9:end),'.csv')
            str=str(1:8);
            FileName=[FileName;{str}];
        end
    end
end
save('FileName.mat','FileName');