%�ҶȰ��������Ⱥ���
%����Ҷ�ֵ
%���������
function v=Mdark(z)
a=50;%b���½�Ϊ����aΪ�ҵ����ı߽�
b=50;
if z<=a+b && z>=b
    v=1-(z-b)/a;
elseif z<b
    v=1;
else
    v=0;
end
end