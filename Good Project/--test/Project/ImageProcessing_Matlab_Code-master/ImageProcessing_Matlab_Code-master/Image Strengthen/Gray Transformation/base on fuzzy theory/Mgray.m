%�ҶȻҵ������Ⱥ���
%����Ҷ�ֵ
%���������
function v=Mgray(z)
a=127;%aΪ�ҵ㣬[a-b,a+b]Ϊ�ҵ�������Χ
b=50;
if z==a
    v=1;
elseif z>a && z<=a+b
    v=(a+b-z)/b;
elseif z>=a-b && z<a
    v=(z-a+b)/b;
else
    v=0;
end
end