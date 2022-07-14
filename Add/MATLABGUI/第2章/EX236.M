%********************************************************
%程序：EX236.M
%功能：手工绘图方式做图，并更改数据点
%********************************************************
clf                                %清空命令行
axis([0 10 0 10])              %设置坐标轴范围参数
hold on                           %保持图形
x=[ ];                            %设置图形变量
y=[ ];                             %设置循环变量
n=0;                               %初始化变量n
while(1)
[xtemp,ytemp,button]=ginput(1);  %从鼠标得到数据点
plot(xtemp,ytemp,'.')          %绘制图形
x=[x,xtemp];
y=[y,ytemp];                      %设置y函数关系
n=n+1;                              %n递增循环
text(xtemp+0.1,ytemp,int2str(n));    %添加数字标注
if(button==3)                     
   break                             %跳出循环
end
end
t=1:n;                             %设置t的范围
tt=1:0.1:n;                       %设置tt范围及刻度
xx=spline(t,x,tt);               %绘制spline函数图形
yy=spline(t,y,tt);                %绘制spline函数图形
plot(xx,yy,'b:');                  %绘制图形
[xtemp,ytemp,button]=ginput(1);
for i=1:n                                           %循环条件
   if ((abs(x(i)-xtemp)<0.1)&(abs(y(i)-ytemp)<0.1))
   k=i;
   line([x(k)-0.1,x(k)+0.1],[y(k)-0.3,y(k)+0.3])
   line([x(k)+0.1,x(k)-0.1],[y(k)-0.3,y(k)+0.3])        %根据数据点绘制样条曲线
   break
end
end                               
[xtemp,ytemp,button]=ginput(1);    %根据数据点绘制样条曲线
plot(xtemp,ytemp,'r:')     %绘制图形
k=i;
x(k)=xtemp;
y(k)=ytemp;
text(xtemp+0.1,ytemp,int2str(k));     %添加数字标注
xx=spline(t,x,tt);
yy=spline(t,y,tt);
plot(xx,yy,'r-')             %绘制新的样条曲线
hold off                        %关闭保持
