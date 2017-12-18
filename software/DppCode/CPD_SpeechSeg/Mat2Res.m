ResFilename=['./TelRes/',filename,'.res'];
fid=fopen(ResFilename,'w');
SegNum=length(SegAuto);

fprintf(fid,'%s%d','segnum=',SegNum);
Y=zeros(SegNum,2);
Y(:,1)=SegAuto';
Y(:,2)=[SegAuto(2:end)';size(MFCCs,2)*0.01];
Y=round(Y*100);
for i=1:SegNum
    TempStr=['begt=',frame2time(Y(i,1),Ts),' endt=',frame2time(Y(i,2),Ts),''];
    fprintf(fid,'\n%s',TempStr);
end

fclose(fid);