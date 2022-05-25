clear all
clc
I8 = imread('011.BMP');
I8=im2bw(I8);
% I = rgb2gray(I);  % 对图像进行灰度处理，若是，可跳过
[m n]=size(I8); % m n分别为图像的行 列数
%--- 进行垂直灰度投影
for y=1:n
     V(y)=sum(I8(1:m,y));
end
y=1:n;
figure
subplot(211), plot(y,V(y));
title('垂直灰度投影');
% 进行水平灰度投影
for x=1:m
    L(x)=sum(I8(x,:));
end
x=1:m;
subplot(212),plot(x,L(x));
title('水平灰度投影');