%%% Model the observations as a multivariate Gaussian Variable 
%%% Input: the P-N matrix X with each column an observation
%%% Output: the mean Vector and the covariance matrix 

function [mu,Sigma]=GauEsti(X)
X=X';
mu=mean(X)'; 
Sigma=cov(X);
end