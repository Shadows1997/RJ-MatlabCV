function [Len, XYn, xy_long] = Hough_Process(bw, Img, flag)
% hough��⴦��
% ���������
% bw������ֵͼ��
% Img����ͼ����Ϣ
% flag�����Ƿ���ʾͼ��
% ���������
% Len����ֱ�߳��ȼ���
% XYn����ֱ�߶˵㼯��
% xy_long�����ֱ�߶˵㼯��
if nargin < 3
    flag = 1;
end
%hough�任
[H, T, R] = hough(bw);%HΪhough����TΪtheta��RΪrho
P = houghpeaks(H, 4, 'threshold', ceil(0.3*max(H(:))));
lines = houghlines(bw, T, R, P, 'FillGap', 50, 'MinLength', 7);
max_len = 0;
%����ֱ����Ϣ
for k = 1 : length(lines)
    xy = [lines(k).point1; lines(k).point2]; %ֱ�ߵ�����
    len = norm(lines(k).point1-lines(k).point2); %ֱ�ߵĳ���
    Len(k) = len;
    if len > max_len
        max_len = len;
        xy_long = xy;
    end
    XY{k} = xy; % �洢��Ϣ
end
[Len, ind] = sort(Len(:), 'descend'); % �����Ƚ�������indΪ��������
% ֱ����Ϣ����
for i = 1 : length(ind)
    XYn{i} = XY{ind(i)};%ind(i)Ϊ����������������λ��
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
    subplot(2, 2, 1); imshow(bw); title('��ֵͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 2); imshow(H, [], 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
    xlabel('\theta'); ylabel('\rho');
    axis on; axis normal; title('����任��', 'FontWeight', 'Bold')
    subplot(2, 2, 3); imshow(Img); title('ԭͼ��', 'FontWeight', 'Bold');
    subplot(2, 2, 4); imshow(Img); title('�����ʶͼ��', 'FontWeight', 'Bold');
    hold on;
    plot(xy_long(:,1), xy_long(:,2), 'LineWidth', 2, 'Color', 'r');
end