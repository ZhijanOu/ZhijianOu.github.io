C_new=[];
C_old=C;

Con=1;

while(Con)
    C_old_l=length(C_old);
    M_final=zeros(C_old_l,1);
    C_old=[1,C_old,Tn];
    for i=1:C_old_l
        M_final(i)=BIC(Data(:,C_old(i):C_old(i+1)),Data(:,C_old(i+1):C_old(i+2)),lambda);
    end
    C_old([1,end])=[];
    C_new=C_old(find(M_final>0));
    
    if(length(C_new)==length(C_old))
        Con=0;
    end

%     C_old_index=round(frame_index(C_old));
%     C_old_v=zeros(length(speech),1);
%     C_old_v(C_old_index)=1;
%     figure, hold on;
%     plot(time,speech);    
%     plot(time,C_old_v,'g');
%     plot(C_old_index/fs,M_final/max(M_final),'*k-');
    
    C_old=C_new;
    C_new=[];
end

C=C_old;

% C_index=round(frame_index(C));
% C_final_index=round(frame_index(C_old));
% C_final_v=zeros(length(speech),1);
% C_final_v(C_final_index)=1;

% figure, hold on;
% plot(time,speech);
% plot(time,C_final_v,'g');
% plot(C_index/fs,M_final/max(M_final),'*k-');


