% C=sort(C);
% x=MFCCs(:,round(Y{C(1),1}/fs/Ts*1000):round(Y{C(2),1}/fs/Ts*1000));
function L=GMMEsti(x)
[D,N]=size(x);
[~, model, ~]=emgm(x,2);
w1=model.weight(1);
w2=model.weight(2);
mu1=model.mu(:,1);
mu2=model.mu(:,2);
invSigma1=inv(model.Sigma(:,:,1));
invSigma2=inv(model.Sigma(:,:,2));
detSigma1=det(model.Sigma(:,:,1));
detSigma2=det(model.Sigma(:,:,2));
L=0;
for i=1:N
    p=w1*(2*pi)^(-D/2)*detSigma1^(-0.5)*exp(-(x(:,i)-mu1)'*invSigma1*(x(:,i)-mu1)) ...
        + w2*(2*pi)^(-D/2)*detSigma2^(-0.5)*exp(-(x(:,i)-mu2)'*invSigma2*(x(:,i)-mu2));
    L=L+log(p);
end
end