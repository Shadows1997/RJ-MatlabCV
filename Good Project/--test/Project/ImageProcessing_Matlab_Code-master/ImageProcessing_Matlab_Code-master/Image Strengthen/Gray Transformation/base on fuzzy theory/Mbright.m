%�Ҷ����������Ⱥ���
%����Ҷ�ֵ
%���������
function v=Mbright(z)
a=200;%a���Ͻ�Ϊ����bΪ�����ҵı߽�
b=50;
if z<=a && z>=a-b
    v=1-(a-z)/b;
elseif z>a
    v=1;
else
    v=0;
end
end