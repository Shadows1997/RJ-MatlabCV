f =imread('你的图');
imshow(f);
F=fft2(f);       %对f做傅立叶变频
% S是对数变换并移到中心的傅立频谱
S=fftshift(log(1+abs(F)));
S=gscale(S);      %将S归一化到[0，1]之间
figure, imshow(S,[ ]);  %显示傅立频谱
 
h=fspecial ('sobel')  %是3*3 垂直方向Sobel滤波器
freqz2(h)     %显示与h相应的频域滤波器的图形
PQ= paddedsize(size(f));  %填充大小
H=freqz2(h, PQ(1), PQ(2)); %生成与h相应的频域滤波器，并扩充到指定大小
H1=ifftshift(H);           %解除H的居中
figure, imshow(abs(H),[  ]);  %显示频域滤波器的频谱，能量集中在中心
figure, imshow(abs(H1),[  ]);  %解除居中操作后的频谱，能量集中在四个角上
 
gs=imfilter(double(f), h);    % 对f进行空间滤波操作，采取0填充边界
gf=dftfilt(f, H1);           %对f 进行频域滤波，dftfilt 函数见第4.6节
figure, imshow(gs, [ ]);   %显示空间滤波结果
figure, imshow(gf, [ ]);    %显示频域滤波结果
 
figure, imshow(abs(gs), [ ]);  %取gs的绝对值，消除负值
figure, imshow(abs(gs), [ ]);  %取gf的绝对值，消除负值
 
d=abs(gs-gf);     %对空间滤波结果和频域滤波结果取差值
max(d(:))               %打印差值的最大值
min(d(:))              %打印差值的最小值

