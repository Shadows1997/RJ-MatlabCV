clear all;
close all;
I = imread('lenna.jpg');
 
H = 1;                      % ����pix��һ��Ԫ�أ����߶�
W = 2;                      % ����pix�ڶ���Ԫ�أ������
 
[M N] = size(I);                                                        % MΪԭͼ��ĸ߶ȣ�NΪԭͼ��Ŀ��
theta = 30 / 180 * pi;                                                  % ��ת�Ƕ�Ϊ˳ʱ�뷽��30��
rot = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];       % �任����
inv_rot = inv(rot);                                                     % �任�����������
pix1 = [1 1 1] * rot;                                                   % �任��ͼ�����ϵ������
pix2 = [1 N 1] * rot;                                                   % �任��ͼ�����ϵ������
pix3 = [M 1 1] * rot;                                                   % �任��ͼ�����µ������
pix4 = [M N 1] * rot;                                                   % �任��ͼ�����µ������
 
height = round(max([abs(pix1(H) - pix4(H)) abs(pix2(H) - pix3(H))])  + 0.5);        % �任��ͼ��ĸ߶�
width = round(max([abs(pix1(W) - pix4(W)) abs(pix2(W) - pix3(W))])  + 0.5);         % �任��ͼ��Ŀ��
delta_y = abs(min([pix1(H) pix2(H) pix3(H) pix4(H)]));                              % y�����ᳬ����ƫ����
delta_x = abs(min([pix1(W) pix2(W) pix3(W) pix4(W)]));                              % y�����ᳬ����ƫ����
 
I2 = zeros(height, width);
for y = 1 - delta_y : height - delta_y
   for x = 1 - delta_x : width - delta_x
      pix = [y x 1] * inv_rot;
      if pix(H) > 0.5 && pix(W) > 0.5 && pix(H) < M && pix(W) < N
          I2(y + delta_y, x + delta_x) = I(round(pix(H)), round(pix(W)));
      end
   end
end
 
subplot(1, 2, 1), imshow(I), title('ԭͼ��');
subplot(1, 2, 2), imshow(uint8(I2)), title('��ת���ͼ��');