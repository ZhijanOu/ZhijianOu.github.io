function TimeStr=frame2time(FrameIdx,Ts)
time=FrameIdx*Ts/1000;
minute=floor(time/60);
second=time-minute*60;
sint=floor(second);
sdec=second-sint;
sint=num2str(sint);
z=num2str(zeros(1,2-length(sint)));
z(find(z==' '))=[];
sint=[z,sint];
sdec=num2str(sdec);
sdec=sdec(3:end);
z=num2str(zeros(1,3-length(sdec)));
z(find(z==' '))=[];
sdec=[sdec,z];
second=[sint,'.',sdec];
TimeStr=[num2str(minute),':',second];