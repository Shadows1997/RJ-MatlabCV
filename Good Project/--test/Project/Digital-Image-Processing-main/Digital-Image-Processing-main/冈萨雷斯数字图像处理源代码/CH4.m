%% ������ Ƶ����

%% fftshift �����任 fftshift ��Ҫ������ʾ H ʹ��
clc
clear
f = imread('..\Pictures\images_ch04\Fig0403(a)(image).tif');
imshowMy(f)
title('ԭʼͼ��')
imfinfoMy(f)

F = fft2(f);

S = abs(F);
% S(1:5,1:5)
imshowMy(S,[])
title('����ҶƵ��ͼ��')
imfinfoMy(S)

Fc = fftshift(F);
S = abs(Fc);
% S(1:5,1:5)
imshowMy(S)
imshowMy(S,[])
title('���еĸ���ҶƵ��ͼ��')
imfinfoMy(S)

S = abs(F);
% S(1:5,1:5)
S2 = log(1+S);
% imshowMy(S2)
imshowMy(S2,[])
title('ʹ�ö����任�����Ӿ���ǿ��ĸ���ҶƵ��ͼ��')
imfinfoMy(S2)

Fc = fftshift(F);
S = abs(Fc);
% S(1:5,1:5)
S2 = log(1+S);
% imshowMy(S2)
imshowMy(S2,[])
title('ʹ�ö����任�����Ӿ���ǿ�����к�ĸ���ҶƵ��ͼ��')
imfinfoMy(S2)

%% fftshift �����任 flower_gray.jpg (�ٶȺ���)
clc
clear
f = imread('..\Pictures\images_ch04\flower_gray.jpg');
imshowMy(f)

f = double(f);

F = fft2(f);



Fc = fftshift(F);
S = abs(Fc);
% S(1:5,1:5)
S2 = log(1+S);
% imshowMy(S2)
imshowMy(S2,[])

%% ifft2 ע�⣡����imshow(f,[])��imshow(f)�ľ޴����𣡣���
clc
clear
f = imread('..\Pictures\images_ch04\flower_gray.jpg');
imshowMy(f)
imfinfoMy(f)

f = double(f);  % �ؼ�����

f(1:8,1:8)
F = fft2(f);

f = real(ifft2(F));
f(1:8,1:8)
imshowMy(f,[])




%% ��4.1 ʹ�����Ͳ�ʹ�������˲�Ч�� lpfilter paddedsize
clc
clear

f = imread('..\Pictures\images_ch04\Fig0405(a)(square_original).tif');
f = im2double(f);
imshowMy(f,[])
imfinfoMy(f)
title('ԭʼͼ��')

[M, N] = size(f);
F = fft2(f);  % max(F(:)) = 128000
imshowMy(F,[])
imfinfoMy(F)
title('����ҶƵ�ף�������ͼ��')

sig = 10;
H = lpfilter('gaussian',M,N,sig); % max(H(:)) = 1
imshowMy(1-H,[]) % ��ʾ�����˲���ͼ��δ����
title('�˲���Ƶ�ף�ȡ����ͼ��')

G = H.*F;
g = real(ifft2(G));
imshowMy(g,[])
title('��ʹ������Ƶ���ͨ�˲�������ͼ��')

PQ = paddedsize(size(f)); % size(f)=[256 256]
Fp = fft2(f, PQ(1),PQ(2));
Hp = lpfilter('gaussian',PQ(1),PQ(2),2*sig); % PQ=[512 512]
imshowMy(fftshift(Hp),[])
Gp = Hp.*Fp;
gp = real(ifft2(Gp));
imshowMy(gp,[])
title('ʹ������Ƶ���ͨ�˲�������ͼ��')

gpc = gp(1:size(f,1),1:size(f,2));
imshowMy(gpc,[])
title('ʹ������Ƶ���ͨ�˲������ģ���ȡԭʼ��С��ͼ��')
imfinfoMy(gpc)

h = fspecial('gaussian',15,7);
gs = imfilter(f,h);
imshowMy(gs,[])
title('ʹ�ÿռ��˲���������ͼ��')
imfinfoMy(gs)

%% fspecial ʵ�ֺ�����һ�γ���ͬ������
clc
clear

f = imread('..\Pictures\images_ch04\Fig0405(a)(square_original).tif');

h = fspecial('gaussian',15,7); % 
imshowMy(h,[])

gs = imfilter(f,h);
imshowMy(gs,[])

%% dftfilt P88 һ��Ҫע��lpfilter�Ĳ������ �� ʹ��DFT�� H �Ⱦ����� % H = lpfilter����% �������˲���ԭ�������Ͻ�
clc
clear
f = imread('..\Pictures\images_ch04\Fig0405(a)(square_original).tif');
f = im2double(f);
imshowMy(f,[])

PQ = paddedsize(size(f)); % size(f)=[256 256]
sig = 10;
H = lpfilter('gaussian',PQ(1),PQ(2),2*sig); % PQ=[512 512]

figure,mesh(abs(H(1:10:512,1:10:512)))

g = dftfilt(f,H);  % �����ϲ�Ϊһ�� % Ҫ�� H ԭ�������Ͻ�
imshowMy(g,[])

% H1 = ifftshift(H);
% g1 = dftfilt(f,H1);  % �����ϲ�Ϊһ��
% imshowMy(g1,[])

%% ��4.2 �ռ����˲���Ƶ���˲��ıȽ� f = im2double(f)
clc
clear
f = imread('..\Pictures\images_ch04\Fig0409(a)(bld).tif');
imfinfoMy(f)
imshowMy(f)
title('ԭʼͼ��')

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imshowMy(S)
title('����ҶƵ��ͼ��')

f = im2double(f); % ת��Ϊ
F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imfinfoMy(S)
imshowMy(S)
title('ʹ�� f = im2double(f) ֮���ٽ��д���ĸ���ҶƵ��ͼ��')
 
%% ��4.2 freqz2 P90 ��ǿ��ֱ��Ե sobel  H = freqz2(h,PQ(1),PQ(2)); % �������˲���ԭ���ھ������Ĵ�
clc
clear
f = imread('..\Pictures\images_ch04\Fig0409(a)(bld).tif');
imshowMy(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imshowMy(S)

h = fspecial('sobel')'; % ��ǿ��ֱ��Ե
%      1     0    -1
%      2     0    -2
%      1     0    -1
figure,freqz2(h); % uses [n2 n1] = [64 64].
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2)); % �������˲���ԭ���ھ������Ĵ�
H1 = ifftshift(H); % Ǩ��ԭ�㵽���Ͻ�
figure,mesh(abs(H1(1:20:1200,1:20:1200)))

imshowMy(abs(H),[])
imshowMy(abs(H1),[])

gs = imfilter(double(f),h);;
gf = dftfilt(f,H1);

imshowMy(gs,[])
imshowMy(gf,[])

imshowMy(abs(gs),[])
imshowMy(abs(gf),[])

imshowMy(abs(gs) > 0.2*abs(max(gs(:))))
imshowMy(abs(gf) > 0.2*abs(max(gf(:))))


d = abs(gs-gf);
max(d(:))
min(d(:))

%% freqz2 P90 ��ǿˮƽ��Ե sobel % fft2(f) ������Ƶ�� F ��ԭ�������Ͻ� 
clc
clear
f = imread('..\Pictures\images_ch04\Fig0409(a)(bld).tif');
imshowMy(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imshowMy(S)

h = fspecial('sobel'); % ��ǿˮƽ��Ե
figure,freqz2(h);
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2));
H1 = ifftshift(H);
figure,mesh(abs(H1(1:20:1200,1:20:1200)))

imshowMy(abs(H),[])
imshowMy(abs(H1),[])

gs = imfilter(double(f),h);;
gf = dftfilt(f,H1);

% imshowMy(gs,[])
% imshowMy(gf,[])
% 
% imshowMy(abs(gs),[])
% imshowMy(abs(gf),[])
% 
% imshowMy(abs(gs) > 0.2*abs(max(gs(:))))
% imshowMy(abs(gf) > 0.2*abs(max(gf(:))))


d = abs(gs-gf);
max(d(:))
min(d(:))

%% freqz2 P90 ��ǿ��ֱ��Ե prewitt
clc
clear
f = imread('..\Pictures\images_ch04\Fig0409(a)(bld).tif');
imshowMy(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imshowMy(S)

h = fspecial('prewitt')';
figure,freqz2(h);
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2));
H1 = ifftshift(H);
figure,mesh(abs(H1(1:20:1200,1:20:1200)))

imshowMy(abs(H),[])
imshowMy(abs(H1),[])

gs = imfilter(double(f),h);;
gf = dftfilt(f,H1);

imshowMy(gs,[])
imshowMy(gf,[])

imshowMy(abs(gs),[])
imshowMy(abs(gf),[])

imshowMy(abs(gs) > 0.2*abs(max(gs(:))))
imshowMy(abs(gf) > 0.2*abs(max(gf(:))))


d = abs(gs-gf);
max(d(:))
min(d(:))

%% freqz2 P90 ��ǿˮƽ��Ե prewitt
clc
clear
f = imread('..\Pictures\images_ch04\Fig0409(a)(bld).tif');
imshowMy(f)

F = fft2(f);
S = fftshift(log(1+abs(F)));
S = gscale(S);
imshowMy(S)

h = fspecial('prewitt');
figure,freqz2(h);
% size_h = size(temp)

PQ = paddedsize(size(f));
H = freqz2(h,PQ(1),PQ(2));
H1 = ifftshift(H);
figure,mesh(abs(H1(1:20:1200,1:20:1200)))

imshowMy(abs(H),[])
imshowMy(abs(H1),[])

gs = imfilter(double(f),h);;
gf = dftfilt(f,H1);

% imshowMy(gs,[])
% imshowMy(gf,[])
% 
% imshowMy(abs(gs),[])
% imshowMy(abs(gf),[])
% 
% imshowMy(abs(gs) > 0.2*abs(max(gs(:))))
% imshowMy(abs(gf) > 0.2*abs(max(gf(:))))


d = abs(gs-gf);
max(d(:))
min(d(:))


%% ��4.3 dftuv ��������ʵ��Ƶ���˲�������������
clc
clear

[U,V] = dftuv(7,5);
% [U,V] = dftuv(8,5);

D = U.^2 + V.^2

fftshift(D)

%% ��4.4 ��ͨ�˲��� dftfilt dftuv
clc
clear
f = imread('..\Pictures\images_ch04\Fig0413(a)(original_test_pattern).tif');
imshowMy(f)
title('ԭʼͼ��')

F1 = fft2(f); % ע�� F1 �� ���� F ������
imshowMy(log(1+abs(fftshift(F1))),[])
title('����ҶƵ��ͼ��')

PQ = paddedsize(size(f));
[U V] = dftuv(PQ(1),PQ(2));
D0 = 0.05*PQ(2);

F = fft2(f,PQ(1),PQ(2));
imshowMy(log(1+abs(fftshift(F))),[])
title('����ҶƵ��ͼ��')

H = exp(-(U.^2+V.^2)/(2*(D0^2)));
imshowMy(fftshift(H),[])
title('��˹��ͨ�˲���Ƶ��ͼ��')

g = dftfilt(f,H);
imshowMy(g,[])
title('��˹��ͨ�����ͼ��')


%% ��4.5 �����߿�ͼ mesh lpfilter ��ͨ
clc
clear
H = fftshift(lpfilter('gaussian',500,500,50));
mesh(H(1:10:500,1:10:500))
axis([0 50 0 50 0 1])

% colormap([0 0 0])
% axis off
% grid off

imshowMy(H,[])


%% ��4.6 ��ͨ�˲��� hpfilter ��ͨ
clc
clear

H = fftshift(hpfilter('ideal',500,500,100)); % �뾶��100
% H = fftshift(hpfilter('gaussian',500,500,50));
% H = fftshift(hpfilter('btw',500,500,50));

mesh(H(1:10:500,1:10:500))
axis([0 50 0 50 0 1])

colormap([0 0 0])
axis off
grid off

imshowMy(H,[])

%% ��4.7 ��ͨ�˲�
clc
clear

f = imread('..\Pictures\images_ch04\Fig0413(a)(original_test_pattern).tif');
imshowMy(f)
title('ԭʼͼ��')

PQ = paddedsize(size(f));

D0 = 0.05*PQ(1); % �뾶�� D0
H = hpfilter('gaussian',PQ(1),PQ(2),D0);
g = dftfilt(f,H);
imshowMy(g,[])
title('��˹��ͨ�˲����ͼ��')



%% ��4.8 ����Ƶǿ���˲���ֱ��ͼ���⻯������� hpfilter histeq
clc
clear
f = imread('..\Pictures\images_ch04\Fig0419(a)(chestXray_original).tif');
imshowMy(f)
title('ԭʼͼ��')
imfinfoMy(f)

PQ = paddedsize(size(f));
D0 = 0.05*PQ(1);
HBW = hpfilter('btw',PQ(1),PQ(2),D0,2);
H = 0.5+2*HBW;
gbw = dftfilt(f,HBW);
% ʹ���� gscale(gbw) ֮��imshowMy(gbw) �ȼ��� imshowMy(gbw,[])
gbw = gscale(gbw); 
imshowMy(gbw,[])
title('��ͨ�˲����ͼ��')
imfinfoMy(gbw)

gbe = histeq(gbw,256);
imshowMy(gbe,[])
title('��ͨ�˲�������ֱ��ͼ���⻯���ͼ��')
imfinfoMy(gbe)

ghf = dftfilt(f,H);
ghf = gscale(ghf);
imshowMy(ghf,[])
title('��Ƶǿ���˲����ͼ��')
imfinfoMy(ghf)

ghe = histeq(ghf,256);
imshowMy(ghe,[])
title('��Ƶǿ���˲�������ֱ��ͼ���⻯���ͼ��')
imfinfoMy(ghe)

%% fftshift ifftshift 
clc
clear

A = [2 0 0 1
     0 0 0 0
     0 0 0 0
     3 0 0 4]

fftshift(A)

fftshift(fftshift(A))

ifftshift(fftshift(A))



%% ע��!!!
freqz2 ���ɵ��˲���ԭ����������
lpfilter����ͨ�����ɵ��˲���ԭ�������Ͻ�
hpfilter����ͨ�����ɵ��˲���ԭ�������Ͻ�

%% 
clc
clear


����ū��������ͥ��
      -- ��Т�� 
      
��ͥ��ݣ����������һ���ɫ�� 
������������꣬���ұ���һҶ�� 
���·ֻԣ����ӹ�Ӱ�������γ��� 
��Ȼ�Ļᣬ������˵�� 

Ӧ������꣬�¹����գ��ε��Ա�ѩ�� 
�̷���ɧ�����䣬�ȷ���������� 
����������ϸ�山��������Ϊ���͡� 
���϶�Х����֪��Ϧ��Ϧ�� 

