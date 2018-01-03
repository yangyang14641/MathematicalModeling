function v=chaosgen45(key,n)
%Ĭ����ʼλ�� A(2,1)=13 A(2,2)=10 A(2,3)=3
%Ĭ������n=[0 100]
% ����ϵͳĬ�ϲ���A(1,1)=10  A(1,2)=28 A(1,3)=-8/3
global A;
A=key;
%����MATLAB�Դ���ode45�����������Lorenz΢�ַ���
[t,x]=ode45('Lorenz',n,[A(2,1),A(2,2),A(2,3)],[],A);
figure(1);
subplot(1,2,1),plot(t,x(:,1),t,x(:,2),t,x(:,3));,title('x,y,z��t��ͼ'),grid on;
subplot(1,2,2),plot3(x(:,1),x(:,2),x(:,3)),title('x,y,z�ռ�����')
grid on;

%�������в���ģ��
v=abs(x);
v=v-fix(v);
figure(2);
subplot(2,2,1),plot(t,v(:,1)),title('x����'),grid on;
subplot(2,2,2),plot(t,v(:,2)),title('y����'),grid on;
subplot(2,2,3),plot(t,v(:,3)),title('z����'),grid on;
subplot(2,2,4),plot3(v(:,1),v(:,2),v(:,3)),title('������ͼ');
grid on;


%���õ�������תΪ8bit���ֽڣ������ļ��������
v=floor(v*255);



