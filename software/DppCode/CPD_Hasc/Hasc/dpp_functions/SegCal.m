%% [FAR,MDR,PRC,RCL,F1]
function SegResult=SegCal(Sta)
FA=Sta(1);
MD=Sta(2);
GT=Sta(3);
DET=Sta(4);
CFC_Auto=Sta(5);
CFC_Ref=Sta(6);

FAR=FA/(FA+GT);
MDR=MD/(GT);
PRC=CFC_Auto/DET;
RCL=CFC_Ref/GT;
F1=2*PRC*RCL/(PRC+RCL);
SegResult=[FAR,MDR,PRC,RCL,F1];