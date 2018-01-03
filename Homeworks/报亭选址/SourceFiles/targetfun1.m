%一号区域目标函数
function F=targetfun1(X)
global len1 data11 b k;
e=0;
for i=1:len1
    e=e+b(1)*k(1)*sqrt((X(1)-data11(i,1))^2+(X(2)-data11(i,2))^2);
end

F=e;