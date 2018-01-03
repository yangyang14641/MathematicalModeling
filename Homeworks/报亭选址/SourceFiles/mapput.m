%后处理模块data为优化出来的坐标数据向量 i也是图的标号
%图形输出函数
function F=mapput(data1,data2,infile,i)

hx=imread(infile);
bj=imread('bj.jpg');
%所取点为【x1，y1】
x0=data2(:,1);%处理图像角点坐标
y0=data2(:,2);
y=floor(data1(1)*(max(x0)-min(x0)))+min(x0);    %将数据坐标点转化为图象像素点
x=floor((1-data1(2))*(max(y0)-min(y0)))+min(y0);    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%在原图上画出报亭位置标记，报亭位置必须为（x，y）的单个点，横坐标为x，纵坐标为y
hx(x-20:x+20,y-20:y+20,:)=bj(:,:,:);
%显示新图
figure (i+5)  %另开作图窗口
imshow(hx)
axis ij;axis on;
