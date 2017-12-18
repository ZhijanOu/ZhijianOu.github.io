clc;clear;close all;
sz=500; subsize=10:30; suborder=[0:2:6;0.25,0.25,0.25,0.25]; feature_l=5;
A=GenData(sz,subsize,suborder,feature_l);

%% Normalizing 
% A=(A==0);
A=abs(A);
% A=1-A;
% A(A<0)=0;
% A=A/max(max(A));

%% Plotting Area
pv=1:100;

imshow(A(pv,pv),'XData', [1 100], 'YData', [1 100]);
% imshow((A(pv,pv)>0),'XData', [1 100], 'YData', [1 100]);
% imagesc(A(pv,pv));
% iptsetpref('ImshowAxesVisible','on');