%�ļ����봦��ģ��
%deal data from specified data file
clear ; 
data_fname=input('������Ŀ���ļ���ַ��\n','s'); % ����Ŀ���ļ���
data_fnameout=input('����������ļ���ַ\n','s');%��������ļ���ַ
jump_distance = 0 ;    % �������������ֽ���
% �򿪷�ʽΪ�����ƴ򿪣���ʵ'r'���У�matlab��Ĭ�϶�������ʽ���ļ���
file_id = fopen(data_fname, 'rb');
%�ж��Ƿ�ɹ������ļ�
if file_id<0
    fprintf('�����޷���Ҫ��ȡ���ļ���')
    break;
end
% ���ļ���ʼ����jump_distance���ֽ�
fseek(file_id, jump_distance, 'bof');
%���ļ������ڴ�������д��������ھ���data�У������������ata����Ĵ�С
data=fread(file_id);
n=length(data);

% �ر��ļ�
fclose(file_id);
% �����ǰ��ù��ı�����ɾ���������workspace�������߰����ʲô���У����Ǹ���ϰ�ߣ��Ǻǡ�
clear data_fname jump_distance file_id  ; 




%�����Ƽ���ģ��
key=input('please input the key matrix row 2 col 3\n');
%�������ݴ�С����chaosgen�������ɻ������У���Ҫ���û�������Կ��Lorez����ϵͳ������
m=[3,100];  %ode45�������100�з�4000��
xulie=chaosgen45(key,m);   %���ɵĻ�������
l=length(xulie(:,1));
%λ���㴦��ģ��  ���������ĵ�Ϊ׼����Ϊ������Ŀ�㹻�� Ҳ������length����
xie=zeros(n,1);
%��i����data�ķ�����j�������е���������������Z�֣�mod��i,l)Ϊ�������޻������м������ⳤ�ļ�
for i=1:n
        j=mod(i,3)+1;
        xie(i)=bitxor(data(i),xulie(mod(i,l)+1,j));
end
%�����ý��д����һ���ļ�
% �򿪷�ʽΪ�����ƴ򿪣���д�ķ�ʽwb��matlab��Ĭ�϶�������ʽ���ļ���
f=fopen(data_fnameout,'wb');
if f<0
    fprintf('�����޷���Ҫд����ļ���')
    break;
end
fwrite(f,xie,'uchar');
fclose(f);%�ر��ļ�
fprintf('�ļ����ܳɹ���')
clear;
