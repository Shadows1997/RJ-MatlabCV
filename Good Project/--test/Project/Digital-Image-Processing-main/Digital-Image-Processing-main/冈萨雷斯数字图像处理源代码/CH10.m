%% ��ʮ�� ͼ��ָ�

%% ��10.1 ����
clc
clear
f = imread('..\Pictures\images_ch10\Fig1002(a)(test_pattern_with_single_pixel).tif');
imshowMy(f)
title('ԭʼͼ��')

w = [-1 -1 -1;
     -1  8 -1; 
     -1 -1 -1];
g = abs(imfilter(double(f),w));
% **** ��������ֵ�Ͷ�Ӧ����λ�� ********
[c1,i] = max(g);
[c2,j] = max(c1);
max_ans = g(i(j),j)      % ���ֵ
max_location = [i(j),j]  % ���ֵ����λ��
% **************************************
T = max(g(:));
g1 = g>=T/100;
g2 = g>=T;
% **** ��������ֵ�Ͷ�Ӧ����λ�� ********
[c1,i] = max(g);
[c2,j] = max(c1);
max_ans = g(i(j),j)      % ���ֵ
max_location = [i(j),j]  % ���ֵ����λ��
% **************************************
% figure,imshow(g)
imshowMy(g1)
title('���ý���ֵ[g>=T/100]���ͼ��')

imshowMy(g2)
title('���ý���ֵ[g>=T]���ͼ��')

%% ��10.1 �������г��� ordfilt2 һ������������
clc
clear
f = imread('..\Pictures\images_ch10\Fig1002(a)(test_pattern_with_single_pixel).tif');
imshowMy(f)
title('ԭʼͼ��')

m=3;
n=3;

g = imsubtract(ordfilt2(f, m*n, ones(m, n)), ordfilt2(f, 1, ones(m, n)));
T = max(g(:));
g2 = g>=T;
imshowMy(g2)

%% ��10.2 �߼��
clc
clear
f = imread('..\Pictures\images_ch10\Fig1004(a)(wirebond_mask).tif');
imshowMy(f)
title('ԭʼ������ģͼ��')

w = [2 -1 -1;
     -1 2 -1; 
     -1 -1 2];
g = imfilter(double(f),w);
imshowMy(g,[])
title('ʹ��[-45�ȣ���μ� P288��]�����������ͼ��')

gtop = g(1:120,1:120);
gtop = pixeldup(gtop,4);
imshowMy(gtop,[])
title('{ʹ��[-45�ȣ���μ� P288��]�����������ͼ��}���ϽǵķŴ�ͼ')

gbot = g(end-119:end,end-119:end);
gbot = pixeldup(gbot,4);
imshowMy(gbot,[])
title('{ʹ��[-45�ȣ���μ� P288��]�����������ͼ��}���½ǵķŴ�ͼ')

g = abs(g);
imshowMy(g,[])
title('{ʹ��[-45�ȣ���μ� P288��]�����������ͼ��}�ľ���ֵ')

T = max(g(:));
g = g>=T;
imshowMy(g)
title('��������[g>=T]�����е㣨��ɫ�㣩[����g����һ��ͼƬ]')

%% ��10.3 edge ��Ե��� sobel
clc
clear
f = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f)
title('ԭʼͼ��')

[gv1,tvertical] = edge(f,'sobel','vertical');
imshowMy(gv1)
tvertical
title('ʹ�ô����Զ�ȷ������ֵ��һ����ֱ[sobel]��ģ�󣬺���[edge]���µĽ��')

[gv1,thorizontal] = edge(f,'sobel','horizontal');
imshowMy(gv1)
thorizontal
title('ʹ�ô����Զ�ȷ������ֵ��һ��ˮƽ[sobel]��ģ�󣬺���[edge]���µĽ��')

gv2 = edge(f,'sobel',0.15,'vertical');
imshowMy(gv2)
title('ʹ��ָ����ֵ��һ����ֱ[sobel]��ģ�󣬺���[edge]���µĽ��')

gboth = edge(f,'sobel',0.15);
imshowMy(gboth)
title('ʹ��ָ����ֵ��һ��ͬʱ����ˮƽ��ֱ[sobel]��ģ�󣬺���[edge]���µĽ��')

[gboth,tboth] = edge(f,'sobel');
tboth
imshowMy(gboth)
title('ʹ���Զ���ֵ��һ��ͬʱ����ˮƽ��ֱ[sobel]��ģ�󣬺���[edge]���µĽ��')

w45 = [-2 -1 0; -1 0 1; 0 1 2];
g45 = imfilter(double(f),w45,'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45>=T;
imshowMy(g45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[45��]��Ե�Ľ��')

w_45 = [0 1 2; -1 0 1; -2 -1 0];
g_45 = imfilter(double(f),w_45,'replicate');
T = 0.3*max(abs(g_45(:)));
g_45 = g_45>=T;
imshowMy(g_45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[-45��]��Ե�Ľ��')

imshowMy(g45 + g_45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[-45��]+[45��]��Ե�Ľ��')

%% ��10.3 edge ��Ե��� prewitt
clc
clear
f = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f)
title('ԭʼͼ��')

[gv1,t] = edge(f,'prewitt','vertical');
imshowMy(gv1)
t
title('ʹ�ô����Զ�ȷ������ֵ��һ����ֱ[prewitt]��ģ�󣬺���[edge]���µĽ��')

gv2 = edge(f,'prewitt',0.15,'vertical');
imshowMy(gv2)
title('ʹ��ָ����ֵ��һ����ֱ[prewitt]��ģ�󣬺���[edge]���µĽ��')

gboth = edge(f,'prewitt',0.15);
imshowMy(gboth)
title('ʹ��ָ����ֵ��һ��ͬʱ����ˮƽ��ֱ[prewitt]��ģ�󣬺���[edge]���µĽ��')

w45 = [-2 -1 0; -1 0 1; 0 1 2]
g45 = imfilter(double(f),w45,'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45>=T;
imshowMy(g45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[45��]��Ե�Ľ��')

w_45 = [0 1 2; -1 0 1; -2 -1 0]
g_45 = imfilter(double(f),w_45,'replicate');
T = 0.3*max(abs(g_45(:)));
g_45 = g_45>=T;
imshowMy(g_45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[-45��]��Ե�Ľ��')

%% ��10.3 edge ��Ե��� roberts
clc
clear
f = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f)
title('ԭʼͼ��')

[gv1,t] = edge(f,'roberts','vertical');
imshowMy(gv1)
t
title('ʹ�ô����Զ�ȷ������ֵ��һ����ֱ[roberts]��ģ�󣬺���[edge]���µĽ��')

gv2 = edge(f,'roberts',0.15,'vertical');
imshowMy(gv2)
title('ʹ��ָ����ֵ��һ����ֱ[roberts]��ģ�󣬺���[edge]���µĽ��')

gboth = edge(f,'roberts',0.15);
imshowMy(gboth)
title('ʹ��ָ����ֵ��һ��ͬʱ����ˮƽ��ֱ[roberts]��ģ�󣬺���[edge]���µĽ��')

w45 = [-2 -1 0; -1 0 1; 0 1 2]
g45 = imfilter(double(f),w45,'replicate');
T = 0.3*max(abs(g45(:)));
g45 = g45>=T;
imshowMy(g45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[45��]��Ե�Ľ��')

w_45 = [0 1 2; -1 0 1; -2 -1 0]
g_45 = imfilter(double(f),w_45,'replicate');
T = 0.3*max(abs(g_45(:)));
g_45 = g_45>=T;
imshowMy(g_45)
title('ʹ�ú���[imfilter]������ָ������ģ����ֵ������[-45��]��Ե�Ľ��')

%% ��10.4 Sobel, LoG, Canny ��Ե������ıȽ�
clc
clear
f = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f)
title('ԭʼͼ��')

[g_sobel_default,ts] = edge(f,'sobel');
imshowMy(g_sobel_default)
title('[sobel]��Ե�����ʹ��Ĭ��ѡ������Ľ��')

[g_log_default,tlog] = edge(f,'log');
imshowMy(g_log_default)
title('[LoG]��Ե�����ʹ��Ĭ��ѡ������Ľ��')

[g_canny_default,tc] = edge(f,'canny');
imshowMy(g_canny_default)
title('[canny]��Ե�����ʹ��Ĭ��ѡ������Ľ��')

[g_sobel_best,ts] = edge(f,'sobel',0.05);
imshowMy(g_sobel_best)
title('[sobel]��Ե�����ʹ�� edge(f,sobel,0.05) �����Ľ��')

[g_log_best,tlog] = edge(f,'log',0.003,2.25);
imshowMy(g_log_best)
title('[LoG]��Ե�����ʹ�� edge(f,log,0.003,2.25) �����Ľ��')

[g_canny_best,tc] = edge(f,'canny',[0.04 0.10],1.5);
imshowMy(g_canny_best)
title('[canny]��Ե�����ʹ�� edge(f,canny,[0.04 0.10],1.5) �����Ľ��')

%% ��10.5 Hough �任
clc
clear
f = zeros(101,101);
f(1,1) = 1;
f(101,1) = 1;
f(1,101) = 1;
f(51,51) = 1;
f(101,101) = 1;
imshowMy(f)
title('���������Ķ�ֵͼ��')

H = hough(f);
imshowMy(H,[])
title('Hough �任')

[H,theta,rho] = hough(f);
imshowMy(theta,rho,H,[],'notruesize')
axis on, axis normal
xlabel('\theta'),ylabel('\rho')
title('���б����� Hough �任')

%% ��10.6 Hough�任 �߼������� hough houghpeaks houghlines
clc
clear
f1 = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f1)
title('ԭʼͼ��')

[f,tc] = edge(f1,'canny',[0.04 0.10],1.5);
imshowMy(f)
title('[canny]��Ե�����ʹ�� edge(f,canny,[0.04 0.10],1.5) �����Ľ��')

[H,theta,rho] = hough(f,0.5); %
imshowMy(theta,rho,H,[],'notruesize')
axis on, axis normal
xlabel('\theta'),ylabel('\rho')


[r,c] = houghpeaks(H,10);
hold on
plot(theta(c),rho(r),'linestyle','none',...
    'marker','s','color','w')
title('������ѡ10����ֵ��λ�õ� Hough �任')

lines = houghlines(f,theta,rho,r,c)
imshowMy(f),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

[H,theta,rho] = hough(f,0.5); %
imshowMy(theta,rho,H,[],'notruesize')
axis on, axis normal
xlabel('\theta'),ylabel('\rho')

[r,c] = houghpeaks(H,100,1);
hold on
plot(theta(c),rho(r),'linestyle','none',...
    'marker','s','color','w')
title('������ѡ100����ֵ��λ�õ� Hough �任')

lines = houghlines(f,theta,rho,r,c)
imshowMy(f),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

lines = houghlines(f,theta,rho,r,c)
imshowMy(zeros(size(f))),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

%% ��10.7 ����ȫ����ֵ graythresh
clc
clear
f = imread('..\Pictures\images_ch10\Fig1013(a)(scanned-text-grayscale).tif');
imshowMy(f)
title('ԭʼͼ��')
imhistMy(f)

T = 0.5*(double(min(f(:))) + double(max(f(:))));
done = false;
while ~done
    g = f>=T;
    Tnext = 0.5*(mean(f(g)) + mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end
T
g = f<=T;
imshowMy(g)
title('ʹ�õ��������õ�����ֵ������ͼ��')

T2 = graythresh(f)
g = f<=T2*255;
imshowMy(g)
title('ʹ�ú���[graythresh]�õ�����ֵ������ͼ��')

T2*255

%% bwlabel ��һ����ֵͼ���б�ע��ͨ����
clc
clear

BW = [1     1     1     0     0     0     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     1     1     0     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     0     1     0
      1     1     1     0     0     1     1     0
      1     1     1     0     0     0     0     0];

[L8,n8] = bwlabel(BW,8) % Ĭ��Ϊ 8 ��ͨ��: bwlabel(BW,8) == bwlabel(BW)

[L4,n4] = bwlabel(BW,4)

%% ��10.8 �������� regiongrow ����
clc
clear
f = imread('..\Pictures\images_ch10\Fig1006(a)(building).tif');
imshowMy(f)
title('ԭʼͼ��')

[g,NR,SI,TI] = regiongrow(f,100,10);

NR
imshowMy(SI) % ���������ӵ��ͼ��
title('���ӵ�ͼ��')

imshowMy(TI) % �����ھ�����ͨ�Դ���ǰͨ����ֵ���Ե�����
title('����[�������ӵ���ͨ�Դ���ǰ]ͨ����ֵ���Ե�����')

imshowMy(g)
title('����ͨ����ֵ���Ե������ڶ����ӵ����8��ͨ�Է�����Ľ��')

%% ��10.8 �������� regiongrow ���ӿ�϶
clc
clear
f = imread('..\Pictures\images_ch10\Fig1014(a)(defective_weld).tif');
imshowMy(f)
title('ԭʼͼ��')

[g,NR,SI,TI] = regiongrow(f,255,65);

NR
imshowMy(SI) % ���������ӵ��ͼ��
title('���ӵ�ͼ��')

imshowMy(TI) % �����ھ�����ͨ�Դ���ǰͨ����ֵ���Ե�����
title('����[�������ӵ���ͨ�Դ���ǰ]ͨ����ֵ���Ե�����')

imshowMy(g)
title('����ͨ����ֵ���Ե������ڶ����ӵ����8��ͨ�Է�����Ľ��')

%% qtdecomp ִ���Ĳ����ֽ�
clc
clear
I = imread('liftingbody.png');
S = qtdecomp(I,0.99);
blocks = repmat(uint8(0),size(S));

for dim = [512 256 128 64 32 16 8 4 2 1];    
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end

blocks(end,1:end) = 1;
blocks(1:end,end) = 1;

imshowMy(I)
title('ԭʼͼ��')

imshowMy(blocks,[])

imshowMy(I.*(1-blocks))

%% qtdecomp ִ���Ĳ����ֽ� �߽�ָ�
clc
clear
I = imread('liftingbody.png');
S = qtdecomp(I,0.09); % 0.09
blocks = repmat(uint8(0),size(S));

for dim = [1];    % ֻ���Ϊ 1*1
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end

blocks(end,1:end) = 1;
blocks(1:end,end) = 1;

imshowMy(I)
title('ԭʼͼ��')

imshowMy(blocks,[])

imshowMy(I.*(1-blocks))

%% qtdecomp ִ���Ĳ����ֽ� 
clc
clear
I = imread('liftingbody.png');
S = qtdecomp(I,0.19); % ����Ϊ 0.19
blocks = repmat(uint8(0),size(S));

for dim = [512 256 128 64 32 16 8 4 2 1];    
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end

blocks(end,1:end) = 1;
blocks(1:end,end) = 1;

imshowMy(I)
title('ԭʼͼ��')

imshowMy(blocks,[])

imshowMy(I.*(1-blocks))

%% qtdecomp qtgetblk
clc
clear
I = [1     1     1     1     2     3     6     6
     1     1     2     1     4     5     6     8
     1     1     1     1    10    15     7     7
     1     1     1     1    20    25     7     7
    20    22    20    22     1     2     3     4
    20    22    22    20     5     6     7     8
    20    22    20    20     9    10    11    12
    22    22    20    20    13    14    15    16]

S = qtdecomp(I,5)
full(S)

[vals,r,c] = qtgetblk(I,S,4) 
[vals,r,c] = qtgetblk(I,S,2) 

newvals = cat(3,zeros(4),ones(4)); 
J = qtsetblk(I,S,4,newvals)

newvals = cat(3,zeros(2),ones(2),ones(2)*2,ones(2)*3,ones(2)*4,ones(2)*5,ones(2)*6); 
J = qtsetblk(I,S,2,newvals)

%% ��10.9 ʹ���������ͺϲ���ͼ��ָ� splitmerge qtdecomp qtgetblk
clc
clear
f = imread('..\Pictures\images_ch10\Fig1017(a)(cygnusloop_Xray_original).tif');
imshowMy(f)
title('ԭʼͼ��')

g = splitmerge(f,32,@predicate);
imshowMy(g)
title('ʹ�ú���[splitmerge]��mindim��ֵΪ32ʱ���зָ���ͼ��')

g = splitmerge(f,16,@predicate);
imshowMy(g)
title('ʹ�ú���[splitmerge]��mindim��ֵΪ16ʱ���зָ���ͼ��')

g = splitmerge(f,8,@predicate);
imshowMy(g)
title('ʹ�ú���[splitmerge]��mindim��ֵΪ8ʱ���зָ���ͼ��')

imshowMy(uint8(double(f).*(1-g))) % �� 8 Ϊ��ģʱ�ķָ���

g = splitmerge(f,4,@predicate);
imshowMy(g,[])
max(g(:))
class(g)
title('ʹ�ú���[splitmerge]��mindim��ֵΪ4ʱ���зָ���ͼ��')

% double����ʱ�����Ǵ���1����ֵͳͳӰ��Ϊ1
g = splitmerge(f,2,@predicate);
imshowMy(g)
max(g(:))
class(g)
title('ʹ�ú���[splitmerge]��mindim��ֵΪ2ʱ���зָ��ģ���ֵ��ͼ��')

% double����ʱ�����Ǵ���1����ֵͳͳӰ��Ϊ1
g = splitmerge(f,2,@predicate);
imshowMy(g,[])    % ���Ǻ���⣿����
title('ʹ�ú���[splitmerge]��mindim��ֵΪ2ʱ���зָ��ģ��Ҷȣ�ͼ��')

%% ��10.9 ʹ���������ͺϲ���ͼ��ָ� splitmerge qtdecomp qtgetblk ѭ����ʽ 
clc
clear
f = imread('..\Pictures\images_ch10\Fig1017(a)(cygnusloop_Xray_original).tif');
imshowMy(f)
title('ԭʼͼ��')

for i = 5:-1:1
    dd = 2^i
    g = splitmerge(f,dd,@predicate);
    imshowMy(g)
    name = sprintf('ʹ�ú���[splitmerge]��mindim��ֵΪ%2dʱ���зָ�� ��ͼ��',dd);
    title(name)
end

%% ���ۺ�1�� ������ �Ĳ������������ϲ� Hough�任

clc
clear
I = imread('liftingbody.png');
S = qtdecomp(I,0.03); % 0.09
blocks = repmat(uint8(0),size(S));

for dim = [1];    % ֻ���Ϊ 1*1
  numblocks = length(find(S==dim));    
  if (numblocks > 0)        
    values = repmat(uint8(1),[dim dim numblocks]);
    values(2:dim,2:dim,:) = 0;
    blocks = qtsetblk(blocks,S,dim,values);
  end
end

blocks(end,1:end) = 1;
blocks(1:end,end) = 1;

imshowMy(I)
title('ԭʼͼ��')

imshowMy(blocks,[])

imshowMy(I.*(1-blocks))

f = blocks>0.5;
se = strel('square', 3);  % �ṹԪ��
f = imopen(f, se);
imshowMy(f)    % ��
title('ʹ�ýṹԪ��[square��3��]���������ͼ��')


[H,theta,rho] = hough(f,0.5); %
imshowMy(theta,rho,H,[],'notruesize')
axis on, axis normal
xlabel('\theta'),ylabel('\rho')


[r,c] = houghpeaks(H,10,1);
hold on
plot(theta(c),rho(r),'linestyle','none',...
    'marker','s','color','w')
title('������ѡ10����ֵ��λ�õ� Hough �任')
hold off
lines = houghlines(f,theta,rho,r,c)
imshowMy(f),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

[H,theta,rho] = hough(f,0.5); %
imshowMy(theta,rho,H,[],'notruesize')
axis on, axis normal
xlabel('\theta'),ylabel('\rho')

[r,c] = houghpeaks(H,100,1);
hold on
plot(theta(c),rho(r),'linestyle','none',...
    'marker','s','color','w')
title('������ѡ100����ֵ��λ�õ� Hough �任')

lines = houghlines(f,theta,rho,r,c)
imshowMy(f),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

lines = houghlines(f,theta,rho,r,c)
imshowMy(zeros(size(f))),hold on
for k = 1:length(lines)
    xy = [lines(k).point1;lines(k).point2];
    plot(xy(:,2),xy(:,1),'LineWidth',4,'Color',[0.6 0.6 0.6]);
end
title('Hough �任��ֵ��Ӧ���߶�')

%% ��10.10 �þ���ͷ�ˮ��任�ָ�Ҷ�ͼ��(�кܶ�С�ڵ�)����Ӱ��̫����
clc
clear
f = imread('..\Pictures\images_ch10\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ԭʼͼ��')

% f = double(f);
g = im2bw(f,graythresh(f));
imshowMy(g)

gc = ~g;
imshowMy(gc)

D = bwdist(gc);
imshowMy(D)

L = watershed(-D);
w = L == 0;
imshowMy(w)

g2 = g & ~w;
imshowMy(g2)

%% ���ۺ�2����10.10 �þ���ͷ�ˮ��任�ָ�Ҷ�ͼ��(�кܶ�С�ڵ�)����Ӱ���С�ˣ�Ԥ�Ƚ��п�������������׶����ղ�����
clc
clear
f = imread('..\Pictures\images_ch10\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ԭʼͼ��')

% f = double(f);
g = im2bw(f,graythresh(f));
imshowMy(g)

se = strel('square', 3);  % �ṹԪ��
g = imopen(g, se);
imshowMy(g)    % ��
title('ʹ�ýṹԪ��[square��3��]���������ͼ��')

g = imfill(im2bw(g),'holes');
imshowMy(g)
title('���׶�����ȫ��գ����ͼ��')

g = imclose(g, se);
imshowMy(g)    % ��
title('ʹ�ýṹԪ��[square��3��]���������ͼ��')

gc = ~g;
imshowMy(gc)

D = bwdist(gc);
imshowMy(D)

L = watershed(-D);
w = L == 0;
imshowMy(w)

g2 = g & ~w;
imshowMy(g2)

g3 = xor(g,w);
imshowMy(g3)
%% ��10.10 �þ���ͷ�ˮ��任�ָ��ֵͼ��
clc
clear
g = imread('..\Pictures\images_ch10\Fig1020(a)(binary-dowel-image).tif');
imshowMy(g)
title('ԭʼͼ��')

% % f = double(f);
% g = im2bw(f,graythresh(f));
% imshowMy(g)

gc = ~g;
imshowMy(gc)
title('ԭʼͼ��Ĳ�')

D = bwdist(gc);
imshowMy(D,[])
title('����任')

imshowMy(-D,[])
title('����任�Ĳ�')

L = watershed(-D);
imshowMy(L,[])
title('����任�ĸ���ˮ�뼹�ߣ��Ҷ�ͼ��')

max(L(:))
min(L(:))
class(L)

w = L == 0;
imshowMy(w)
title('����任�ĸ���ˮ�뼹�ߣ���ֵͼ��')

g1 = g + w;
imshowMy(g1)
title('��ɫ�ߵ�����ԭʼ��ֵͼ���Ϻ�ķ�ˮ�뼹��')

g2 = g & ~w;
imshowMy(g2)
title('��ɫ�ߵ�����ԭʼ��ֵͼ���Ϻ�ķ�ˮ�뼹�ߣ��þ���ͷ�ˮ��任�ָ��ֵͼ��')

g3 = xor(g,w);
imshowMy(g3)

%% ��10.11 ���ݶȺͷ�ˮ��任�ָ�Ҷ�ͼ��
clc
clear
f = imread('..\Pictures\images_ch10\Fig1021(a)(small-blobs).tif');
imshowMy(f)
title('ԭʼͼ��')

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
imshowMy(g,[])
max(g(:))
class(g)
title('�ݶȷ���ͼ��')

L = watershed(g);
imshowMy(L,[])
title('')
title('���ݶȷ���ͼ����з�ˮ��任�����ָ���Ҷȣ�')

wr = L == 0;
imshowMy(wr,[])
title('���ݶȷ���ͼ����з�ˮ��任�����ָ����ֵ��')

g2 = imclose(imopen(g,ones(3,3)),ones(3,3));
imshowMy(g2,[])
title('���ݶȷ���ͼ���ýṹԪ�� ones(3,3) �����ȿ��ٱղ�����ƽ������')

L2 = watershed(g2);
imshowMy(L2,[])
title('��ƽ������ݶȷ���ͼ����з�ˮ��任��������ָ���Ҷȣ�')

wr2 = L2 == 0;
imshowMy(wr2,[])
title('��ƽ������ݶȷ���ͼ����з�ˮ��任��������ָ����ֵ��')

f2 = f;
f2(L2 == 0) = 255;
imshowMy(f2,[])
title('�ָ��ߵ�����ԭʼͼ���ϵĽ�������ݶȺͷ�ˮ��任�ָ�Ҷ�ͼ��')
%% ��10.11 ���ݶȺͷ�ˮ��任�ָ�Ҷ�ͼ�� ͼ�����ݶ�ͼ���ر�������
clc
clear
f = imread('..\Pictures\images_ch10\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ԭʼͼ��')

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
imshowMy(g,[])
max(g(:))
class(g)
title('�ݶȷ���ͼ��')

L = watershed(g);
imshowMy(L,[])
title('')
title('���ݶȷ���ͼ����з�ˮ��任�����ָ���Ҷȣ�')

wr = L == 0;
imshowMy(wr,[])
title('���ݶȷ���ͼ����з�ˮ��任�����ָ����ֵ��')

g2 = imclose(imopen(g,ones(3,3)),ones(3,3));
imshowMy(g2,[])
title('���ݶȷ���ͼ���ýṹԪ�� ones(3,3) �����ȿ��ٱղ�����ƽ������')

L2 = watershed(g2);
imshowMy(L2,[])
title('��ƽ������ݶȷ���ͼ����з�ˮ��任��������ָ���Ҷȣ�')

wr2 = L2 == 0;
imshowMy(wr2,[])
title('��ƽ������ݶȷ���ͼ����з�ˮ��任��������ָ����ֵ��')

f2 = f;
f2(L2 == 0) = 255;
imshowMy(f2,[])
title('�ָ��ߵ�����ԭʼͼ���ϵĽ�������ݶȺͷ�ˮ��任�ָ�Ҷ�ͼ��')
%% imregionalmin  imextendedmin ������:��
clc
clear
A = 5*ones(10,10);
A(2:4,2:4) = 2; 
A(3,3) = 1; 
A(6:8,1:10) = 7; 
A
% A =
%     10    10    10    10    10    10    10    10    10    10
%     10     2     2     2    10    10    10    10    10    10
%     10     2     2     2    10    10    10    10    10    10
%     10     2     2     2    10    10    10    10    10    10
%     10    10    10    10    10    10    10    10    10    10
%     10    10    10    10    10     7     7     7    10    10
%     10    10    10    10    10     7     7     7    10    10
%     10    10    10    10    10     7     7     7    10    10
%     10    10    10    10    10    10    10    10    10    10
%     10    10    10    10    10    10    10    10    10    10

B = imregionalmin(A)
% B = 
%      0     0     0     0     0     0     0     0     0     0
%      0     1     1     1     0     0     0     0     0     0
%      0     1     1     1     0     0     0     0     0     0
%      0     1     1     1     0     0     0     0     0     0
%      0     0     0     0     0     0     0     0     0     0
%      0     0     0     0     0     1     1     1     0     0
%      0     0     0     0     0     1     1     1     0     0
%      0     0     0     0     0     1     1     1     0     0
%      0     0     0     0     0     0     0     0     0     0
%      0     0     0     0     0     0     0     0     0     0

BW0 = imextendedmin(A,0)
BW1 = imextendedmin(A,1)
BW2 = imextendedmin(A,2)
BW3 = imextendedmin(A,3)
BW4 = imextendedmin(A,4)
BW5 = imextendedmin(A,5)
BW6 = imextendedmin(A,6)
BW8 = imextendedmin(A,8)
BW9 = imextendedmin(A,9)
BW10 = imextendedmin(A,10)

%% ��10.12 �ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ��ʵ��  ���� imextendedmin(f,2)
clc
clear
f = imread('..\Pictures\images_ch10\Fig1022(a)(gel-image).tif');
imshowMy(f)
title('ԭʼ����ͼ��')

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
imshowMy(g,[])
title('�ݶȷ���ͼ��')

L = watershed(g);
wr = L == 0;
imshowMy(wr,[])
title('���ݶȷ���ͼ����з�ˮ��任�����ָ���')

rm = imregionalmin(g); % ˵���ݶ�ͼ���кܶ�Ƚ�ǳ�Ŀ�: ��ɵ�ԭ����ԭͼ�񲻾��ȱ����еĻҶ�ϸС�仯��ɵ�
imshowMy(rm,[])
title('���ݶȷ���ͼ��ľֲ���С����')

im = imextendedmin(f,2); % ��������ѡ���ԭͼ��Ŀ��������б��: Ŀ��������ԭͼ���о�Ӧ����һ���Ƚ���Ŀ�
imshowMy(im,[])
title('���ݶȷ���ͼ��ľֲ���С���������޹ص�С����')

fim = f;
fim(im) = 175; % �ûҶ�ֵ175�����Ŀ����
imshowMy(fim,[])
title('�ڲ���Ƿ�')

imshowMy(bwdist(im),[])
Lim = watershed(bwdist(im));
em = Lim == 0;
imshowMy(em,[])
title('�ⲿ��Ƿ�')

g2 = imimposemin(g,im | em);
imshowMy(g2,[])
title('�޸ĺ���ݶȷ���ͼ��')

L2 = watershed(g2);
f2 = f;
f2(L2 == 0) = 255;
imshowMy(f2,[])
title('�ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ����')

%% ��10.12 �ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ��ʵ��  ���� imextendedmin(f,20)
clc
clear
f = imread('..\Pictures\images_ch10\Fig1022(a)(gel-image).tif');
imshowMy(f)
title('ԭʼ����ͼ��')

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
imshowMy(g,[])
title('�ݶȷ���ͼ��')

L = watershed(g);
wr = L == 0;
imshowMy(wr,[])
title('���ݶȷ���ͼ����з�ˮ��任�����ָ���')

rm = imregionalmin(g);
imshowMy(rm,[])
title('���ݶȷ���ͼ��ľֲ���С����')

im = imextendedmin(f,20);
fim = f;
fim(im) = 175;
imshowMy(fim,[])
title('�ڲ���Ƿ�')

Lim = watershed(bwdist(im));
em = Lim == 0;
imshowMy(em,[])
title('�ⲿ��Ƿ�')

g2 = imimposemin(g,im | em);
imshowMy(g2,[])
title('�޸ĺ���ݶȷ���ͼ��')

L2 = watershed(g2);
f2 = f;
f2(L2 == 0) = 255;
imshowMy(f2,[])
title('�ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ����')

%% ��10.12 �ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ��ʵ��  ���� imextendedmin(f,iii) �Զ���ʵ�ֱ���:)
clc
clear
f = imread('..\Pictures\images_ch10\Fig1022(a)(gel-image).tif');
% imshowMy(f)
% title('ԭʼ����ͼ��')

h = fspecial('sobel');
fd = double(f);
g = sqrt(imfilter(fd,h,'replicate').^2 + imfilter(fd,h','replicate').^2);
% imshowMy(g,[])
% title('�ݶȷ���ͼ��')

L = watershed(g);
wr = L == 0;
% imshowMy(wr,[])
% title('���ݶȷ���ͼ����з�ˮ��任�����ָ���')

rm = imregionalmin(g);
% imshowMy(rm,[])
% title('���ݶȷ���ͼ��ľֲ���С����')

for i = 5:1:20
    im = imextendedmin(f,i);
    fim = f;
    fim(im) = 175;
    % imshowMy(fim,[])
    % title('�ڲ���Ƿ�')

    Lim = watershed(bwdist(im));
    em = Lim == 0;
    % imshowMy(em,[])
    % title('�ⲿ��Ƿ�')

    g2 = imimposemin(g,im | em);
    % imshowMy(g2,[])
    % title('�޸ĺ���ݶȷ���ͼ��')

    L2 = watershed(g2);
    f2 = f;
    f2(L2 == 0) = 255;
    imshowMy(f2,[])
    title(['�ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ���� imextendedmin(f,' int2str(i) ')'])
    imwrite(f2, ['..\NewPictures\New_images_ch10\' '�ñ�Ƿ����Ƶķ�ˮ��任�ָ�ͼ���� imextendedmin(f,' int2str(i) ')' '.jpg'])
    
end

%% watershed  2-D Example
clc
clear

% 2-D Example
% Make a binary image containing two overlapping circular objects. 
center1 = -10;
center2 = -center1;
dist = sqrt(2*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2) <= radius;
bw = bw1 | bw2;
imshowMy(bw,'n'), title('BW')
% Compute the distance transform of the complement of the binary image. 
D = bwdist(~bw);
imshowMy(D,[],'n'), title('Distance transform of ~bw')
% Complement the distance transform, and force pixels that don't belong to the objects to be at -Inf. 
D = -D;
D(~bw) = -Inf;
% Compute the watershed transform and display it as an indexed image. 
L = watershed(D);
rgb = label2rgb(L,'jet',[.5 .5 .5]);
imshowMy(rgb,'n'), title('Watershed transform of D');




%% watershed  3-D Example
clc
clear

% 3-D Example
% Make a 3-D binary image containing two overlapping spheres. 
center1 = -10;
center2 = -center1;
dist = sqrt(3*(2*center1)^2);
radius = dist/2 * 1.4;
lims = [floor(center1-1.2*radius) ceil(center2+1.2*radius)];
[x,y,z] = meshgrid(lims(1):lims(2));
bw1 = sqrt((x-center1).^2 + (y-center1).^2 + ...
     (z-center1).^2) <= radius;
bw2 = sqrt((x-center2).^2 + (y-center2).^2 + ...
     (z-center2).^2) <= radius;
bw = bw1 | bw2;
figure, isosurface(x,y,z,bw,0.5), axis equal, title('BW')
xlabel x, ylabel y, zlabel z
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight, lighting gouraud
% Compute the distance transform. 
D = bwdist(~bw);
figure, isosurface(x,y,z,D,radius/2), axis equal
title('Isosurface of distance transform')
xlabel x, ylabel y, zlabel z
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight, lighting gouraud
% Complement the distance transform, force nonobject pixels to be -Inf, and then compute the watershed transform. 
D = -D;
D(~bw) = -Inf;
L = watershed(D);
figure, isosurface(x,y,z,L==2,0.5), axis equal
title('Segmented object')
xlabel x, ylabel y, zlabel z
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight, lighting gouraud
figure, isosurface(x,y,z,L==3,0.5), axis equal
title('Segmented object')
xlabel x, ylabel y, zlabel z
xlim(lims), ylim(lims), zlim(lims)
view(3), camlight, lighting gouraud


%% ͼ��ָ���ܽ�

1�� ��ˮ��ָ������Ҫ�ŵ��ǣ����һ������Чʹ�á�����֪ʶ���Ļ��ơ�����Ӧ�þ��ǡ�ʹ�ÿ��Ʊ�Ƿ��ķ�ˮ��ָ���
    �ý����� A �����ô˷����ָ�֮��ֻ����ƽ���ҶȽ��� [A B] ֮��ķָ�Ȧ




























%% 
clc
clear


����¥�Ρ���һ�ء�(���˸�)
       -- �塤��ѩ��
ª�ҿ���,����������.˥�ݿ���,��Ϊ���賡.
��˿����������,��ɴ���ֺ������.
˵ʲô֬��Ũ,������,��������ֳ�˪ 
���ջ���¤ͷ�Ͱ׹�,��������ʵ���ԧ��.
������,������,չ����ؤ�˽԰�.
��̾����������,��֪�Լ�����ɥ!
ѵ�з�,�������պ���ǿ��.�����,˭�����������̻���!
����ɴñС,��ʹ���ϸ�.�����ư���,����������.
�Һ���㷽�����ҵǳ�,���������ǹ���.
������,��ͷ������Ϊ������������!






