%流动定常问题求解函数
global a
global const
global m 
global tw
%初始化数据
q0=5790;  %关口进入点的流量
v0=12;    %关口进入点的车速 
p0=q0/v0; %关口进入点车流密度
m=input('please enter the varible m:\n');     %模型参数 道路拥挤取2.5 道路畅通去2.8
tw=0.05;       %切应力
x0=[-2 2];    %空间区间


%求解常微分方程(四到五阶 Runge-Kutta method)
for i=1:5
    a=0.25*4*i;
    const=p0*(-0.9375000000e-2 * tanh(a * x0(1)) + 0.3187500000e-1)*v0;
    [x,y]=ode45('xlsodefun',x0,p0,[],[a const m tw]);
    y1=-0.9375000000e-2 * tanh(a * x) + 0.3187500000e-1;
    subplot(3,1,1)
    plot(x,y1);
    grid on;
    hold on;
    subplot(3,1,2)
    plot(x,y);
    grid on;
    hold on;
    subplot(3,1,3)
    plot(x,const./y./y1);
    grid on;
    hold on;
end
hold off;
clear
clc

