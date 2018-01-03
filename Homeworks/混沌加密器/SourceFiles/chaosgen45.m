function v=chaosgen45(key,n)
%默认起始位置 A(2,1)=13 A(2,2)=10 A(2,3)=3
%默认区间n=[0 100]
% 混沌系统默认参数A(1,1)=10  A(1,2)=28 A(1,3)=-8/3
global A;
A=key;
%利用MATLAB自带的ode45龙格库塔法解Lorenz微分方程
[t,x]=ode45('Lorenz',n,[A(2,1),A(2,2),A(2,3)],[],A);
figure(1);
subplot(1,2,1),plot(t,x(:,1),t,x(:,2),t,x(:,3));,title('x,y,z对t作图'),grid on;
subplot(1,2,2),plot3(x(:,1),x(:,2),x(:,3)),title('x,y,z空间曲线')
grid on;

%混沌序列产生模块
v=abs(x);
v=v-fix(v);
figure(2);
subplot(2,2,1),plot(t,v(:,1)),title('x序列'),grid on;
subplot(2,2,2),plot(t,v(:,2)),title('y序列'),grid on;
subplot(2,2,3),plot(t,v(:,3)),title('z序列'),grid on;
subplot(2,2,4),plot3(v(:,1),v(:,2),v(:,3)),title('序列相图');
grid on;


%将得到的序列转为8bit的字节，以与文件进行异或
v=floor(v*255);



