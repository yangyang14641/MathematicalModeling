%����ģ��dataΪ�Ż������������������� iҲ��ͼ�ı��
%ͼ���������
function F=mapput(data1,data2,infile,i)

hx=imread(infile);
bj=imread('bj.jpg');
%��ȡ��Ϊ��x1��y1��
x0=data2(:,1);%����ͼ��ǵ�����
y0=data2(:,2);
y=floor(data1(1)*(max(x0)-min(x0)))+min(x0);    %�����������ת��Ϊͼ�����ص�
x=floor((1-data1(2))*(max(y0)-min(y0)))+min(y0);    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%��ԭͼ�ϻ�����ͤλ�ñ�ǣ���ͤλ�ñ���Ϊ��x��y���ĵ����㣬������Ϊx��������Ϊy
hx(x-20:x+20,y-20:y+20,:)=bj(:,:,:);
%��ʾ��ͼ
figure (i+5)  %����ͼ����
imshow(hx)
axis ij;axis on;
