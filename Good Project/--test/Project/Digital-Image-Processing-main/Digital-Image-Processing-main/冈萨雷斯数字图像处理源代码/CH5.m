%% ������ ͼ��ԭ

%% ��5.2 ��������
clc
clear

r = imnoise2('gaussian',100000,1,0,1);
bins = 100;
hist(r,bins)
title('gaussian')

r = imnoise2('uniform',100000,1,0,1);
bins = 100;
figure,hist(r,bins)
title('uniform')

r = imnoise2('salt & pepper',1000,1,0.1,0.27);
bins = 100;
figure,hist(r,bins)
title('salt & pepper')

r = imnoise2('lognormal',100000,1);
bins = 100;
figure,hist(r,bins)
title('lognormal')

r = imnoise2('rayleigh',100000,1,0,1);
bins = 100;
figure,hist(r,bins)
title('rayleigh')

r = imnoise2('exponential',100000,1);
bins = 100;
figure,hist(r,bins)
title('exponential')

r = imnoise2('erlang',100000,1);
bins = 100;
figure,hist(r,bins)
title('erlang')




%% ��5.3 imnoise3 
clc
clear
C = [0 64; 0 128; 32 32; 64 0; 128 0; -32 32];
[r,R,S] = imnoise3(512, 512, C);
imshowMy(S,[])
imfinfoMy(S)
title('[6��]ָ�������������������Ƶ��[1]')

imshowMy(abs(R),[])

imshowMy(r,[])
imfinfoMy(r)
title('[6��]��Ӧ��������������ģʽ[1]')
% S1 = fftshift(S);
% imshowMy(S1,[])
% figure,mesh(S)


C1 = C/2;
[r,R,S] = imnoise3(512, 512, C1);
imshowMy(S,[])
title('[6��]ָ�������������������Ƶ��[2]')
imshowMy(r,[])
title('[6��]��Ӧ��������������ģʽ[2]')

C2 = [6 32; -2 2];
[r,R,S] = imnoise3(512, 512, C2);
imshowMy(S,[])
title('[2��]ָ�������������������Ƶ��[3]')
imshowMy(r,[])
title('[2��]��Ӧ��������������ģʽ[3]')

A = [1 5];
[r,R,S] = imnoise3(512, 512, C2, A);
imshowMy(1-S,[])  %������������ĵ㣬��Ϊ�������С
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]ָ�������������������Ƶ��[4]')
imshowMy(r,[])
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]��Ӧ��������������ģʽ[4]')


%% imnoise3 
clc
clear
C1 = [6 32];
[r,R,S] = imnoise3(512, 512, C1);
imshowMy(S,[])
title('[1��]ָ�������������������Ƶ��[1]')
imshowMy(r,[])
title('[1��]��Ӧ��������������ģʽ[1]')

C2 = [ -2 2];
[r,R,S] = imnoise3(512, 512, C2);
imshowMy(S,[])
title('[1��]ָ�������������������Ƶ��[2]')
imshowMy(r,[])
title('[1��]��Ӧ��������������ģʽ[2]')


C3 = [6 32; -2 2];
A = [1 5];
[r,R,S] = imnoise3(512, 512, C3, A);
imshowMy(1-S,[])  %������������ĵ㣬��Ϊ�������С
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]ָ�������������������Ƶ��[1]')
imshowMy(r,[])
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]��Ӧ��������������ģʽ[1]')


C3 = [6 32; -2 2];
A = [5 1];
[r,R,S] = imnoise3(512, 512, C3, A);
imshowMy(1-S,[])  %������������ĵ㣬��Ϊ�������С
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]ָ�������������������Ƶ��[2]')
imshowMy(r,[])
title('[2��][ʹ�÷�Ĭ�ϵĲ�ͬ���]��Ӧ��������������ģʽ[2]')


%% ��5.4 ������������    ����ʽѡȡ���������ֱ��ͼ
clc
clear

f = imread('..\Pictures\images_ch05\Fig0504(a)(noisy_image).tif');
imshow(f)
title('ԭʼ������ͼ��')

[B,c,r] = roipoly(f);
figure,imshow(B)

[p,npix] = histroi(f,c,r);
figure,bar(p,1)
title('����ʽѡȡ���������ֱ��ͼ')
axis tight

[v,unv] = statmoments(p,2) % ????

X = imnoise2('gaussian',npix,1, unv(1), sqrt(unv(2)) );
figure,hist(X,130)
title('ʹ�ú���[imnoise2]�����ĸ�˹���ݵ�ֱ��ͼ')
% axis([0 300 0 140])
axis tight

%% ��ģ��ʹ�÷��� P114
clc
clear

f = imread('..\Pictures\images_ch05\Fig0504(a)(noisy_image).tif');
imshow(f)

[B,c,r] = roipoly(f);
roi = f(B);

size_f = size(f)
class_f = class(f)
size_B = size(B)
class_B = class(B)
size_roi = size(roi) % ������


%% ��5.5 spfilt �ռ������˲���
clc
clear
f = imread('..\Pictures\images_ch05\Fig0318(a)(ckt-board-orig).tif');
imshowMy(f)
title('ԭʼͼ��')

[M,N] = size(f);
R = imnoise2('salt & pepper',M,N,0.1,0);
c = find(R == 0);
gp = f;
gp(c) = 0;
imshowMy(gp)
title('������Ϊ0.1�ĺ���������Ⱦ��ͼ��')

R = imnoise2('salt & pepper',M,N,0,0.1);
c = find(R == 1);
gs = f;
gs(c) = 255;
imshowMy(gs)
title('������Ϊ0.1������������Ⱦ��ͼ��')

fp = spfilt(gp,'chmean',3,3,1.5);
imshowMy(fp)
title('�ý�ΪQ=1.5��3*3�������˲�����[������Ϊ0.1�ĺ���������Ⱦ��ͼ��]�˲��Ľ��')

fs = spfilt(gs,'chmean',3,3,-1.5);
imshowMy(fs)
title('�ý�ΪQ=-1.5��3*3�������˲�����[������Ϊ0.1������������Ⱦ��ͼ��]�˲��Ľ��')

fpmax = spfilt(gp,'max',3,3);
imshowMy(fpmax)
title('��3*3����˲�����[������Ϊ0.1�ĺ���������Ⱦ��ͼ��]�˲��Ľ��')

fsmin = spfilt(gs,'min',3,3);
imshowMy(fsmin)
title('��3*3��С�˲�����[������Ϊ0.1������������Ⱦ��ͼ��]�˲��Ľ��')




%% ��5.6 ����Ӧ��ֵ�˲� adpmedian
clc
clear
f = imread('..\Pictures\images_ch05\Fig0318(a)(ckt-board-orig).tif');
imshowMy(f)
title('ԭʼͼ��')

g = imnoise(f,'salt & pepper',0.25);% �������к��а�
imshowMy(g)
title('������Ϊ0.25����������Ⱦ��ͼ��')

f1 = medfilt2(g,[7 7],'symmetric');
imshowMy(f1)
title('��7*7��ֵ�˲�����[������Ϊ0.25����������Ⱦ��ͼ��]�˲��Ľ��')

f2 = adpmedian(g,7);
imshowMy(f2)
title('��Smax=7������Ӧ��ֵ�˲�����[������Ϊ0.25����������Ⱦ��ͼ��]�˲��Ľ��')

%% ��5.7 ģ������ͼ��ģ fspecial imfilter pixeldup
clc
clear

f = checkerboard(8);
imshowMy(f)
title('ԭʼͼ��')

PSF = fspecial('motion',7,45);  % sum(PSF(:)) = 1
gb = imfilter(f,PSF,'circular');
imshowMy(gb)
title('ʹ�� PSF = fspecial(motion,7,45) ģ�����ͼ��')

noise = imnoise(zeros(size(f)),'gaussian',0,0.001);
imshowMy(noise,[])
title('��˹������ͼ��')

g = gb + noise;
imshowMy(g,[])
title('ģ����������ͼ��')

% imshowMy(pixeldup(f,8),[])


%% ��5.8 ʹ�� deconvwnr ������ԭģ������ͼ��
clc
clear

f = checkerboard(8);
% imshowMy(f)

PSF = fspecial('motion',7,45)
gb = imfilter(f,PSF,'circular');
% imshowMy(gb)

noise = imnoise(zeros(size(f)),'gaussian',0,0.001);
% imshowMy(noise,[])

g = gb + noise;
imshowMy(g,[])
title('ģ����������ͼ��')
% ***************

fr1 = deconvwnr(g,PSF);
imshowMy(fr1,[])
title('�򵥵�ά���˲������˲�����Ľ��')

Sn = abs(fft2(noise)).^2;
nA = sum(Sn(:))/prod(size(noise));
Sf = abs(fft2(f)).^2;
fA = sum(Sf(:))/prod(size(f));
R = nA/fA;

fr2 = deconvwnr(g,PSF,R);
imshowMy(fr2,[])
title('ʹ�ó������ʵ�ά���˲���Ľ��')

NCORR = fftshift(real(ifft(Sn)));
ICORR = fftshift(real(ifft(Sf)));
fr3 = deconvwnr(g,PSF,NCORR,ICORR);
imshowMy(fr3,[])
title('ʹ������غ�����ά���˲���Ľ��')

% imshowMy(pixeldup(fr3,8))
%% ��5.8  ��ģ������������ʱʹ��ά���˲���ԭ
clc
clear

f = checkerboard(8);
imshowMy(f)

PSF = fspecial('motion',7,45)
gb = imfilter(f,PSF,'circular');
imshowMy(gb)

% ***************
g = gb;

fr1 = deconvwnr(g,PSF);
imshowMy(fr1,[])

% Sn = abs(fft2(noise)).^2;
% nA = sum(Sn(:))/prod(size(noise));
% Sf = abs(fft2(f)).^2;
% fA = sum(Sf(:))/prod(size(f));
% R = nA/fA;
% 
% fr2 = deconvwnr(g,PSF,R);
% imshowMy(fr2,[])
% 
% NCORR = fftshift(real(ifft(Sn)));
% ICORR = fftshift(real(ifft(Sf)));
% fr3 = deconvwnr(g,PSF,NCORR,ICORR);
% imshowMy(fr3,[])


%% ��5.9 Լ������С���˷��������˲�deconvreg
clc
clear
f = checkerboard(8);
% imshowMy(f)

PSF = fspecial('motion',7,45)
gb = imfilter(f,PSF,'circular');
% imshowMy(gb)

noise = imnoise(zeros(size(f)),'gaussian',0,0.001);
% imshowMy(noise,[])

g = gb + noise;
imshowMy(g,[])
title('ģ����������ͼ��')
% **************


fr1 = deconvreg(g,PSF,4);
imshowMy(fr1,[])
title('ʹ�� fr1 = deconvreg(g,PSF,4) �����˲���Ľ��')

fr2 = deconvreg(g,PSF,0.4,[1e-7 1e7]);
imshowMy(fr2,[])
title('ʹ�� fr2 = deconvreg(g,PSF,0.4,[1e-7 1e7]) �����˲���Ľ��')

% imshowMy(pixeldup(fr2,8))
%% ��5.10 ʹ��L-R �㷨�ĵ��������Ը�ԭ deconvlucy ������һ�ַ����Ը�ԭ�㷨��
clc
clear

f = checkerboard(8);
% imshow(f)
imshowMy(pixeldup(f,8))
title('ԭʼͼ��')

PSF = fspecial('gaussian',7,10)

SD = 0.01;
g = imnoise(imfilter(f,PSF),'gaussian',0,SD^2);
imshowMy(pixeldup(g,8))
title('ģ����������ͼ��')

DAMPAR = 10*SD;

LIM = ceil(size(PSF,1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;

% ------------

NUMIT = 5;
f5 = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(f5,8))
title('ʹ��L-R �㷨�ĵ�������Ϊ5�ķ����Ը�ԭ���ͼ��')

NUMIT = 10;
f10 = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(f10,8))
title('ʹ��L-R �㷨�ĵ�������Ϊ10�ķ����Ը�ԭ���ͼ��')

NUMIT = 20;
f20 = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(f20,8))
title('ʹ��L-R �㷨�ĵ�������Ϊ20�ķ����Ը�ԭ���ͼ��')

NUMIT = 100;
f100 = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(f100,8))
title('ʹ��L-R �㷨�ĵ�������Ϊ100�ķ����Ը�ԭ���ͼ��')

NUMIT = 1000;
f1000 = deconvlucy(g,PSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(f1000,8))
title('ʹ��L-R �㷨�ĵ�������Ϊ1000�ķ����Ը�ԭ���ͼ��')

%% ��5.11 äȥ��� ����PSF deconvblind
clc
clear

PSF = fspecial('gaussian',7,10)
imshowMy(pixeldup(PSF,73),[])
title('ԭʼPSFͼ��')

f = checkerboard(8);
SD = 0.01;
g = imnoise(imfilter(f,PSF),'gaussian',0,SD^2);

INITPSF = ones(size(PSF)); % ��ʼֵ(�ߴ��С��ԭʼPSFһ��)

DAMPAR = 10*SD;
LIM = ceil(size(PSF,1)/2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1:end - LIM, LIM + 1:end - LIM) = 1;

NUMIT = 5;
[fr PSFe] = deconvblind(g,INITPSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(PSFe,73),[])
title('ʹ��äȥ�������PSF����5�κ�Ľ��')

NUMIT = 10;
[fr PSFe] = deconvblind(g,INITPSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(PSFe,73),[])
title('ʹ��äȥ�������PSF����10�κ�Ľ��')

NUMIT = 20;
[fr PSFe] = deconvblind(g,INITPSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(PSFe,73),[])
title('ʹ��äȥ�������PSF����20�κ�Ľ��')

NUMIT = 50; % ���ǵ�������Խ��Խ�ã�����
[fr PSFe] = deconvblind(g,INITPSF,NUMIT,DAMPAR,WEIGHT);
imshowMy(pixeldup(PSFe,73),[])
title('ʹ��äȥ�������PSF����50�κ�Ľ��')

%% ��5.12  vistformfwd
clc
clear

T1 = [3 0 0; 0 2 0; 0 0 1];
tform1 = maketform('affine',T1);
vistformfwd(tform1,[0 100],[0 100]);

T2 = [1 0 0; 0.2 1 0; 0 0 1];
tform2 = maketform('affine',T2);
figure,vistformfwd(tform2,[0 100],[0 100]);

Tscale = [1.5 0 0; 0 2 0; 0 0 1];
Trotation = [cos(pi/4) sin(pi/4) 0
            -sin(pi/4) cos(pi/4) 0
            0 0 1];
Tshear = [1 0 0; 0.2 1 0; 0 0 1];
T3 = Tscale * Trotation * Tshear;
tform3 = maketform('affine',T3);
figure,vistformfwd(tform3,[0 100],[0 100]);
        
            
%% ��5.12  vistformfwd
clc
clear

Tscale = [1.5 0 0; 0 2 0; 0 0 1];
Trotation = [cos(pi/4) sin(pi/4) 0
            -sin(pi/4) cos(pi/4) 0
            0 0 1];

T1 = Tscale * Trotation;
tform1 = maketform('affine',T1);
figure,vistformfwd(tform1,[0 100],[0 100]);

Tscale = [1.5 0 0; 0 2 0; 0 0 1];
Trotation = [cos(pi/4) sin(pi/4) 0
            -sin(pi/4) cos(pi/4) 0
            0 0 1];
Tshear = [1 0 0; 0.2 1 0; 0 0 1];
T3 = Tscale * Trotation * Tshear;
tform3 = maketform('affine',T3);
figure,vistformfwd(tform3,[0 100],[0 100]);
%% ��5.13 ͼ��ռ�任
clc
clear

f = checkerboard(50);
imshowMy(f,[])

s = 1;
theta = pi/6;
T = [s*cos(theta) s*sin(theta) 0
            -s*sin(theta) s*cos(theta) 0
            0 0 1];
tform = maketform('affine',T);
g = imtransform(f,tform);
imshowMy(g,[])

g2 = imtransform(f,tform,'nearest');
imshowMy(g2,[])

g3 = imtransform(f,tform,'FillValue',0.5);
imshowMy(g3,[])

T2 = [1 0 0; 0 1 0; 50 50 1];
tform2 = maketform('affine',T2);
g4 = imtransform(f,tform2);
% imshowMy(g4,[])

g5 = imtransform(f,tform2,'XData',[1 500],'YData',[1 500],...
                 'FillValue',0.5);
imshowMy(g5,[])



%% cpselect ??? cp2tform
clc
clear

g = imread('..\Pictures\images_ch05\Fig0515(a)(base-with-control-points).tif');
imshowMy(g)

basepoints = [83 81; 450 56 ; 43 293; 249 392; 436 442];
inputpoints = [68 66; 375 47 ; 42 286 ;275 434; 523 532];

tform = cp2tform(inputpoints, basepoints, 'projective');
gp = imtransform(g,tform,'XData', [1 502],'YData',[1 502]);

imshowMy(gp)




%% ����һЩ�����ܽ�

��������Ѿ���������ͼ���׵�֪ʶ���㹻���˽��ǰ���¡�Wiener �˲����Ҫ�õöࡣ
���û����Щ��Ϣ�����á�Լ������С���˷������򣩡��˲����� Wiener�˲� �������Ч������P130��



%% 
clc
clear

����������Ǩ����ң�д˼� 
      --- ��� 

��価�ӹ��䣬�ŵ��������Ϫ[1]�� 
�Ҽĳ��������£����ֱ��ҹ����[2]�� 




