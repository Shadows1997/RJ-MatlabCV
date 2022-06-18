%图像缩放
clear all;
close all;
 
I = imread('line.bmp');
[M N] = size(I);
 
width = int32(0.5 * N)                                    % 将图像宽度缩小为原来的1/2
height = int32(0.5 * M)                                   % 将图像高度缩小为原来的1/2
 
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
imshow(I), title('原图像');
a2 = subplot(1, 2, 2);
imshow(I2), title('缩小后的图像');
set(a2, 'XLim', get(a1, 'XLim'), 'YLim', get(a1, 'YLim'));          % 将两个sunplot的x,y轴单位长度设为一样
