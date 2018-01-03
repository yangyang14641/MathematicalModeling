A=zeros(14);
A(1,2)=1;A(1,6)=1;
A(2,1)=1;A(2,3)=1;A(2,6)=1;
A(3,2)=1;A(3,4)=1;A(3,8)=1;
A(4,3)=1;A(4,5)=1;A(4,9)=1;
A(5,4)=1;
A(6,1)=1;A(6,2)=1;A(6,7)=1;A(6,10)=1;
A(7,6)=1;A(7,8)=1;A(7,10)=1;A(7,11)=1;
A(8,3)=1;A(8,7)=1;A(8,9)=1;A(8,12)=1;
A(9,4)=1;A(9,8)=1;A(9,13)=1;A(9,14)=1;
A(10,6)=1;A(10,7)=1;
A(11,7)=1;A(11,12)=1;
A(12,8)=1;A(12,11)=1;A(12,13)=1;
A(13,9)=1;A(13,12)=1;A(13,14)=1;
A(14,9)=1;A(14,13)=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
len=length(A);
for se=2:len
    clear C
    B=zeros(1,len);
    B(1)=1;
    C=hebing(1,xianglin(A(1,:)));
    fla=0;
    for k=1:len
        C=hebing(C,xianglin(A(C(k),:)));
    for j=1:se
        yan=j;
        flag=0;
        x=C(k);
   %%%%%%compare  yan x
%x元素周围有无yan    有f=0；没有f=1
    P=xianglin(A(x,:));
flagg=0;
for i=1:length(P)
    if(B(P(i))==yan)
        f=0;
        flagg=1;
        break;
    end
end
if(flagg==0)
    f=1;
end
clear P flagg yan
 %%%%%%%%%%%%%%%%%%%%%%%%%%%   
    if(f==1)
        B(C(k))=j;
        clear f
        break;
    else
        flag=1;
        clear f
    end
    end
    if(flag==1)
        flag=1;
        break;
    end
    end
    if(fla==0)
        break;
    end
end
B
    
    