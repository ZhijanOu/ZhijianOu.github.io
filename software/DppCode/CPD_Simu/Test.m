clc;clear;close all;
sz=500; subsize=10:30; suborder=[0:2:6;0.25,0.25,0.25,0.25]; feature_l=5;
rpttm=1000;
A=GenData(sz,subsize,suborder,feature_l);

gamma=0:2:6;
p_rcr=zeros(4,rpttm);
t_rcr=zeros(4,rpttm);
prf_rcr=zeros(1,rpttm);
trf_rcr=zeros(1,rpttm);

for i=1:rpttm
    A=GenData(sz,subsize,suborder,feature_l);
    for j=1:length(gamma)
        tic;
        C=SeDppMap(A,gamma(j));
        t_rcr(j,i)=toc;
        p_rcr(j,i)=det(A(C,C))/det(A+eye(sz));
    end
    tic;
    Crf=greedy(A,ones(1,sz),1,1);
    trf_rcr(i)=toc;
    prf_rcr(i)=det(A(Crf,Crf))/det(A+eye(sz));
    if (mod(i,100)==0)
        display([num2str(i),' completed']);
    end
end

p_rto=zeros(4,rpttm);
t_rto=zeros(4,rpttm);

for i=1:length(gamma)
    p_rto(i,:)=log(p_rcr(i,:))-log(prf_rcr);
    t_rto(i,:)=t_rcr(i,:)./trf_rcr;
end

p_sta=zeros(4,2);
p_sta(:,1)=mean(p_rto,2);
p_sta(:,2)=std(p_rto,0,2);

t_sta=zeros(4,2);
t_sta(:,1)=mean(t_rto,2);
t_sta(:,2)=std(t_rto,0,2);

save('ExpResult.mat');