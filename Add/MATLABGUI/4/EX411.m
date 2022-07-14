%***************************************************
%程序：EX411.M
%功能：shading模式演示
%***************************************************
 [x,y]=meshgrid(-4:0.5:4);                %设置矩形网络
z=x.^2+2*sin(x*pi)+2*cos(y*pi);        %定义z与x、y之间的函数关系
subplot(2,2,1)                              %子图设置
surf(x,y,z)                                  %绘制三维曲面
title('no shading')                       %为当前图形添加标题
subplot(2,2,2)                             %子图设置
surf(x,y,z)                                 %绘制三维曲面
shading flat                                %设置阴影效果
title('shading flat')                    %为当前图形添加标题
subplot(2,2,3)                             %子图设置
surf(x,y,z)                                 %绘制三维曲面
shading faceted                            %设置阴影效果
title('shading faceted')                 %为当前图形添加标题
subplot(2,2,4)                             %子图设置
surf(x,y,z)                                 %绘制三维曲面
shading interp                             %设置阴影效果
title('shading interp')                  %为当前图形添加标题
