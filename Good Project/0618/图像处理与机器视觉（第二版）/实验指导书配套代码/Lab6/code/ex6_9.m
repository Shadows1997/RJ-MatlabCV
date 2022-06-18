f =imread('你的图');
imshow(f);
PQ=paddedsize(size(f));          %计算填充大小
%利用函数 dftuv 得到频域坐标网格
[U, V]=dftuv(PQ(1), PQ(2));
DO=0.05*PQ(2);               % DO是截至频率
F = fft2(f,PQ(1), PQ(2));        % 傅立叶变换
H=exp(-(U.^2+V.^2)/(2*(DO^2)));   % H是高斯低通滤波器
g =dftfilt(f,H);              % 高斯低通滤波的结果
figure, imshow(g,[]);
figure, imshow(fftshift (H), [ ] );  % 查看居中之后的低通滤波器
figure, imshow(log(1+abs(fftshift (F))), [ ] );  % 显示对数变换后的频谱
figure,mesh(fftshift(H(1:10:PQ(1), 1:10:PQ(2))));      % 以网格的形式显示低通滤波器
figure,surf(fftshift(H(1:10:PQ(1), 1:10:PQ(2))));       % 以表面图的形式显示低通滤波器


