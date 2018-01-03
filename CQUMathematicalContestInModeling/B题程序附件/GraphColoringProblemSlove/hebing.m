function f=hebing(A,B)
for i=1:length(B)
    flag=0;
    for j=1:length(A)
    if(B(i)==A(j))
        flag=1;
        break;
    end
    end
    if(flag==0)
        A(length(A)+1)=B(i);
    else 
        continue;
    end
end
f=A;