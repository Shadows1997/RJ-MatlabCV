%ͼ��ƽ��
clear all;
close all;
I = imread('cameraman.tif');
 
delta_x = 100;                                       % ˮƽ�����ƫ����
delta_y = 100;                                       % ��ֱ�����ƫ����
[M N] = size(I);                                    % ԭͼ��Ŀ�Ⱥ͸߶�
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