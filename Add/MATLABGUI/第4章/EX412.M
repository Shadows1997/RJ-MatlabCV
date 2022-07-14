%*****************************************************
%程序：EX412.M
%功能：光源对象程序实例
%*****************************************************
 [x,y]=meshgrid(-1:0.1:1);      %设置矩形网格       
z=sin(x*pi)+cos(y*pi);          %定义z与x、y之间的函数关系
subplot(2,2,1)          %子图设置
surf(x,y,z)             %绘制网格曲面
title('no light')     %为当前图形添加标题
subplot(2,2,2)         %子图设置
surf(x,y,z)             %绘制网格曲面
light('Color','r','Style','infinite','Position',[0 1 2])  %设置光照效果
title('red infinite light')    %为当前图形添加标题
subplot(2,2,3)            %子图设置
surf(x,y,z)                %绘制网格曲面
light('Color','g','Style','infinite','Position',[0 1 2])  %设置光照效果
title('green infinite light')  %为当前图形添加标题
subplot(2,2,4)                 %子图设置
surf(x,y,z)                     %绘制网格曲面
light('Color','r','Style','local','Position',[0 1 2])    %设置光照效果
title('red local light')   %为当前图形添加标题
