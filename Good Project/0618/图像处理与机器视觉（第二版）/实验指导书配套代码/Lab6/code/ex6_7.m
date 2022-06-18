
f =imread('你的图'); 
imshow(f);
[M,N]=size(f);   % M,N分别是图像f的宽度和高度
 
%对f进行傅立叶变换，没有对f进行扩充填0操作
F=fft2(f);
sig=10;         % sig是高斯滤波器的方差
 
% lpfilter 产生一个频域低通滤波器
H =lpfilter('gaussian', M, N, sig);
G=H.*F;    % 频域滤波，将滤波器和F相乘
% 滤波结果进行傅立叶逆变换并取其实部，得到空间域的滤波结果
g =real(ifft2(G));
% 由于折叠效应，g的图像水平边缘有些模糊，但是垂直边缘并不模糊
figure, imshow (g,[]);
PQ=paddedsize (size(f));  %PQ是扩充后的图像尺寸，默认为（M*2, N*2）
Fp=fft2(f, PQ(1), PQ(2));   %傅立叶变换并扩充到指定尺寸
Hp=lpfilter('gaussian', PQ(1),PQ(2), 2*sig);  %Hp是指定尺寸的低通滤波器
Gp=Hp.*Fp;     %频域低通滤波
gp=real(ifft2(Gp));  % 傅立叶逆变换，得到滤波结果
figure, imshow(gp,[  ]);  % 傅立叶逆变换后的结果，原图像只占据左上角1/4
gpc=gp(1:size(f,1), 1:size(f,2));  %只取逆变换的左上角部分
figure, imshow(gpc, [  ]);  %可以看到图像的垂直和水平边缘都变模糊


