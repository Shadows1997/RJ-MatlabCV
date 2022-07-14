%*******************************************************
%程序：EX416.M
%功能：透明度函数alphamap演示实例
%*******************************************************
[x,y,z]=meshgrid(-1.25:0.1:-0.25,-2:0.2:2,-2:0.1:2);   %设置矩形网格
v=x.*exp(-x.^2-y.^2-z.^2);                        %生成音量数据
h=slice(x,y,z,v,[-1 -0.75 -0.5],[],[0]);      %创建切片图，指定使用插值映射方式
set(h,'EdgeColor','none', 'FaceColor','interp','FaceAlpha','interp')
alpha('color')                    %将 值设置为与颜色值相等的数值，并给映射表每个元素增加0.1
alphamap('rampdown')
alphamap('increase',0.1)       %透明度设置
colormap(hsv)                      %设置颜色表
xlabel('X')                  %设置x坐标轴的标注
ylabel('Y')                  %设置y坐标轴的标注
zlabel('Z')                  %设置z坐标轴的标注
