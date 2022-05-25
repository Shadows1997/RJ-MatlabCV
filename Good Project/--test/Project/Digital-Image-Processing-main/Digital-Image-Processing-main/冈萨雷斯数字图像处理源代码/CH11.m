%% ��ʮһ�� ��ʾ������

%% ��11.1
clc
clear

f = imread('..\Pictures\images_ch11\Fig1102(a)(noisy_circular_stroke).tif');
imshowMy(f)
title('ԭʼͼ��')

G{1} = size(f);
G{2} = mean2(f);
G{3} = mean(f, 2);
G{4} = mean(f, 1);

G
G(3)
G{3}

%% ��11.2
clc
clear

f = imread('..\Pictures\images_ch11\Fig1102(a)(noisy_circular_stroke).tif');
imshowMy(f)
title('ԭʼͼ��')

s.dim = size(f);
s.AI = mean2(f);
s.AIrows = mean(f, 2);
s.AIcols = mean(f, 1);

s
s.AIcols

%% ��11.3 Freeman ���뼰��ĳЩ����
clc
clear
f = imread('..\Pictures\images_ch11\Fig1102(a)(noisy_circular_stroke).tif');
imshowMy(f)
title('ԭʼͼ��')

h = fspecial('average',9);
g = imfilter(f,h,'replicate');
imshowMy(g)

g = im2bw(g,0.5);
imshowMy(g)

B = boundaries(g);

d = cellfun('length',B);
[max_d,k] = max(d);
b = B{1};

[M,N] = size(g); % ע�� : �����������ı߽�, �߽粢û�жϿ�, �϶�һ�±��������
g = bound2im(b,M,N,min(b(:,1)),min(b(:,2))); % g = bound2im(b,M,N,min(b(:,1)),2*min(b(:,2))); ��һ����:)
imshowMy(g)

[s,su] = bsubsamp(b,50);

g2 = bound2im(s,M,N,min(s(:,1)),min(s(:,2)));
imshowMy(g2)

cn = connectpoly(s(:,1),s(:,2));
g2 = bound2im(cn,M,N,min(cn(:,1)),min(cn(:,2)));
imshowMy(g2)

c = fchcode(su)



%% ��11.4 �����Ҳ������У�
clc
clear
B = imread('..\Pictures\images_ch11\Fig1107(a)(mapleleaf).tif');
B = imresize(B, 256/size(B,1));
imshowMy(B)
title('ԭʼͼ��')

B = bwperim(B, 8);
imshowMy(B)

Q = qtdecomp(B, 0, 2);
imshowMy(B)

BF = qtgetblk(B,Q,2);
imshowMy(BF)

R = imfill(BF, 'holes') & ~BF;
imshowMy(R)

b = boundaries(b, 4, 'cw');
b = b{1};

%% ��11.5 minperpoly
clc
clear
B = imread('..\Pictures\images_ch11\Fig1107(a)(mapleleaf).tif');
imshowMy(B)
title('ԭʼͼ��')

b = boundaries(B,4,'cw');
b = b{1};
[M,N] = size(B);
xmin = min(b(:,1));
ymin = min(b(:,2));
bim = bound2im(b,M,N,xmin,ymin);
imshowMy(bim)

[x,y] = minperpoly(B,2);
b2 = connectpoly(x,y);
B2 = bound2im(b2,M,N,xmin,ymin);
imshowMy(B2)

[x,y] = minperpoly(B,3);
b2 = connectpoly(x,y);
B2 = bound2im(b2,M,N,xmin,ymin);
imshowMy(B2)

[x,y] = minperpoly(B,4);
b2 = connectpoly(x,y);
B2 = bound2im(b2,M,N,xmin,ymin);
imshowMy(B2)

[x,y] = minperpoly(B,8);
b2 = connectpoly(x,y);
B2 = bound2im(b2,M,N,xmin,ymin);
imshowMy(B2)

[x,y] = minperpoly(B,16);
b2 = connectpoly(x,y);
B2 = bound2im(b2,M,N,xmin,ymin);
imshowMy(B2)
%% ��11.6 �����Ҳ������У�
clc
clear

bs = imread('..\Pictures\images_ch11\Fig1111(a)(boundary_sq.tif');
[st, angle, x0, y0] = signature(bs);
plotMy(angle, st)




%% ��11.7 ����һ������Ĺ���
clc
clear
f = imread('..\Pictures\images_ch11\Fig1113(a)(chromo_original).tif');
imshowMy(f)
title('ԭʼͼ��')

f = im2double(f);
h = fspecial('gaussian',25,15);
g = imfilter(f,h,'replicate');
imshowMy(g)

g = im2bw(g,1.5*graythresh(g));
imshowMy(g)

s = bwmorph(g,'skel',Inf);
imshowMy(s)
s1 = bwmorph(s,'spur',8);
imshowMy(s1)


%% ��11.8 ����Ҷ�����
clc
clear
f = imread('..\Pictures\images_ch11\Fig1116(a)(chromo_binary).tif');
imshowMy(f)
title('ԭʼͼ��')

b = boundaries(f);
b = b{1};
bim = bound2im(b,344,270);
imshowMy(bim)

z = frdescp(b);
z546 = ifrdescp(z,546);
z546im = bound2im(z546,344,270);
imshowMy(z546im)

z8 = ifrdescp(z,8);
z8im = bound2im(z8,344,270);
imshowMy(z8im)




%% ��11.9 ��������� �����ڵĸ�����ͨ������ regionprops
clc
clear

B =  [1     1     1     0     0     0     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     0     0     0     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     1     1     0
      1     1     1     0     0     0     0     0];

B = bwlabel(B);
D = regionprops(B,'area','boundingbox'); %

w = [D.Area];
NR = length(w);

V = cat(1,D.BoundingBox); % ������� 0.5 ��ͷ




%% ��11.10 ͳ��������� statxture
clc
clear

close
A = imread('..\Pictures\images_ch11\Fig1119(a)(superconductor-with-window).tif');
% imshowMy(A)
% title('ƽ��ͼ��')
sA = imhistInteractiveMy(A);
statxture(sA)

close
B = imread('..\Pictures\images_ch11\Fig1119(b)(cholesterol-with-window).tif');
% imshowMy(B)
% title('�ֲ�ͼ��')
sB = imhistInteractiveMy(B);
statxture(sB)

close
C = imread('..\Pictures\images_ch11\Fig1119(c)(microporcessor-with-window).tif');
% imshowMy(C)
% title('����ͼ��')
sC = imhistInteractiveMy(C);
statxture(sC)




%% ��11.11 ����Ƶ������ specxture
clc
clear

A = imread('..\Pictures\images_ch11\Fig1121(a)(random_matches).tif');
imshowMy(A)

[srada, sanga, Sa] = specxture(A);

imshowMy(Sa)
figure, plot(srada)
figure, plot(sanga)



%% ��11.12 ����� ʵ��ͼ�����ҶԻ�
clc
clear
f = imread('..\Pictures\images_ch11\Fig1123(a)(Original_Padded_to_568_by_568).tif');
imshowMy(f)
title('ԭʼͼ��')

fp = padarray(f,[84 84],'both');
imshowMy(fp)

fhs = f(1:2:end,1:2:end);
imshowMy(fhs)

fhsp = padarray(fhs,[84 84],'both');
imshowMy(fhsp)

fm = fliplr(f);
fmp = padarray(fm,[84 84],'both');
imshowMy(fmp)
% g = imrotate(f,angle,method,'crop')

fr2 = imrotate(f,2,'bilinear');
imshowMy(fr2)
fr2p = padarray(fr2,[76 76],'both');
imshowMy(fr2p)
fr45 = imrotate(f,45,'bilinear');
imshowMy(fr45)

phiorig = abs(log(invmoments(f)));
phihalf = abs(log(invmoments(fhs)));
phimirror = abs(log(invmoments(fm)));
phirot2 = abs(log(invmoments(fr2)));
phirot45 = abs(log(invmoments(fr45)));


%% ��11.13 P.Y ��ʾ���
clc
clear
f1 = imread('..\Pictures\images_ch11\Fig1125(a)(WashingtonDC_Band1_512).tif');
imshowMy(f1, [])
f2 = imread('..\Pictures\images_ch11\Fig1125(b)(WashingtonDC_Band2_512).tif');
imshowMy(f2, [])
f3 = imread('..\Pictures\images_ch11\Fig1125(c)(WashingtonDC_Band3_512).tif');
f4 = imread('..\Pictures\images_ch11\Fig1125(d)(WashingtonDC_Band4_512).tif');
f5 = imread('..\Pictures\images_ch11\Fig1125(e)(WashingtonDC_Band5_512).tif');
f6 = imread('..\Pictures\images_ch11\Fig1125(f)(WashingtonDC_Band6_512).tif');

S = cat(3, f1, f2, f3, f4, f5, f6);

[X, R] = imstack2vectors(S);
P = princomp(X, 6);

g1 = P.Y(:, 1);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 2);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 3);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 4);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 5);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 6);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

%% ��11.13 P.Y ��ʾ��� ȡ Q=2 ??? �޷�ִ��
clc
clear
f1 = imread('..\Pictures\images_ch11\Fig1125(a)(WashingtonDC_Band1_512).tif');
imshowMy(f1, [])
f2 = imread('..\Pictures\images_ch11\Fig1125(b)(WashingtonDC_Band2_512).tif');
imshowMy(f2, [])
f3 = imread('..\Pictures\images_ch11\Fig1125(c)(WashingtonDC_Band3_512).tif');
f4 = imread('..\Pictures\images_ch11\Fig1125(d)(WashingtonDC_Band4_512).tif');
f5 = imread('..\Pictures\images_ch11\Fig1125(e)(WashingtonDC_Band5_512).tif');
f6 = imread('..\Pictures\images_ch11\Fig1125(f)(WashingtonDC_Band6_512).tif');

S = cat(3, f1, f2, f3, f4, f5, f6);

[X, R] = imstack2vectors(S);
P = princomp(X, 2);

g1 = P.Y(:, 1);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 2);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 3);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 4);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 5);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.Y(:, 6);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

%% P.X ��ʲô��
clc
clear

f1 = imread('..\Pictures\images_ch11\Fig1125(a)(WashingtonDC_Band1_512).tif');
imshowMy(f1, [])
f2 = imread('..\Pictures\images_ch11\Fig1125(b)(WashingtonDC_Band2_512).tif');
imshowMy(f2, [])
f3 = imread('..\Pictures\images_ch11\Fig1125(c)(WashingtonDC_Band3_512).tif');
f4 = imread('..\Pictures\images_ch11\Fig1125(d)(WashingtonDC_Band4_512).tif');
f5 = imread('..\Pictures\images_ch11\Fig1125(e)(WashingtonDC_Band5_512).tif');
f6 = imread('..\Pictures\images_ch11\Fig1125(f)(WashingtonDC_Band6_512).tif');

S = cat(3, f1, f2, f3, f4, f5, f6);

[X, R] = imstack2vectors(S);
P = princomp(X, 6);

g1 = P.X(:, 1);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.X(:, 2);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.X(:, 3);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.X(:, 4);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.X(:, 5);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])

g1 = P.X(:, 6);
g1 = reshape(g1, 512, 512);
imshowMy(g1, [])



%% 
clc
clear






%% 
clc
clear






