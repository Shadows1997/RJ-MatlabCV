f =imread('你的图');
H=fftshift(hpfilter('ideal', 500, 500, 50));  % H是居中的高通滤波器
figure,mesh(H(1:10:500, 1 :10:500));          % 以网格的形式显示高通滤波器
figure,imshow(H, [ ]);                    % 以图像形式显示滤波器
 
PQ = paddedsize(size(f));  %填充大小
D0 = 0.05*PQ(1);          %截止频率
H = hpfilter('gaussian', PQ(1),PQ(2),D0);%高通滤波器
g = dftfilt(f, H);         %高通滤波
figure,imshow(g,[  ]);
%**********高频强调滤波***********************
f = imread('你的图');
figure,imshow(f);
PQ = paddedsize(size(f));
DO = 0.05 * PQ(1);
% HBW是巴特沃斯高通滤波器
HBW = hpfilter('btw',  PQ(1),  PQ(2),  DO,2);
H = 0.5+2 * HBW;           %H是高频强调滤波器
gbw = dftfilt(f,HBW);     %高通滤波
gbw=gscale(gbw);         %将值归一化到[o,1]
figure,imshow(gbw,[  ])  %显示高通滤波图像
ghf = dftfilt(f,H);          %高频强调滤波
ghf = gscale(ghf);           %值归一化
figure,imshow(ghf,[  ])   %显示高频强调滤波后的图像
ghe = histeq(ghf,256);     %直方图均衡化
figure,imshow(ghe,[  ])  %直方图均衡化后的图像



