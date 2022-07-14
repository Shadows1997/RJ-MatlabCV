%*****************************************************
%程序：EX413.M
%功能：光照方法演示实例
%*****************************************************
[x,y]=meshgrid(-1:0.2:1);     %设置矩形网格
z=sin(x*pi)+cos(y*pi);         %定义z与x、y之间的函数关系
subplot(2,2,1)                   %子图设置
surf(x,y,z)                       %绘制网格曲面
light('Color','r','Style','infinite','Position',[1 -1 2])   %设置光照效果
lighting none                     %关闭光照效果
title('lighting none')         %为当前图形添加标题
subplot(2,2,2)                    %子图设置
surf(x,y,z)                        %绘制网格曲面
light('Color','r','Style','infinite','Position',[1 -1 2])   %设置光照效果
lighting flat    　　　　　　　　%光源对图形中每一个对象产生同样的效果
title('lighting flat')　　    　　  %为当前图形添加标题
subplot(2,2,3)　　　　　　　　　%子图设置
surf(x,y,z)　　　　　　　　　　%绘制网格曲面
light('Color','r','Style','infinite','Position',[1 -1 2])　　%设置光照效果
lighting gouraud　　　　　%影响下每一个顶点的颜色，然后插值确定区域内颜色
title('lighting gouraud')  %为当前图形添加标题
subplot(2,2,4)                %子图设置
surf(x,y,z)                   %绘制网格曲面
light('Color','r','Style','infinite','Position',[1 -1 2])  %设置光照效果
lighting phong             %计算每一个图形像素点的反射系数, 然后插值确定区域内颜色
title('lighting phong')
