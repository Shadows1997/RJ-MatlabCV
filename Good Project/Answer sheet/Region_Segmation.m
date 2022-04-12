function [bw1, bw2] = Region_Segmation(XY, bw, Img, flag)
%分割区域
% 输入参数：
% XY——当前图像直线信息(已经按直线长度进行降序排列)
% bw——当前答题卡二值图像
% Img——原图像
% flag——是否显示图像
% 输出参数：
% bw1——对应下区域
% bw2——对应上区域
if nargin < 4
    flag = 1; 
end
%分割直线
% 图像摆正后，结合答题卡图片本身的特性，名字准考证区域与答题区域中间有条直线分割
% 答题区域与答题卡尾部有条直线分割
% 这样识别出直线后，根据直线长度排序，取最长的两条直线，就可以得到
% 区域分割位置
for i = 1 : 2
    xy = XY{i}; %第i条直线
    %水平线只关注Y方向即可
    XY{i} = [1 xy(1, 2); size(bw, 2) xy(2, 2)];%直线信息
    %为了对应图像像素，取整数
    ri(i) = round(mean([xy(1,2) xy(2,2)]));
end
%两条直线分出上下位置来
minr = min(ri);
maxr = max(ri);
bw1 = bw; bw2 = bw;
%分割区域
%bw1对应下区域
bw1(1:minr+5, :) = 0;
bw1(maxr-5:end, :) = 0;
%bw2对应上区域
bw2(minr-5:end, :) = 0;
bw2(1:round(minr*0.5), :) = 0;

if flag
    figure('units', 'normalized', 'position', [0 0 1 1]);
    subplot(2, 2, 1); imshow(Img, []); title('原图像', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(bw, []); title('原二值图像', 'FontWeight', 'Bold');
    hold on;
    for i = 1 : 2
        xy = XY{i}; 
        plot(xy(:, 1), xy(:, 2), 'r-', 'LineWidth', 2);
    end
    hold off;
    subplot(2, 2, 3); imshow(bw1, []); title('下区域图像', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(bw2, []); title('上区域图像', 'FontWeight', 'Bold');
end