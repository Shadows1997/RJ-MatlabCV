%*******************************************************
%程序：EX503.M
%功能：利用擦除方式显示动画
%*******************************************************
speed=1000;
x=linspace(0,2*pi,speed);                           %设置x范围及性质
y=tan(sin(x))-sin(tan(x));                          %设置x、y的关系
plot(x,y);                                               %绘制曲线
n=length(x)                                              %以x设置变量，形成动态效果
line_handle=line('LineStyle','o','MarkerSize',25,'EraseMode','xor', 'MarkerEdgeColor','b','MarkerFaceColor','r');    %设置线条属性
i=1;
while 1
set(line_handle, 'xdata',x(i),'ydata',y(i));
drawnow
i=i+1;                                                      %设置循环条件
if i>n
i=1;
end
end
