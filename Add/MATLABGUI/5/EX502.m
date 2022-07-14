%*****************************************
%程序：EX502.M
%功能：利用擦除模式动画显示布朗运动效果
%*****************************************
n=20
s=0.02
x=rand(n,1)-0.5;
y=rand(n,1)-0.5;                %设置x、y的取值
h=plot(x,y, '. ');             %绘制x、y图形
       axis([-1 1 -1 1])        %调整坐标轴范围参数
       axis square                 %坐标轴范围为正方形
       grid off                     %取消网格
    set(h, 'EraseMode', 'xor','MarkerSize',18)   %设置动画显示属性
while 1
drawnow                               %显示
x=x+s*randn(n,1);                  
y=y+s*randn(n,1);                 %设置x、y的变化轨迹
set(h, 'XData',x,'YData',y)    %设置动画属性
end
