clear all;
close all;
 
I = imread('lenna.jpg');
[M N] = size(I);
 
width = 2 * N;                                          % 将图像宽度放大为原来的2倍
height = 2 * M;                                         % 将图像高度放大为原来的2倍
 
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
imshow(I), title('原图像');
a2 = subplot(1, 2, 2);
imshow(I2), title('放大后的图像');
set(a1, 'XLim', get(a2, 'XLim'), 'YLim', get(a2, 'YLim'));          % 将两个sunplot的x,y轴单位长度设为一样
