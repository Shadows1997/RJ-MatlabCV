%%
% ʹ�ø�˹��ͨ�˲����˲�
f = imread('Fig0313(a).tif');
imshow(f);
[f,revertclass] = tofloat(f);
PQ = paddedsize(size(f));
[U,V] = dftuv(PQ(1),PQ(2));
D = hypot(U,V);
D0 = 0.05*PQ(2);
F = fft2(f,PQ(1),PQ(2));
H = exp(-(D.^2)/(2*(D0^2)));
g = dftfilt(f,H);
g = revertclass(g);
figure,imshow(fftshift(H));
figure,imshow(log(1 + abs(fftshift(F))),[ ]);
figure,imshow(g);

%%
%   ʹ��lpfilter �������и�˹��ͨ�˲�
f = imread('Fig0313(a).tif');
imshow(f);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
H = lpfilter('gaussian',PQ(1),PQ(2),D0);
g = dftfilt(f,H);
figure,imshow(g)

%%  
%   ʹ�ø�˹��ͨ�˲����˲�
f = imread('Fig0313(a).tif');
imshow(f);
PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
H = hpfilter('gaussian',PQ(1),PQ(2),D0);
g = dftfilt(f,H);
figure,imshow(g)
