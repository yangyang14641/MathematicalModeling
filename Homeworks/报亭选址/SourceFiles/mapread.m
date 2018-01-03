%读入目标地图函数 i表示第几幅图 以便用于确定散点图的标号
function [n,XY0,XY1]=mapread(infile,i)
hx=imread(infile);
axis ij;axis on;
imshow(hx);
[x0,y0]=ginput;%取图片的四个顶点
[x1,y1]=ginput;%取要选取的点
x1=(x1-min(x0))/(max(x0)-min(x0));
y1=(y1-max(y0))/(min(y0)-max(y0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%画所取的点的散点图
figure (i+1)
plot(x1,y1,'o')
axis([0,1,0,1]);
grid on

%将数据输出
XY0=[x0,y0];%图片角点数据最后输出结果图像使用
XY1=[x1,y1];%B楼房数据点矩阵
n=length(x1);  %数据点矩阵的长度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
