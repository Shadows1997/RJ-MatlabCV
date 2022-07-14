%********************************************************
%程序：EX235.M
%功能：手工绘图方式做图
%********************************************************
axis([0 10 0 10])   %调整坐标轴范围参数
hold on                %保持图形
x=[ ];                 %设置变量x
y=[ ];                  %设置变量y
n=0;                    %初始化n
while(1)
   [xtemp,ytemp,button]=ginput(1);
   plot(xtemp,ytemp, '.')             %绘制图形
   x=[x,xtemp];   
   y=[y,ytemp];
   n=n+1;                                 %n递增循环
   text(xtemp+0.1,ytemp,int2str(n));    %添加数字标注
   if(button==3)
      break                             %跳出循环
  end
end
line(x,y)                             %绘制线型图形
hold off                               %关闭保持
