
function C=SeDppMap(A,gamma) 
sz=size(A,1);
sub_idx=[1];

i=1;
while i<=sz
    p=i+sum(A(i,i:end)~=0);
    if p>sz
        break;
    end
    if sum(A(1:p-1,p)~=0)<=gamma
%         sub_idx(p)=1;
        sub_idx=[sub_idx,p];
    end
    i=p;
end

if sz-sub_idx(end)<gamma
    sub_idx(end)=[];
end

sub_idx=[sub_idx,sz+1];

C=[];
tmpC=[];
ovrlp1=-gamma:-1;

for i=1:length(sub_idx)-1
    ps=sub_idx(i);
    pe=sub_idx(i+1)-1;
    tmp_idx=ps:1:pe;
    tmpA=A(tmp_idx,tmp_idx);
    if ps==1
        tmpC=greedy(tmpA,ones(1,length(tmp_idx)),1,1);
        tmpC=tmpC+ps-1;
        C=[C,tmpC'];
    else
        lwidx=ovrlp1+ps;
        lwidx=intersect(lwidx,tmpC);
        ovrlp_sz=length(lwidx);
        uppridx=sort(2*ps-lwidx-1);
        
        invA_idx=size(invA,1)-ovrlp_sz+1:size(invA,1);
        
        tmpS=A(uppridx,lwidx)*invA(invA_idx,invA_idx)*A(lwidx,uppridx);
%         save('debug.mat');
        tmpA(uppridx-ps+1,uppridx-ps+1)=tmpA(uppridx-ps+1,uppridx-ps+1)-tmpS;
        tmpC=greedy(tmpA,ones(1,length(tmp_idx)),1,1);
        tmpC=tmpC+ps-1;
        C=[C,tmpC'];
    end
    invA=inv(A(tmpC,tmpC));
end