clear all;
close all;
I = imread('lenna.jpg');
 
H = 1;                      % 矩阵pix第一个元素，即高度
W = 2;                      % 矩阵pix第二个元素，即宽度
 
[M N] = size(I);                                                        % M为原图像的高度，N为原图像的宽度
theta = 30 / 180 * pi;                                                  % 旋转角度为顺时针方向30度
rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];       % 变换矩阵
inv_rot = inv(rot);                                                     % 变换矩阵的逆运算
pix1 = [1 1 1] * rot;                                                   % 变换后图像左上点的坐标
pix2 = [1 N 1] * rot;                                                   % 变换后图像右上点的坐标
pix3 = [M 1 1] * rot;                                                   % 变换后图像左下点的坐标
pix4 = [M N 1] * rot;                                                   % 变换后图像右下点的坐标
 
height = round(max([abs(pix1(H) - pix4(H)) abs(pix2(H) - pix3(H))])  + 0.5);        % 变换后图像的高度
width = round(max([abs(pix1(W) - pix4(W)) abs(pix2(W) - pix3(W))])  + 0.5);         % 变换后图像的宽度
delta_y = abs(min([pix1(H) pix2(H) pix3(H) pix4(H)]));                              % y方向负轴超出的偏移量
delta_x = abs(min([pix1(W) pix2(W) pix3(W) pix4(W)]));                              % y方向负轴超出的偏移量
 
I2 = zeros(height, width);
for y = 1 - delta_y : height - delta_y
   for x = 1 - delta_x : width - delta_x
      pix = [y x 1] * inv_rot;
      if pix(H) > 0.5 && pix(W) > 0.5 && pix(H) < M && pix(W) < N
          I2(y + delta_y, x + delta_x) = I(round(pix(H)), round(pix(W)));
      end
   end
end
 
subplot(1, 2, 1), imshow(I), title('原图像');
subplot(1, 2, 2), imshow(uint8(I2)), title('旋转后的图像');