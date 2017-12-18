% xi=Y{1,2};
% xj=Y{1,3};
function KL_value=SymKL(xi,xj)
%% Parameter estimation
[mui,Sigmai]=GauEsti(xi);
[muj,Sigmaj]=GauEsti(xj);

%% Calculate the symmetric KL divergence 
S=length(mui);
inv_Sigmai=inv(Sigmai);
inv_Sigmaj=inv(Sigmaj);
KL_value=trace(Sigmai*inv_Sigmaj)+trace(Sigmaj*inv_Sigmai)-2*S+trace((inv_Sigmai+inv_Sigmaj)*(mui-muj)*(mui-muj)');
% KL_value2=trace(Sigmai/Sigmaj)+trace(Sigmaj/Sigmai)-2*S+trace((inv(Sigmai)+inv(Sigmaj))*(mui-muj)*(mui-muj)');

% end