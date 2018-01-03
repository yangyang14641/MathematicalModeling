%二号区域目标函数
function F=targetfun2(X,Y)
global len2 data21 b k;
e=0;
for i=1:len2
    e=e+b(2)*k(2)*sqrt((X(1)-data21(i,1))^2+(X(2)-data21(i,2))^2);
end

F=e;