%*******************************************************
%����EX503.M
%���ܣ����ò�����ʽ��ʾ����
%*******************************************************
speed=1000;
x=linspace(0,2*pi,speed);                           %����x��Χ������
y=tan(sin(x))-sin(tan(x));                          %����x��y�Ĺ�ϵ
plot(x,y);                                               %��������
n=length(x)                                              %��x���ñ������γɶ�̬Ч��
line_handle=line('LineStyle','o','MarkerSize',25,'EraseMode','xor', 'MarkerEdgeColor','b','MarkerFaceColor','r');    %������������
i=1;
while 1
set(line_handle, 'xdata',x(i),'ydata',y(i));
drawnow
i=i+1;                                                      %����ѭ������
if i>n
i=1;
end
end
