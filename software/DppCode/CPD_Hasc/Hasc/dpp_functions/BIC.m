% xi=Y{2,2};
% xj=Y{2,3};
% lambda=1;
function BIC_value=BIC(xi,xj,lambda)
%% Parameter estimation
[~,Sigma]=GauEsti([xi,xj]);
[~,Sigmai]=GauEsti(xi);
[~,Sigmaj]=GauEsti(xj);
[d,Ni]=size(xi);
Nj=size(xj,2);
N=Ni+Nj;

%% Calculate the symmetric KL divergence 
R=N*log(det(Sigma))-Ni*log(det(Sigmai))-Nj*log(det(Sigmaj));
P=1/2*(d+d*(d+1)/2)*log(N);
BIC_value=R-lambda*P;
% if (BIC_value<0)
%     BIC_value=0;
% end
% end