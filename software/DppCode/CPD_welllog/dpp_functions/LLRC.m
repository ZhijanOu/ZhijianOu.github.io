function d=LLRC(x1,x2)
L1=GauL(x1)+GauL(x2);
L0=GMMEsti([x1,x2]);
d=L1-L0;
end