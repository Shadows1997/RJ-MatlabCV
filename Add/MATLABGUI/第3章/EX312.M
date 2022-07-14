%*********************************************************
%程序：EX312.M
%功能：坐标轴设置函数axis使用实例
%*********************************************************
close all            %关闭所有窗口
subplot(1,3,1)     %子图设置
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis auto;title('auto')   %设置坐标系并标注
subplot(1,3,2)        %子图设置
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis equal;title('equal')    %调整坐标轴为正方形并标注
subplot(1,3,3)                  %子图设置
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis square;title('square')    %调整坐标轴为正方形并标注
