%��������������⺯��
global a
global const
global m 
global tw
%��ʼ������
q0=5790;  %�ؿڽ���������
v0=12;    %�ؿڽ����ĳ��� 
p0=q0/v0; %�ؿڽ���㳵���ܶ�
m=input('please enter the varible m:\n');     %ģ�Ͳ��� ��·ӵ��ȡ2.5 ��·��ͨȥ2.8
tw=0.05;       %��Ӧ��
x0=[-2 2];    %�ռ�����


%��ⳣ΢�ַ���(�ĵ���� Runge-Kutta method)
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

