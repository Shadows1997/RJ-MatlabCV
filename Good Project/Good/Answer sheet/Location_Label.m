function [stats1, stats2, Line] = Location_Label(bw1, bw2, Img, XYn, Loc1, flag)
%区域标记
% 输入参数：
% bw1，bw2，Img——图像矩阵
% XYn、Loc1——直线信息
% flag——是否显示图像
% 输出参数：
% stats1、stats2——区域属性信息
% Line——边界直线信息
if nargin < 6
    flag = 1;
end
%标记下区域
[L1, num1] = bwlabel(bw1);
%下区域属性信息
stats1 = regionprops(L1);
%标记上区域
[L2, num2] = bwlabel(bw2);
%上区域属性信息
%%regionprops()的返回信息默认有Area、Centroid和BoundingBox
%Area为实际像素数量
%Centroid为有效像素区域内的质心坐标
%BoundingBox格式[区域左上角坐标……，对应方向宽度……]
%例如[x,y,z,...,x_width,y_width,z_width,...]
stats2 = regionprops(L2);
%两条标记线
Line1 = XYn{1};
Line2 = XYn{2};
%确定上下线信息
if mean(Line2(:, 2)) < mean(Line1(:, 2))
    Line1 = XYn{2};
    Line2 = XYn{1};
end
[r1, c1] = find(bw1);%bw1中非零元素的行列下标
[r2, c2] = find(bw2);
%定位直线信息
Loc2 = min([min(c1), min(c2)])-5;
Line1 = [1 mean(Line1(:, 2)); size(Img, 2) mean(Line1(:, 2))];
Line2 = [1 mean(Line2(:, 2)); size(Img, 2) mean(Line2(:, 2))];
Line3 = [Loc2 1; Loc2 size(Img, 1)];
Line4 = [Loc1 1; Loc1 size(Img, 1)];
%直线整合
Line{1} = Line1;
Line{2} = Line2;
Line{3} = Line3;
Line{4} = Line4;
if flag
    figure();
    imshow(Img, []); title('标记图像', 'FontWeight', 'Bold');
    hold on;
    for i = 1 : num1
        temp = stats1(i).Centroid;
        plot(temp(1), temp(2), 'rp');
    end
    hold off;
    set(gcf, 'units', 'normalized', 'position', [0 0 1 1]);
end
