function R=GLR_PP(data1,data2)
T1=length(data1)-1;
T2=length(data2)-1;
T=T1+T2+1;
N1=data1(end)-data1(1);
N2=data2(end)-data2(1);
N=data2(end)-data1(1);
lambda1=(N1)/T1;
lambda2=(N2)/T2;
lambda=(N)/T;
% 
% R1=(N1*log(lambda1)-lambda1*T1+N2*log(lambda2)-lambda2*T2);
% R2=(N*log(lambda)-lambda*T);
R=(N1*log(lambda1)-lambda1*T1+N2*log(lambda2)-lambda2*T2)-(N*log(lambda)-lambda*T);