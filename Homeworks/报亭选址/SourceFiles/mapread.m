%����Ŀ���ͼ���� i��ʾ�ڼ���ͼ �Ա�����ȷ��ɢ��ͼ�ı��
function [n,XY0,XY1]=mapread(infile,i)
hx=imread(infile);
axis ij;axis on;
imshow(hx);
[x0,y0]=ginput;%ȡͼƬ���ĸ�����
[x1,y1]=ginput;%ȡҪѡȡ�ĵ�
x1=(x1-min(x0))/(max(x0)-min(x0));
y1=(y1-max(y0))/(min(y0)-max(y0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����ȡ�ĵ��ɢ��ͼ
figure (i+1)
plot(x1,y1,'o')
axis([0,1,0,1]);
grid on

%���������
XY0=[x0,y0];%ͼƬ�ǵ��������������ͼ��ʹ��
XY1=[x1,y1];%B¥�����ݵ����
n=length(x1);  %���ݵ����ĳ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
