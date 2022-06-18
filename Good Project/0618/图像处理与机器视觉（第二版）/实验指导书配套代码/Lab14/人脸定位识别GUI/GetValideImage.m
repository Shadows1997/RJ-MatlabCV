function [Irect, rect] = GetValideImage(Img, flag)
% ��ȡ��Чͼ������
if nargin < 2
    flag = 1;
end

% �ҶȻ�
if ndims(Img) == 3
    I = rgb2gray(Img);
else
    I = Img;
end
% ȥ����Ƶ�ڱߣ���λ��Чͼ������
tol = 1000;
sz = size(I);
cs = sum(I, 1);
c = find(cs > tol);
cmin = min(c);
cmax = max(c);
rect = [cmin 1 cmax-cmin sz(1)];
% ͼ���и��ȡ��Ч����ͼ��
Irect = imcrop(Img, rect);
% ��ʾ�м䴦�����ͼ��
if flag
    figure;
    subplot(2, 2, 1); imshow(Img, []); title('ԭͼ��');
    subplot(2, 2, 2); imshow(I, []); title('�Ҷ�ͼ��');
    subplot(2, 2, 3); imshow(Img, []); title('��Ч����ͼ����');
    hold on;
    rectangle('Position', rect, 'EdgeColor', 'r', 'LineWidth', 2);
    hold off;
    subplot(2, 2, 4); imshow(Irect, []); title('��Ч����ͼ��');
end