function S=GenData(sz,subsize,suborder,feature_l)

size_ran=randsrc(1,sz,subsize);
order_ran=randsrc(1,sz,suborder);

sub_list=zeros(1,sz);
for i=1:sz
    sub_list(i)=sum(size_ran(1:i));
    if sub_list(i)>=sz
        sub_list(i)=sz;
        sub_list=sub_list(1:i);
        order_list=order_ran(1:i-1);
        break;
    end
end

sub_list=[0,sub_list];
sub_num=i;

V=zeros((2*sub_num-1)*feature_l,sz);
for i=1:sub_num
    for j=sub_list(i)+1:sub_list(i+1)
        V(2*(i-1)*feature_l+1:(2*i-1)*feature_l,j)=randn(feature_l,1);
    end
end
    
for i=1:sub_num-1
    order=min([order_list(i),sz-sub_list(i+1),sub_list(i+1)]);
    for j=sub_list(i+1)-order+1:sub_list(i+1)+order
        V((2*i-1)*feature_l+1:2*i*feature_l,j)=randn(feature_l,1);
    end
end

for i=1:sz
    V(:,i)=V(:,i)/(sqrt(V(:,i)'*V(:,i)));
end

S=V'*V;

q=randn(1,sz);
S=diag(q)*S*diag(q);
