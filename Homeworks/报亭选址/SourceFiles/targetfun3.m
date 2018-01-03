%三号区域目标函数
function F=targetfun3(X,Y)
global len3 data31 b k;
e=0;
for i=1:len3
    e=e+b(3)*k(3)*sqrt((X(1)-data31(i,1))^2+(X(2)-data31(i,2))^2);
end

F=e;