function BICvalue=WinBIC(MFCCs,Stp,Strt,End,lambda)
v=Strt:Stp:End;
lv=length(v);
BICvalue=zeros(1,lv);
for i=1:lv
    BICvalue(i)=BIC(MFCCs(:,1:v(i)),MFCCs(:,v(i)+1:end),lambda);
end
end