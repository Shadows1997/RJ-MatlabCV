%********************************************************* 
%程序：EX414.M
%功能：hidden透明使用实例演示
%*********************************************************
[x,y,z]=sphere(20);                %创建球体
x=8.2*x;                      
y=8.2*y;
z=8.2*z;                             %设置球体的x、y与z
peaks;
shading interp;                     %使用interp渲染方式
colormap(hot)                       %使用hot颜色映射值
hold on,mesh(x,y,z),hold off   %以mesh来绘制球体数据 
hidden off                           %将球体设置为透明
axis equal                           %产生等长的坐标轴以便于球体的显示
axis off                             %将坐标轴隐藏
