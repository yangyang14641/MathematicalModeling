%4号区域目标函数
function F=targetfun4(X,Y)
global len4 data41 b k;
e=0;
for i=1:len4
    e=e+b(4)*k(4)*sqrt((X(1)-data41(i,1))^2+(X(2)-data41(i,2))^2);
end

F=e;
