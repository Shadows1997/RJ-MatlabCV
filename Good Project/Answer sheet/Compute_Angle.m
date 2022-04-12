function angle = Compute_Angle(xy_long)
%计算直线角度
% 输入参数：
% xy_long——最长直线端点集合
% 输出参数：
% angle——角度集合

%最长直线的起点和终点坐标
x1 = xy_long(:, 1);
y1 = xy_long(:, 2);
%求线段斜率
K1 = -(y1(2)-y1(1))/(x1(2)-x1(1));
angle = atan(K1)*180/pi;