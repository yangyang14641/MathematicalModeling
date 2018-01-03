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
%将数据矩阵转置 变成一个4*8的矩阵
data2=data2';
%将关键性的因子车密度算出
indata=zeros(size(data2)+[3 0]);
indata(1,:)=data2(1,:);
indata(2,:)=data2(2,:);
indata(3,:)=data2(1,:)./data2(2,:);
indata(4,:)=data2(3,:);
indata(5,:)=data2(4,:);
indata(6,:)=data2(3,:)./data2(4,:);
indata(7,:)=chedao(:);
indata2=[indata(:,1) indata(:,3) indata(:,4) indata(:,5) indata(:,6)];
indata2=processpca(indata2);%数据降维
indata2=mapminmax(indata2);%数据归一化
%调用神经网络工具箱
nctool   %建议建立2*2的网络
pause
p_train=indata2(:,1:5);
t_train=[1 3 4 5 6];
t_sim=sim(net,p_train);
T_sin=vec2ind(t_sim);
result=[t_train' T_sin'] 