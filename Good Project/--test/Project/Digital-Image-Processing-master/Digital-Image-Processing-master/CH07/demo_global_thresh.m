%%
% ����ȫ����ֵ
f = imread('Fig1013(a).tif')
imshow(f);
count = 0;
T = mean2(f);
done = false;
while ~done
    count = count + 1;
    g = f > T;
    Tnext = 0.5 * (mean(f(g)) + mean(f(~g)));
    done = abs(T - Tnext) < 0.5;
    T = Tnext;
end
g = im2bw(f,T/255);
figure,imhist(f);
figure,imshow(g);

%%
%   ʹ��Otsu�����������ȫ����ֵ����
f = imread('Fig1014(a).tif');
imshow(f);
[T,SM] = graythresh(f);
g = im2bw(f,T);
figure,imshow(g);

%%
%   ʹ��ͼ��ƽ������ȫ����ֵ����
f = imread('Fig1015(a)[noiseless].tif');
imshow(f);
%   ���ɴ���ͼ��
fn = imnoise(f,'gaussian',0,0.038);
figure,imshow(fn);

%   ʹ��5*5�ľ�ֵģ��ƽ��ͼ��
w = fspecial('average',5);
fa = imfilter(fn,w,'replicate');
figure,imshow(fa);

%   ʹ��Otsu�����ָ�
Ta = graythresh(fa);
ga = im2bw(fa,Ta);
figure,imshow(ga);

%%
%   ʹ��������˹���ӱ�Ե��Ϣ�Ľ�ȫ����ֵ����
f = imread('Fig1017(a).tif');
imshow(f);
f = tofloat(f);
w = [-1 -1 -1; -1 8 -1; -1 -1 -1];
lap = abs(imfilter(f,w,'replicate'));
lap = lap/max(lap(:));
h = imhist(lap);
Q = percentile2i(h,0.995);
markerImage = lap > Q;
fp = f.*markerImage;
figure,imshow(fp);
hp = imhist(fp);
hp(1) = 0;
figure,bar(hp,0);
T = graythresh(hp);
g = im2bw(f,T);
figure,imshow(g);
