%��ͤѡַ����������main
n=4;  %�����������
Result=zeros(n,2);  %����������
%����ģ��
%��һ�����ݣ�
a=10;                      %��ͤ��λ����ķ�������
c=486.1;                   %��ͤ��λ��������
B=[10000,5000,5000,5000];   %������������԰��������һʳ�ã���ʳ�ã���ʳ�ã�һ�̣�
K=[0.02 0.02 0.02 0.013];  %��������������������������ı���ϵ��
S=K.*B/a;                  %������ͤ�����
%�ڶ������ݣ�
infile1=input('��������Ż�ǰ��ͼ1�ļ�����\n','s');
%infile2=input('��������Ż�ǰ��ͼ2�ļ�����\n','s');
%infile3=input('��������Ż�ǰ��ͼ3�ļ�����\n','s');
%infile4=input('��������Ż�ǰ��ͼ4�ļ�����\n','s');

global len1 len2 len3 len4 data11 data21 data31 data41 b k;

[len1,data10,data11]=mapread(infile1,1);              %1��4�����¥����������
%[len2,data20,data21]=mapread(infile2,2);              %datai0����i����ͼ�Ľǵ�
%[len3,data30,data31]=mapread(infile3,3);              %datai1����i�����¥�����ݵ�
%[len4,data40,data41]=mapread(infile4,4);     
b=B(1)/len1;  %ȫ������ȥ�������
%Q=[len1,len2,;len3,len4];             %�����������������¥����
%b=B./Q                               %��������ÿ�������ƽ������

%���������ݣ�
k=[0.9,0.9,0.9,0.4];                 %����������Ա�Ա�ͤ��������

%���������Ż�

Result(1,:)=fminunc('targetfun1',[0 0]);
%Result(2,:)=fminunc('targetfun2',[0 0]);
%Result(3,:)=fminunc('targetfun3',[0 0]);
%Result(4,:)=fminunc('targetfun4',[0 0]);

%�Ż����ͼʾģ��
mapput(Result(1,:),data10,infile1,1);
%mapput(Result(2,:),data20,infile2,2);
%mapput(Result(3,:),data30,infile3,3);
%mapput(Result(4,:),data40,infile4,4);
S
