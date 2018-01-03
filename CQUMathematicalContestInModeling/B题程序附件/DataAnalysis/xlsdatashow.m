%���ݿ��ӻ�����
load xls.mat;
a=linspace(1,168,168)-1;
special_hour=[7 8 9 18 19 20];
aa=special_hour;
tt=aa;
for i=0:24:168-48
    tt=[tt i+aa+24];
end
A=xls1;
A(find(isnan(A)==1))=0; %��NaN����0
s=input('����������鿴����ţ���������:\n');
beta=input('���ٳ߶�����beta(����50<->100)��\n');%���ٳ߶�����  
day=input('�������뵥���ۿ�����:(1<->7)\n');
%��������ģ��
road1='107����(���·����ͷ���վ����-��-ս��';
road2='���ϴ����ͷ���վ��-��-ս��';
road3='G4(�������)(2260km+969m)����-��-ս��';
road4='�������ͬ�ּ��վ��-��-ս��';
road5='ɳ����·��â�ؼ��վ��-��-ս��';
road6='�ɰ�·��â���վ��-��-ս��';
road7='�������-������ʻ';
road8='�������-��������ʻ';
road9='÷�۹�·��ƺ�������±���-��-ս��';
road10='÷�۹�·�ձ�����վ����-��-ս��';
road11='��ƺ������ˮ������վ���ڱ���-��-ս��';
road12='��ƺ������ˮ������վ�������-��-ս��';
road13='����·��ˮ�Ӽ��վ��-��-ս��';
road14='����·��ˮ�Ӽ��վ��-��-ս��';
road15='����·-���·������ʻ';
road16='���·-����·��������ʻ';
road17='��ɳ·ɳ����վ��-��-ս��';
road18='ɳ��·ɳ����վ��-��-ս��';
ROAD=char(road1,road2,road3,road4,road5,road6,road7,road8,road9,...
    road10,road11,road12,road13,road14,road15,road16,road17,road18);
m=length(s);
%������ʾģ��
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
  legend('����/̨','����(1/beta*km/h)','ƽ������','�߷���');
  xlabel('Сʱ');
  ylabel('ֵ');
  
  
  %��ȥƽ��ֵȻ��������Ҷ����
  subplot(3,1,2)
  averange=mean(A(2*s(i)-1,:));
  y=A(2*s(i)-1,:)-averange;
%��������������ʱ��ʹ�ô˶�
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
  title('������FFT');
  xlabel('HZ(��/Сʱ)');
  ylabel('|Fw|');
  subplot(3,1,3);
  k=5:44;
  Fw=Fw(k+1);
  f=f(k+1);
  f=1./f;
  plot([f;f],[0*Fw;Fw],'c-',f,Fw,'b.','linewidth',2,'markersize',16);
  grid on;
  title('������FFT');
  xlabel('����(Сʱ/��)');
  ylabel('|Fw|');
  
  
  %������ʾ
  figure(ii-3)
  start=(day-1)*24+1;
  final=(day-1)*24+24;
  aa=linspace(start,final,24);
  subplot(2,1,1)
  plot(aa-start,A(2*s(i)-1,start:final),'r');
  set(gca, 'xtick',0:23);
  grid on;
  legend('����/̨');
  xlabel('Сʱ');
  ylabel('ֵ');
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
  legend('����(km/h)','ƽ������(km/h)');
  xlabel('Сʱ');
  ylabel('ֵ');
  
  
  
  
  
  
  %ÿ�ܳ������仯����
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
  legend('(�����ܳ�����)/(�ܳ�������ƽ��ֵ)-1')
  xlabel('����');
  ylabel('����')
  title(ROAD(s(i),:));
 
  %���ٶȵ�����ʾ
  figure(ii-1)
  subplot(3,1,1)
  plot(a,A(2*s(i),:),'mx--');
  title(ROAD(s(i),:));
  hold on;
  plot(xx-1,yy/beta,'b');
  plot(a(tt),A(2*s(i),tt),'p');
  grid on;
  legend('����','ƽ������','�߷���')
   set(gca, 'xtick', [24 48 72 96 120 144 168]);
  subplot(3,1,2)
  e=A(2*s(i),:)-mean(A(2*s(i),:));
  Y=fft(e);
  Fw=abs(Y(1:n/2+1));
  f=((0:n/2)*(Fs/n));
  plot([f;f],[0*Fw;Fw],'c-',f,Fw,'b.','linewidth',2,'markersize',16);
  grid on;
  title('����FFT');
  xlabel('HZ(��/Сʱ)');
  ylabel('|Fw|');
  subplot(3,1,3)
  b=fir1(50,0.4,'low');
  y=filtfilt(b,[1],e);
  plot(a,y+mean(A(2*s(i),:)),'r');
  hold on;
  
  plot(xx-1,yy/beta,'b');
   set(gca, 'xtick', [24 48 72 96 120 144 168]);
  title('�˲������')
  grid on;
  
  %���ٳ�����ʱ����ͼ
  figure(ii)
  subplot(3,1,1);
  pro=processpca([A(2*s(i)-1,:);A(2*s(i),:)]); %��ȡ���ɷ�
  pn1=mapstd(pro(1,:));        %��λ�������ٻ�
  pn2=mapstd(pro(2,:));        %��λ�������ٻ�
  %pn1=mapminmax(pn1);%��������
  %pn2=mapminmax(pn2);%��������
  plot3(pn1,pn2,a,'o');
  title('���ɷ���ȡ��׼�������ٻ���������ͼ����ֵΪ�㷽��Ϊ1��')
  xlabel('������');
  ylabel('���ٶ�');
  zlabel('ʱ��(Сʱ)')
  grid on;
  view(2)
  subplot(3,1,2)
  plot(pn1,pn2,'o');
  xlabel('������');
  ylabel('���ٶ�');
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
  title('���ܶ���ʾ');
  legend('����','����*beta','���ܶ�*beta')
  
  
  
  
end

pause;
close all;
clear;
clc;
