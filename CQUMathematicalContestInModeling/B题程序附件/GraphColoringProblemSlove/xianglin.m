function f=xianglin(XX)
j=1;
for i=1:length(XX)
    if(XX(i)~=0)
        C(j)=i;
        j=j+1;
    end
end
f=C;