clear all;
close all;
 
I = imread('lenna.jpg');
[M N] = size(I);
 
width = 2 * N;                                          % ��ͼ���ȷŴ�Ϊԭ����2��
height = 2 * M;                                         % ��ͼ��߶ȷŴ�Ϊԭ����2��
 
I2 = uint8(zeros(height, width));
widthScale = width / N;
heightScale = height / M;
 
for y = 1 : height
   for x = 1 : width
       oldX = round(x / widthScale);
       oldY = round(y / heightScale);
       if oldX == 0 oldX = 1; end
       if oldY == 0 oldY = 1; end
       if oldX > N oldX = N; end
       if oldY > M oldY = M; end
       I2(y, x) = I(oldY, oldX);
   end
end
 
a1 = subplot(1, 2, 1);
imshow(I), title('ԭͼ��');
a2 = subplot(1, 2, 2);
imshow(I2), title('�Ŵ���ͼ��');
set(a1, 'XLim', get(a2, 'XLim'), 'YLim', get(a2, 'YLim'));          % ������sunplot��x,y�ᵥλ������Ϊһ��
