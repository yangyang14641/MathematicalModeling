load xls;
chedao=zeros(1,8);
chedao(1)=7;
chedao(2)=3;
chedao(3)=4;
chedao(4)=5;
chedao(5)=4;
chedao(6)=4;
chedao(7)=4;
chedao(8)=4;
%�����ݾ���ת�� ���һ��4*8�ľ���
data2=data2';
%���ؼ��Ե����ӳ��ܶ����
indata=zeros(size(data2)+[3 0]);
indata(1,:)=data2(1,:);
indata(2,:)=data2(2,:);
indata(3,:)=data2(1,:)./data2(2,:);
indata(4,:)=data2(3,:);
indata(5,:)=data2(4,:);
indata(6,:)=data2(3,:)./data2(4,:);
indata(7,:)=chedao(:);
indata2=[indata(:,1) indata(:,3) indata(:,4) indata(:,5) indata(:,6)];
indata2=processpca(indata2);%���ݽ�ά
indata2=mapminmax(indata2);%���ݹ�һ��
%���������繤����
nctool   %���齨��2*2������
pause
p_train=indata2(:,1:5);
t_train=[1 3 4 5 6];
t_sim=sim(net,p_train);
T_sin=vec2ind(t_sim);
result=[t_train' T_sin'] 