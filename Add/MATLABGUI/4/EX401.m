%************************************************************
%程序：EX401.M
%功能：作出具有较为完整流程的二维图形
%***********************************************************
x=-8:0.1:8;                          %数据准备
y=-8:0.1:8;
[X,Y]=meshgrid(x,y);              %通过meshgrid创建网格数据
Z=(exp(X)-exp(Y)).*sin(X-Y);    %定义z和y、x之间的函数关系
figure                                %创建三维曲线图或网线图、表面图
surf(X,Y,Z)                           %创建表面图
view([75 25])                       %设置观察者查看图形的视角和Camera属性
colormap hsv                        %颜色表
shading interp
light('Position',[1 0.5 0.5])     %设置光源位置和类型
lighting gouraud                   %设置光源
material metal
axis square                        %将坐标轴调整为正方形
set(gca,'ZTickLabel','')       %设置图形属性
Xlabel('x')                        %为x坐标轴添加标注
Ylabel('y')                       %设置坐标轴标签、标题等标注元素
colorbar                           %添加颜色条
print                               %图形的打印功能
