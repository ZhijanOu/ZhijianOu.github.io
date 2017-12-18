%% [FA,MD,GT,DET,CFC_Auto,CFC_Ref]
function EvaResult=SegEva(SegAuto,SegRef,collar)
FA=0;
for i=1:length(SegAuto)
    if ~sum(abs(SegRef-SegAuto(i))<collar)
        FA=FA+1;
    end
end
MD=0;
for i=1:length(SegRef)
    if ~sum(abs(SegAuto-SegRef(i))<collar)
        MD=MD+1;
    end
end
GT=length(SegRef);
DET=length(SegAuto);
CFC_Auto=DET-FA;
CFC_Ref=GT-MD;
EvaResult=[FA,MD,GT,DET,CFC_Auto,CFC_Ref];
% FAR=FA/(FA+GT);
% MDR=MD/(GT);
% PRC=CFC_Auto/DET;
% RCL=CFC_Ref/GT;
% F1=2*PRC*RCL/(PRC+RCL);