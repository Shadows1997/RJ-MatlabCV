function [stats1, stats2, Line] = Location_Label(bw1, bw2, Img, XYn, Loc1, flag)
%������
% ���������
% bw1��bw2��Img����ͼ�����
% XYn��Loc1����ֱ����Ϣ
% flag�����Ƿ���ʾͼ��
% ���������
% stats1��stats2��������������Ϣ
% Line�����߽�ֱ����Ϣ
if nargin < 6
    flag = 1;
end
%���������
[L1, num1] = bwlabel(bw1);
%������������Ϣ
stats1 = regionprops(L1);
%���������
[L2, num2] = bwlabel(bw2);
%������������Ϣ
%%regionprops()�ķ�����ϢĬ����Area��Centroid��BoundingBox
%AreaΪʵ����������
%CentroidΪ��Ч���������ڵ���������
%BoundingBox��ʽ[�������Ͻ����ꡭ������Ӧ�����ȡ���]
%����[x,y,z,...,x_width,y_width,z_width,...]
stats2 = regionprops(L2);
%���������
Line1 = XYn{1};
Line2 = XYn{2};
%ȷ����������Ϣ
if mean(Line2(:, 2)) < mean(Line1(:, 2))
    Line1 = XYn{2};
    Line2 = XYn{1};
end
[r1, c1] = find(bw1);%bw1�з���Ԫ�ص������±�
[r2, c2] = find(bw2);
%��λֱ����Ϣ
Loc2 = min([min(c1), min(c2)])-5;
Line1 = [1 mean(Line1(:, 2)); size(Img, 2) mean(Line1(:, 2))];
Line2 = [1 mean(Line2(:, 2)); size(Img, 2) mean(Line2(:, 2))];
Line3 = [Loc2 1; Loc2 size(Img, 1)];
Line4 = [Loc1 1; Loc1 size(Img, 1)];
%ֱ������
Line{1} = Line1;
Line{2} = Line2;
Line{3} = Line3;
Line{4} = Line4;
if flag
    figure();
    imshow(Img, []); title('���ͼ��', 'FontWeight', 'Bold');
    hold on;
    for i = 1 : num1
        temp = stats1(i).Centroid;
        plot(temp(1), temp(2), 'rp');
    end
    hold off;
    set(gcf, 'units', 'normalized', 'position', [0 0 1 1]);
end
