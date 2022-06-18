%图像平移
clear all;
close all;
I = imread('cameraman.tif');
 
delta_x = 100;                                       % 水平方向的偏移量
delta_y = 100;                                       % 垂直方向的偏移量
[M N] = size(I);                                    % 原图像的宽度和高度
I2 = zeros(M, N);
for x = 1 : M
    if x + delta_x <= M
        for y = 1 : N
            if y + delta_y <= N
               I2(x + delta_x, y + delta_y) = I(x, y);
            end
        end
    end
end
subplot(1, 2, 1), imshow(I);
subplot(1, 2, 2), imshow(uint8(I2));