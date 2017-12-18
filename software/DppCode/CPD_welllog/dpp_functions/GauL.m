% C=sort(C);
% x=MFCCs(:,round(Y{C(1),1}/fs/Ts*1000):round(Y{C(2),1}/fs/Ts*1000));

function L=GauL(x)
[mu,Sigma]=GauEsti(x);
[D,N]=size(x);
L=-N*D*0.5*(log(2*pi)+1)-N*0.5*log(det(Sigma));
end


