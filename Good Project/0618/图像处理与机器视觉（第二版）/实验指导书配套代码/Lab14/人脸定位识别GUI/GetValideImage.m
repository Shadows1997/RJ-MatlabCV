function [Irect, rect] = GetValideImage(Img, flag)
% 获取有效图像区域
if nargin < 2
    flag = 1;
end

% 灰度化
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
% 去除视频黑边，定位有效图像区域
tol = 1000;
sz = size(I);
cs = sum(I, 1);
c = find(cs > tol);
cmin = min(c);
cmax = max(c);
rect = [cmin 1 cmax-cmin sz(1)];
% 图像切割，获取有效区域图像
Irect = imcrop(Img, rect);
% 显示中间处理过程图像
if flag
    figure;
    subplot(2, 2, 1); imshow(Img, []); title('原图像');
    subplot(2, 2, 2); imshow(I, []); title('灰度图像');
    subplot(2, 2, 3); imshow(Img, []); title('有效区域图像标记');
    hold on;
    rectangle('Position', rect, 'EdgeColor', 'r', 'LineWidth', 2);
    hold off;
    subplot(2, 2, 4); imshow(Irect, []); title('有效区域图像');
end