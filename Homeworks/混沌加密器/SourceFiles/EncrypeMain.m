%文件输入处理模块
%deal data from specified data file
clear ; 
data_fname=input('请输入目标文件地址：\n','s'); % 这里目标文件名
data_fnameout=input('请输入输出文件地址\n','s');%这是输出文件地址
jump_distance = 0 ;    % 这里是跳过的字节数
% 打开方式为二进制打开，其实'r'就行，matlab是默认二进制形式打开文件的
file_id = fopen(data_fname, 'rb');
%判断是否成功打开了文件
if file_id<0
    fprintf('错误：无法打开要读取的文件！')
    break;
end
% 从文件开始跳过jump_distance个字节
fseek(file_id, jump_distance, 'bof');
%将文件读入内存区域进行处理，即存在矩阵data中，并计算二进制ata矩阵的大小
data=fread(file_id);
n=length(data);

% 关闭文件
fclose(file_id);
% 这里是把用过的变量都删除掉，免得workspace里面乱七八糟的什么都有，这是个好习惯，呵呵。
clear data_fname jump_distance file_id  ; 




%二进制加密模块
key=input('please input the key matrix row 2 col 3\n');
%根据数据大小调用chaosgen函数生成混沌序列，并要求用户给定密钥（Lorez动力系统参数）
m=[3,100];  %ode45大概能在100中分4000份
xulie=chaosgen45(key,m);   %生成的混沌序列
l=length(xulie(:,1));
%位运算处理模块  计数器以文档为准，因为序列数目足够多 也可以用length计算
xie=zeros(n,1);
%在i控制data的分量，j控制序列的三个列中来回走Z字，mod（i,l)为了用有限混沌序列加密任意长文件
for i=1:n
        j=mod(i,3)+1;
        xie(i)=bitxor(data(i),xulie(mod(i,l)+1,j));
end
%将所得结果写入另一个文件
% 打开方式为二进制打开，以写的方式wb，matlab是默认二进制形式打开文件的
f=fopen(data_fnameout,'wb');
if f<0
    fprintf('错误：无法打开要写入的文件！')
    break;
end
fwrite(f,xie,'uchar');
fclose(f);%关闭文件
fprintf('文件加密成功！')
clear;
