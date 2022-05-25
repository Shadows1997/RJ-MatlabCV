%% ������ ��ɫͼ����

%% rgbcube patch
clc
clear
rgbcube(-10,-10,4)
title('RGB ������')


%% imapprox �ý��ٵ���ɫ������һ������ͼ��
clc
clear
[X, map] = imread('trees.tif'); % max(X(:)) = 127
imshowMy(X, map)
title('ԭʼ������ɫͼ��128ɫ��')
imfinfoMy(X)

[Y, newmap] = imapprox(X, map, 64);
imshowMy(Y, newmap)
title('����ͼ��64ɫ��')
imfinfoMy(Y)

[Y, newmap] = imapprox(X, map, 32);
imshowMy(Y, newmap)
title('����ͼ��32ɫ��')

[Y, newmap] = imapprox(X, map, 16);
imshowMy(Y, newmap)
title('����ͼ��16ɫ��')

[Y, newmap] = imapprox(X, map, 8);
imshowMy(Y, newmap)
title('����ͼ��8ɫ��')

[Y, newmap] = imapprox(X, map, 4);
imshowMy(Y, newmap)
title('����ͼ��4ɫ��')

[Y, newmap] = imapprox(X, map, 2);
imshowMy(Y, newmap)
title('����ͼ��2ɫ�����Ǻڰף�')


%% dither
clc
clear
RGB  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(RGB)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

BW = dither(rgb2gray(RGB));
imshowMy(BW)

GRAY = rgb2gray(RGB);
imshowMy(GRAY)
title('�Ҷ�[����]��256ɫ��ͼ��')

%% dither
clc
clear
RGB  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(RGB)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

[IND map] = rgb2ind(RGB,256);
imshow(IND, map)
X = dither(RGB,map);
imview(X)

%% dither
clc
clear
RGB  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');

X = dither(RGB,jet(256));
imview(X)


%% dither
clc
clear
I = imread('cameraman.tif');
BW = dither(I);
imview(BW)

%% grayslice
clc
clear

I = imread('snowflakes.png');
imshowMy(I)
title('ԭʼ�Ҷȣ�256ɫ��ͼ��')

X = grayslice(I,16);
imshowMy(X,jet(16))

%% ind2gray
clc
clear
load trees
I = ind2gray(X,map);   % max(X(:))=128
imshowMy(X,map)
title('ԭʼ����ͼ��')

imshowMy(I)    % max(I(:))=1
title('����ͼ��ת��Ϊ�Ҷ�ͼ��')

%% rgb2ind
clc
clear
RGB = imread('peppers.png');
imshowMy(RGB)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

[X,map] = rgb2ind(RGB,128);
imshowMy(X,map)
title('��ɫͼ��ת��Ϊ����ͼ��')

%% ind2rgb 
clc
clear
RGB = imread('peppers.png');
imshowMy(RGB)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

[X,map] = rgb2ind(RGB,64); % max(RGB(:))=255
imshowMy(X,map)
RGB1 = ind2rgb(X,map); % max(RGB1(:))=0.9961
imshowMy(RGB1)

%% �� 6.1
clc
clear

RGB  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(RGB)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

[X1, map1] = rgb2ind(RGB, 8, 'nodither');
imview(X1, map1)
% title('��ɫ��Ϊ��8ɫ���޶�������������ͼ��')

[X2, map2] = rgb2ind(RGB, 8, 'dither');
imview(X2, map2)
% title('��ɫ��Ϊ��8ɫ�����ö�������������ͼ��')

I = rgb2gray(RGB);
imshowMy(I)
title('�Ҷ�[����]��256ɫ��ͼ��')

I1 = dither(I);
imview(I1)
% title('���ö��������ĻҶ�ͼ������һ����ֵͼ��')


%% rgb2ntsc
clc
clear
RGB = imread('board.tif');
imshowMy(RGB)

NTSC = rgb2ntsc(RGB);
imshowMy(NTSC)

RGB2 = ntsc2rgb(NTSC);
imshowMy(RGB2)

%% rgb2ycbcr
clc
clear
rgb = imread('board.tif');
imshowMy(rgb)

ycbcr = rgb2ycbcr(rgb);
imshowMy(ycbcr)

rgb2 = ycbcr2rgb(ycbcr);


%% rgb2hsv
clc
clear


%% imcomplement
clc
clear
RGB  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
J = imcomplement(RGB);
imview(RGB), imview(J)


%% rgb2hsi
clc
clear


%% interp1q
clc
clear
z = interp1q([7 255]',[5 255]',[0:275]')

%% spline
clc
clear
x = 0:10;
y = sin(x);
subplot(121),plot(x,y,'o',x,y)
xx = 0:.25:10;
yy = spline(x,y,xx);
subplot(122),plot(x,y,'o',xx,yy)


%% ice
clc
clear
f  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
g = ice('image', f);


%% ice grayscale
clc
clear
info = imfinfo('..\Pictures\images_ch06\Fig0616(a)(Weld Original).tif')
f  = imread('..\Pictures\images_ch06\Fig0616(a)(Weld Original).tif');
g = ice('image', f);

%% 
clc
clear
info = imfinfo('..\Pictures\images_ch06\Fig0616(a)(Weld Original).tif')
f  = imread('..\Pictures\images_ch06\Fig0616(a)(Weld Original).tif');
g = ice('image', f);

%% 
clc
clear

info = imfinfo('..\Pictures\images_ch06\Fig0617(a)(JLK Magenta).tif')
f  = imread('..\Pictures\images_ch06\Fig0617(a)(JLK Magenta).tif');
g = ice('image', f, 'space', 'CMY');

%% 
clc
clear
info = imfinfo('..\Pictures\images_ch06\Fig0618(a)(Caster Original).tif')
f  = imread('..\Pictures\images_ch06\Fig0618(a)(Caster Original).tif');
g = ice('image', f, 'space', 'hsi');

%% 
clc
clear










%% ��6.8 ��ɫͼ��ƽ�� ��ִ���ٶȽ�����
clc
clear
fc  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(fc)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

fr = fc(:,:,1);
fg = fc(:,:,2);
fb = fc(:,:,3);

% imshowMy(fr)
% title('��ɫ����ͼ��')
% imshowMy(fg)
% title('��ɫ����ͼ��')
% imshowMy(fb)
% title('��ɫ����ͼ��')

h = rgb2hsi(fc);
H = h(:,:,1);
S = h(:,:,2);
I = h(:,:,3);

% imshowMy(H)
% title('ɫ������ͼ��')
% imshowMy(S)
% title('���Ͷȷ���ͼ��')
% imshowMy(I)
% title('���ȷ���ͼ��')

w = fspecial('average',15);
I_filtered = imfilter(I,w,'replicate');
h = cat(3,H,S,I_filtered);
f = hsi2rgb(h);
f = min(f,1);
imshowMy(f)
title('��ƽ��HSIͼ������ȷ������õ���RGBͼ��')

fc_filtered = imfilter(fc,w,'replicate');
imshowMy(fc_filtered)
title('�ֱ�ƽ��R��G��Bͼ�����ƽ��õ���RGBͼ��')

h_filtered = imfilter(h,w,'replicate');
f = hsi2rgb(h_filtered);
f = min(f,1);
imshowMy(f)
title('�ֱ�ƽ��H��S��Iͼ�����ƽ��õ���RGBͼ��')

h_filtered = imfilter(h,w,'replicate');
imshowMy(h_filtered)
title('�ֱ�ƽ��H��S��Iͼ�����ƽ��õ���HSIͼ��')

%% ��6.9 ��ɫͼ����
clc
clear
fc  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(fc)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

w = fspecial('average',15);
fc_filtered = imfilter(fc,w,'replicate');
imshowMy(fc_filtered)
title('�ֱ�ƽ��R��G��Bͼ�����ƽ��õ���RGBģ��ͼ��')

lapmask = [1 1 1; 1 -8 1; 1 1 1];

fen = imsubtract(fc_filtered,imfilter(fc_filtered,lapmask,'replicate'));
imshowMy(fen)
title('��������˹������ǿģ��ͼ��Ч�������Ǻ����ԣ���')

LPA = imfilter(fc,lapmask,'replicate');
imshowMy(LPA)
title('��ԭʼ���ɫͼ����������˹������ȡ����ͼ��')

fen = imsubtract(fc,imfilter(fc,lapmask,'replicate'));
imshowMy(fen)
title('��������˹������ǿԭʼ���ɫͼ�񣨲�����߱�Ե�����ֶΣ�')

%% ��6.10 �ú���colorgrad����RGB��Ե��� ͼ6.24
clc
clear
f  = imread('..\Pictures\images_ch06\Fig0624(d)(RGB2-fullcolor).tif');
imshowMy(f)
title('ԭʼ��ɫͼ��')

[VG, A, PPG] = colorgrad(f);

imshowMy(VG) % max(VG(:)) = 1
title('��RGB�����ռ������ݶȣ��Ҷȣ�ͼ��')

imshowMy(PPG) % max(PPG(:)) = 1
title('�ֱ����R��G��Bͼ�����ƽ���ݶȲ��������ӵõ��ĺϳ��ݶȣ��Ҷȣ�ͼ��')

imshowMy(abs(VG - PPG),[])
title('���������ݶȼ��㷽ʽ�ľ��Բ�Ҷȣ�ͼ����չ��[ �� �� ]���������ı���ֵ��')

%% ��6.10 �ú���colorgrad����RGB��Ե��� ͼ6.25
clc
clear
f  = imread('..\Pictures\images_ch06\Fig0619(a)(RGB_iris).tif');
imshowMy(f)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

[VG, A, PPG] = colorgrad(f);

imshowMy(VG) % max(VG(:)) = 1
title('��RGB�����ռ������ݶȣ��Ҷȣ�ͼ��')

imshowMy(PPG) % max(PPG(:)) = 1
title('�ֱ����R��G��Bͼ�����ƽ���ݶȲ��������ӵõ��ĺϳ��ݶȣ��Ҷȣ�ͼ��')

imshowMy(abs(VG - PPG),[])
title('���������ݶȼ��㷽ʽ�ľ��Բ�Ҷȣ�ͼ����չ��[ �� �� ]���������ı���ֵ��')

%% ��6.11 ��ɫRGBͼ��ָ� ����ѡ�������
clc
clear

f = imread('..\Pictures\images_ch06\Fig0627(a)(jupitermoon_original).tif');
imshowMy(f)
title('ԭʼ���ɫ��256*256*256ɫ��ͼ��')

figure,mask = roipoly(f);
title('����ѡ�������')
red = immultiply(mask,f(:,:,1));
green = immultiply(mask,f(:,:,2));
blue = immultiply(mask,f(:,:,3));
g = cat(3,red,green,blue);
imshowMy(g)


[M,N,K] = size(g);
I = reshape(g,M*N,3);
idx = find(mask);
I = double(I(idx,1:3));
[C,m] = covmatrix(I);

d = diag(C);
sd = sqrt(d)'

E25 = colorseg('euclidean',f,25,m);
imshowMy(E25)
title('ʹ��Բ���巽ʽ�������� [ colorseg(euclidean,f,25,m) ] �õ��ķָ�')

E50 = colorseg('euclidean',f,50,m);
imshowMy(E50)
title('ʹ��Բ���巽ʽ�������� [ colorseg(euclidean,f,50,m) ] �õ��ķָ�')

E75 = colorseg('euclidean',f,75,m);
imshowMy(E75)
title('ʹ��Բ���巽ʽ�������� [ colorseg(euclidean,f,75,m) ] �õ��ķָ�')

E100 = colorseg('euclidean',f,100,m);
imshowMy(E100)
title('ʹ��Բ���巽ʽ�������� [ colorseg(euclidean,f,100,m) ] �õ��ķָ�')

M25 = colorseg('mahalanobis',f,25,m,C);
imshowMy(M25)
title('ʹ����Բ���巽ʽ�������� [ colorseg(mahalanobis,f,25,m,C) ] �õ��ķָ�')

M50 = colorseg('mahalanobis',f,50,m,C);
imshowMy(M50)
title('ʹ����Բ���巽ʽ�������� [ colorseg(mahalanobis,f,50,m,C) ] �õ��ķָ�')

M75 = colorseg('mahalanobis',f,75,m,C);
imshowMy(M75)
title('ʹ����Բ���巽ʽ�������� [ colorseg(mahalanobis,f,75,m,C) ] �õ��ķָ�')

M100 = colorseg('mahalanobis',f,100,m,C);
imshowMy(M100)
title('ʹ����Բ���巽ʽ�������� [ colorseg(mahalanobis,f,100,m,C) ] �õ��ķָ�')

%% 
clc
clear


  ���ٽ��ɡ�
      -- ����

ҹ�������Ѹ��������·�������
���ױ�Ϣ��������
���Ŷ���Ӧ�������������� 

���޴�������У���ʱ��ȴӪӪ?
ҹ���羲�e��ƽ��
С�۴Ӵ��ţ������������� 






