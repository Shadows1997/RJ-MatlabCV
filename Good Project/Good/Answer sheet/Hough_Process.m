function [Len, XYn, xy_long] = Hough_Process(bw, Img, flag)
% hough检测处理
% 输入参数：
% bw——二值图像
% Img——图像信息
% flag——是否显示图像
% 输出参数：
% Len——直线长度集合
% XYn——直线端点集合
% xy_long——最长直线端点集合
if nargin < 3
    flag = 1;
end
%hough变换
[H, T, R] = hough(bw);%H为hough矩阵，T为theta，R为rho
P = houghpeaks(H, 4, 'threshold', ceil(0.3*max(H(:))));
lines = houghlines(bw, T, R, P, 'FillGap', 50, 'MinLength', 7);
max_len = 0;
%遍历直线信息
for k = 1 : length(lines)
    xy = [lines(k).point1; lines(k).point2]; %直线的两点
    len = norm(lines(k).point1-lines(k).point2); %直线的长度
    Len(k) = len;
    if len > max_len
        max_len = len;
        xy_long = xy;
    end
    XY{k} = xy; % 存储信息
end
[Len, ind] = sort(Len(:), 'descend'); % 按长度降序排序，ind为数组索引
% 直线信息排序
for i = 1 : length(ind)
    XYn{i} = XY{ind(i)};%ind(i)为旧索引在新索引的位置
end
xy_long = XYn{1};
x = xy_long(:, 1);
y = xy_long(:, 2);
if abs(diff(x)) < abs(diff(y))
    x = [mean(x); mean(x)];
else
    y = [0.7*y(1)+0.3*y(2); 0.3*y(1)+0.7*y(2)];
end
xy_long = [x y];
if flag
    figure('units', 'normalized', 'position', [0 0 1 1]);
    subplot(2, 2, 1); imshow(bw); title('二值图像', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(H, [], 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
    xlabel('\theta'); ylabel('\rho');
    axis on; axis normal; title('霍夫变换域', 'FontWeight', 'Bold')
    subplot(2, 2, 3); imshow(Img); title('原图像', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(Img); title('区域标识图像', 'FontWeight', 'Bold');
    hold on;
    plot(xy_long(:,1), xy_long(:,2), 'LineWidth', 2, 'Color', 'r');
end