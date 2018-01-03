%数据可视化处理
load xls.mat;
a=linspace(1,168,168)-1;
special_hour=[7 8 9 18 19 20];
aa=special_hour;
tt=aa;
for i=0:24:168-48
    tt=[tt i+aa+24];
end
A=xls1;
A(find(isnan(A)==1))=0; %把NaN换成0
s=input('请输入你想查看的序号（行向量）:\n');
beta=input('车速尺度因子beta(建议50<->100)：\n');%车速尺度因子  
day=input('请输入想单独观看的天:(1<->7)\n');
%地名数据模块
road1='107国道(广深公路）南头检查站南行-北-战略';
road2='深南大道南头检查站出-南-战略';
road3='G4(广深高速)(2260km+969m)南行-北-战略';
road4='广深高速同乐检查站出-东-战略';
road5='沙河西路白芒关检查站出-南-战略';
road6='松白路白芒检查站入-北-战略';
road7='福龙隧道-南向北行驶';
road8='福龙隧道-北向南行驶';
road9='梅观公路南坪立交桥下北行-南-战略';
road10='梅观公路普滨加油站南行-北-战略';
road11='清坪快速清水河联检站出口北行-南-战略';
road12='清坪快速清水河联检站入口南行-北-战略';
road13='保洁路清水河检查站出-南-战略';
road14='西环路清水河检查站入-北-战略';
road15='布吉路-深惠路南向北行驶';
road16='深惠路-布吉路北向南行驶';
road17='丹沙路沙湾检查站入-北-战略';
road18='沙湾路沙湾检查站出-南-战略';
ROAD=char(road1,road2,road3,road4,road5,road6,road7,road8,road9,...
    road10,road11,road12,road13,road14,road15,road16,road17,road18);
m=length(s);
%数据显示模块
for ii=5:5:5*m
  i=ii/5;
  figure(ii-4);
  subplot(3,1,1)
  plot(a,A(2*s(i)-1,:),'r');
  grid on;
  hold on; 
  plot(a,beta*A(2*s(i),:),'mx--');
  set(gca, 'xtick', [24 48 72 96 120 144 168]);
  xx=1:0.01:168-1;
  yy=beta*mean(A(2*s(i),:))*ones(size(xx));
  plot(xx,yy,'b');
  title(ROAD(s(i),:));
  plot(a(tt),A(2*s(i)-1,tt),'p')
  legend('流量/台','车速(1/beta*km/h)','平均车速','高峰期');
  xlabel('小时');
  ylabel('值');
  
  
  %减去平均值然后做傅里叶分析
  subplot(3,1,2)
  averange=mean(A(2*s(i)-1,:));
  y=A(2*s(i)-1,:)-averange;
%数据有线性趋势时候使用此段
%c=polyfit(a,y,1); 
%trend=polyval(c,a);
%y=xls1(1,:)-trend;
  n=length(y);
  Fs=1;       %Sample rate onece per hour so Fs=1(hour)
  Y=fft(y);
  Fw=abs(Y(1:n/2+1));
  f=((0:n/2)*(Fs/n));
  plot([f;f],[0*Fw;Fw],'c-',f,Fw,'b.','linewidth',2,'markersize',16);
  grid on;
  title('车流量FFT');
  xlabel('HZ(次/小时)');
  ylabel('|Fw|');
  subplot(3,1,3);
  k=5:44;
  Fw=Fw(k+1);
  f=f(k+1);
  f=1./f;
  plot([f;f],[0*Fw;Fw],'c-',f,Fw,'b.','linewidth',2,'markersize',16);
  grid on;
  title('车流量FFT');
  xlabel('周期(小时/次)');
  ylabel('|Fw|');
  
  
  %分天显示
  figure(ii-3)
  start=(day-1)*24+1;
  final=(day-1)*24+24;
  aa=linspace(start,final,24);
  subplot(2,1,1)
  plot(aa-start,A(2*s(i)-1,start:final),'r');
  set(gca, 'xtick',0:23);
  grid on;
  legend('流量/台');
  xlabel('小时');
  ylabel('值');
  title(ROAD(s(i),:));
  subplot(2,1,2) 
  plot(aa-start,A(2*s(i),start:final),'mx--');
  hold on;
  xx1=start:0.01:final;
  yy1=mean(A(2*s(i),start:final))*ones(size(xx1));
  plot(xx1-start,yy1,'b');
  set(gca, 'xtick',0:23);
  grid on;
  title(ROAD(s(i),:));
  legend('车速(km/h)','平均车速(km/h)');
  xlabel('小时');
  ylabel('值');
  
  
  
  
  
  
  %每周车流量变化趋势
  COUNTER=zeros(1,7);
  figure(ii-2)
  for v=0:24:144
      counter=0;
      for k=1:24
          counter=counter+A(2*s(i)-1,v+k);
      end
      COUNTER(mod(v,23)+1)=counter;
  end
  bar((COUNTER/mean(COUNTER))-1,'stack')
  grid on;
  legend('(当日总车流量)/(周车流量日平均值)-1')
  xlabel('星期');
  ylabel('比例')
  title(ROAD(s(i),:));
 
  %车速度单独显示
  figure(ii-1)
  subplot(3,1,1)
  plot(a,A(2*s(i),:),'mx--');
  title(ROAD(s(i),:));
  hold on;
  plot(xx-1,yy/beta,'b');
  plot(a(tt),A(2*s(i),tt),'p');
  grid on;
  legend('车速','平均车速','高峰期')
   set(gca, 'xtick', [24 48 72 96 120 144 168]);
  subplot(3,1,2)
  e=A(2*s(i),:)-mean(A(2*s(i),:));
  Y=fft(e);
  Fw=abs(Y(1:n/2+1));
  f=((0:n/2)*(Fs/n));
  plot([f;f],[0*Fw;Fw],'c-',f,Fw,'b.','linewidth',2,'markersize',16);
  grid on;
  title('车速FFT');
  xlabel('HZ(次/小时)');
  ylabel('|Fw|');
  subplot(3,1,3)
  b=fir1(50,0.4,'low');
  y=filtfilt(b,[1],e);
  plot(a,y+mean(A(2*s(i),:)),'r');
  hold on;
  
  plot(xx-1,yy/beta,'b');
   set(gca, 'xtick', [24 48 72 96 120 144 168]);
  title('滤波处理后')
  grid on;
  
  %车速车流量时间相图
  figure(ii)
  subplot(3,1,1);
  pro=processpca([A(2*s(i)-1,:);A(2*s(i),:)]); %提取主成分
  pn1=mapstd(pro(1,:));        %单位化无量纲化
  pn2=mapstd(pro(2,:));        %单位化无量纲化
  %pn1=mapminmax(pn1);%消除极差
  %pn2=mapminmax(pn2);%消除极差
  plot3(pn1,pn2,a,'o');
  title('主成分提取标准化无量纲化处理后的相图（均值为零方差为1）')
  xlabel('车流量');
  ylabel('车速度');
  zlabel('时间(小时)')
  grid on;
  view(2)
  subplot(3,1,2)
  plot(pn1,pn2,'o');
  xlabel('车流量');
  ylabel('车速度');
  grid on;
  lsline;
  
  subplot(3,1,3);
  p=beta.*A(2*s(i)-1,:)./A(2*s(i),:);
  plot(a,A(2*s(i)-1,:),'r',a,beta*A(2*s(i),:),'b',a,p,'m');
  hold on;
  plot(a(tt),p(tt),'kp');
  hold off;
  grid on;
  set(gca, 'xtick', [24 48 72 96 120 144 168]);
  title('车密度显示');
  legend('流量','车速*beta','车密度*beta')
  
  
  
  
end

pause;
close all;
clear;
clc;
