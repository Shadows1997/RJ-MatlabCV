%ͼ������
clear all;
close all;
 
I = imread('line.bmp');
[M N] = size(I);
 
width = int32(0.5 * N)                                    % ��ͼ������СΪԭ����1/2
height = int32(0.5 * M)                                   % ��ͼ��߶���СΪԭ����1/2
 
I2 = uint8(zeros(height, width));
widthScale = floor(N / width);
heightScale = floor(M / height);
 
for y = 1 : height
   for x = 1 : width
       oldX = x * widthScale;
       oldY = y * heightScale;
       I2(y, x) = I(oldY, oldX);
   end
end
 
a1 = subplot(1, 2, 1);
imshow(I), title('ԭͼ��');
a2 = subplot(1, 2, 2);
imshow(I2), title('��С���ͼ��');
set(a2, 'XLim', get(a1, 'XLim'), 'YLim', get(a1, 'YLim'));          % ������sunplot��x,y�ᵥλ������Ϊһ��
