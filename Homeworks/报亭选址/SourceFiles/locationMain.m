%报亭选址问题主函数main
n=4;  %定义区域个数
Result=zeros(n,2);  %最终输出结果
%数据模块
%第一组数据：
a=10;                      %报亭单位面积的服务能力
c=486.1;                   %报亭单位面积的造价
B=[10000,5000,5000,5000];   %各功能区（各园）人数（一食堂，二食堂，三食堂，一教）
K=[0.02 0.02 0.02 0.013];  %各功能区需求量与需求点人数的比例系数
S=K.*B/a;                  %各区域报亭的面积
%第二组数据：
infile1=input('请输入待优化前地图1文件名：\n','s');
%infile2=input('请输入待优化前地图2文件名：\n','s');
%infile3=input('请输入待优化前地图3文件名：\n','s');
%infile4=input('请输入待优化前地图4文件名：\n','s');

global len1 len2 len3 len4 data11 data21 data31 data41 b k;

[len1,data10,data11]=mapread(infile1,1);              %1到4区域的楼房坐标数据
%[len2,data20,data21]=mapread(infile2,2);              %datai0代表i区域图的角点
%[len3,data30,data31]=mapread(infile3,3);              %datai1代表i区域的楼房数据点
%[len4,data40,data41]=mapread(infile4,4);     
b=B(1)/len1;  %全部运行去掉该语句
%Q=[len1,len2,;len3,len4];             %各区的需求点总数（楼数）
%b=B./Q                               %各功能区每个需求点平均人数

%第三组数据：
k=[0.9,0.9,0.9,0.4];                 %各功能区人员对报亭的利用率

%各区域最优化

Result(1,:)=fminunc('targetfun1',[0 0]);
%Result(2,:)=fminunc('targetfun2',[0 0]);
%Result(3,:)=fminunc('targetfun3',[0 0]);
%Result(4,:)=fminunc('targetfun4',[0 0]);

%优化结果图示模块
mapput(Result(1,:),data10,infile1,1);
%mapput(Result(2,:),data20,infile2,2);
%mapput(Result(3,:),data30,infile3,3);
%mapput(Result(4,:),data40,infile4,4);
S
