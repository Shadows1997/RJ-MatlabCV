%********************************************************* 
%程序：EX415.M
%功能：透明度值设置使用演示
%*********************************************************
[x y z v]=flow;                       %创建运动特性数据，用来显示流体
p=patch(isosurface(x,y,z,v,-3));  %创建斑点式数据图形
isonormals(x,y,z,v,p);               %创建运动特性数据
set(p, 'facecolor', 'red', 'edgecolor', 'none');    %设置图形属性
daspect([1 1 1]);                     %创建表面式图形
view(3);                                %设置视角
axis tight;                            %设置坐标轴
grid on;                                %设置网格
camlight;                               %设置光照效果
lighting gouraud;                    %设置光照效果
alpha(.9)                 
