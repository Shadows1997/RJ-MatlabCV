%% �ھ��� ��̬ѧͼ����

%% ��9.1 imdilate ���� 
clc
clear

A = imread('..\Pictures\images_ch09\Fig0906(a)(broken-text).tif');
info = imfinfo('..\Pictures\images_ch09\Fig0906(a)(broken-text).tif')
B = [0 1 0
     1 1 1
     0 1 0];
 A2 = imdilate(A, B);
 A3 = imdilate(A2, B); % ��������
 A4 = imdilate(A3, B); % ��������
%  A2 = imdilate(B,A); % ����...
imshowMy(A)
title('ԭʼͼ��')

imshowMy(A2)
title('ʹ�ýṹԪ��[B]һ�����ͺ��ͼ��')

imshowMy(A3)
title('ʹ�ýṹԪ��[B]�������ͺ��ͼ��')

imshowMy(A4)
title('ʹ�ýṹԪ��[B]�������ͺ��ͼ��')

imshowMy(A2-A) % ��ʾ���ӵĲ���
title('ʹ�ýṹԪ��[B]һ�����ͺ��ԭͼ����Ƚ����ӵĲ���')


%% ��9.3 imerode 
clc
clear

A = imread('..\Pictures\images_ch09\Fig0908(a)(wirebond-mask).tif');
se = strel('disk', 10);
imshowMy(A)
title('ԭʼͼ��')

A2 = imerode(A, se);
imshowMy(A2)
title('ʹ�ýṹԪ��[disk��10��]��ʴ���ͼ��')

se = strel('disk', 5);
A3 = imerode(A, se);
imshowMy(A3)
title('ʹ�ýṹԪ��[disk��5��]��ʴ���ͼ��')

A4 = imerode(A, strel('disk', 20));
imshowMy(A4)
title('ʹ�ýṹԪ��[disk��20��]��ʴ���ͼ��')

%% ��9.4.1 imopen imclose ע�⵱�ṹԪ�طֱ�ʹ�� square �� disk �ľ޴����𣡣���
clc
clear

f = imread('..\Pictures\images_ch09\Fig0910(a)(shapes).tif');
% se = strel('square', 5);  % �ṹԪ�� ����
se = strel('disk', 5);  % �ṹԪ�� Բ����
imshowMy(f)  % ԭʼͼ  ͼ1
title('ԭʼͼ��')

fo = imopen(f, se);  % �� ͼ2
imshowMy(fo) 
title('ʹ�ýṹԪ��[disk��5��]���������ͼ��')

fc = imclose(f, se); % �� ͼ3
imshowMy(fc)
title('ʹ�ýṹԪ��[disk��5��]�ղ������ͼ��')

foc = imclose(fo, se);  % �ȿ��ٱ� ͼ4
imshowMy(foc)
title('ʹ�ýṹԪ��[disk��5��]�ȿ������ٱղ������ͼ��')

fco = imopen(fc, se);   % �ȱ��ٿ� ͼ5
imshowMy(fco)  
title('ʹ�ýṹԪ��[disk��5��]�ȱղ����ٿ��������ͼ��')

% �������ٸ�ʴ ͼ6
fse = imdilate(f, se);
figure,set(gcf,'outerposition',get(0,'screensize'))
subplot(211),imshow(fse)
title('ʹ�ýṹԪ��[disk��5��]�����ͺ��ͼ��')
fes = imerode(fse, se);
subplot(212),imshow(fes)  
title('ʹ�ýṹԪ��[disk��5��]�������ٸ�ʴ���ͼ��')

% �ȸ�ʴ������ ͼ7
fse = imerode(f, se);
figure, set(gcf,'outerposition',get(0,'screensize'))
subplot(211),imshow(fse)
title('ʹ�ýṹԪ��[disk��5��]�ȸ�ʴ���ͼ��')
fes = imdilate(fse, se);
subplot(212),imshow(fes)  
title('ʹ�ýṹԪ��[disk��5��]�ȸ�ʴ�����ͺ��ͼ��')

%% ��9.4.2 imopen imclose ָ�� 
clc
clear

f = imread('..\Pictures\images_ch09\Fig0911(a)(noisy-fingerprint).tif');
se = strel('square', 3);  % �ṹԪ��
% se = strel('disk', 2);  % �ṹԪ�� Բ����

imshowMy(f)  % ԭʼͼ
title('ԭʼͼ��')

A = imerode(f, se); % ��ʴ
imshowMy(A)
title('ʹ�ýṹԪ��[square��3��]��ʴ���ͼ��')

fo = imopen(f, se);
imshowMy(fo)    % ��
title('ʹ�ýṹԪ��[square��3��]���������ͼ��')

fc = imclose(f, se);   % ��
imshowMy(fc)
title('ʹ�ýṹԪ��[square��3��]�ղ������ͼ��')

foc = imclose(fo, se);  % �ȿ��ٱ�
imshowMy(foc)
title('ʹ�ýṹԪ��[square��3��]�ȿ������ٱղ������ͼ��')

fco = imopen(fc, se);   % �ȱ��ٿ�
imshowMy(fco)
title('ʹ�ýṹԪ��[square��3��]�ȱղ����ٿ��������ͼ��')

%% ��9.5 bwhitmiss ���л�����б任
clc
clear

f = imread('..\Pictures\images_ch09\Fig0913(a)(small-squares).tif');
imshowMy(f)
imfinfoMy(f)
title('ԭʼͼ��')

B1 = strel([0 0 0; 
            0 1 1; 
            0 1 0]); % ���У�Ҫ�󡰻��С����еġ�1��λ�ã�����Ҫ���ǡ�0��λ��
B2 = strel([1 1 1; 
            1 0 0; 
            1 0 0]); % �����У�Ҫ�󡰻����С����еġ�1��λ�ã�����Ҫ���ǡ�0��λ��

B3 = strel([0 1 0; 
            1 1 1; 
            0 1 0]);
B4 = strel([1 0 1; 
            0 0 0; 
            0 0 0]);
        
B5 = strel([0 0 0; 
            0 1 0; 
            0 0 0]); % ����
B6 = strel([1 1 1; 
            1 0 0; 
            1 0 0]); % ������

g = bwhitmiss(f, B1, B2);
imshowMy(g)
title('ʹ�ýṹԪ����[1]���л����б任���ͼ��')

g2 = bwhitmiss(f, B3, B4);
imshowMy(g2)
title('ʹ�ýṹԪ����[2]���л����б任���ͼ��')

g3 = bwhitmiss(f, B5, B6);
imshowMy(g3)
title('ʹ�ýṹԪ����[3]���л����б任���ͼ��')

%% ���ö�����ʵ�֡����л����С�����
clc
clear

f = imread('..\Pictures\images_ch09\Fig0913(a)(small-squares).tif');
imshowMy(f)
imfinfoMy(f)
title('ԭʼͼ��')

B1 = strel([0 0 0; 
            0 1 1; 
            0 1 0]); % ����
B2 = strel([1 1 1; 
            1 0 0; 
            1 0 0]); % ������

B3 = strel([0 1 0; 
            1 1 1; 
            0 1 0]);
B4 = strel([1 0 1; 
            0 0 0; 
            0 0 0]);

g = imerode(f,B1) & imerode(~f,B2);
imshowMy(g)
title('ʹ�ýṹԪ����[1]���л����б任���ͼ��')


%% makelut
clc
clear

f = inline('sum(x(:)) >= 3');
lut2 = makelut(f,2)

lut3 = makelut(f,3)

%% ��9.6 makelut ��Цè֮������Ϸ P267
clc
clear

lut = makelut(@conwaylaws, 3);
bw1 = [0     0     0     0     0     0     0     0     0     0
       0     0     0     0     0     0     0     0     0     0
       0     0     0     1     0     0     1     0     0     0
       0     0     0     1     1     1     1     0     0     0
       0     0     1     0     0     0     0     1     0     0
       0     0     1     0     1     1     0     1     0     0
       0     0     1     0     0     0     0     1     0     0
       0     0     0     1     1     1     1     0     0     0
       0     0     0     0     0     0     0     0     0     0
       0     0     0     0     0     0     0     0     0     0  ];

imshowMy(bw1, 'notruesize'), title('Generation 1') % 'n' == 'notruesize'

% imshowMy(bw1), title('Generation 1')

bw2 = applylut(bw1, lut);
imshowMy(bw2, 'n'), title('Generation 2')

bw3 = applylut(bw2, lut);
imshowMy(bw3, 'n'), title('Generation 3')

bw4 = applylut(bw3, lut);
imshowMy(bw4, 'n'), title('Generation 4')

bw5 = applylut(bw4, lut);
imshowMy(bw5, 'n'), title('Generation 5')

bw6 = applylut(bw5, lut);
imshowMy(bw6, 'n'), title('Generation 6')

bw7 = applylut(bw6, lut);
imshowMy(bw7, 'n'), title('Generation 7')

bw8 = applylut(bw7, lut);
imshowMy(bw8, 'n'), title('Generation 8')

temp = bw1;
for i = 2:100;
    bw100 = applylut(temp, lut);
    temp = bw100;
end
imshowMy(bw100, 'n'), title('Generation 100')

%% getsequence
clc
clear

se = strel('diamond', 5)
decomp = getsequence(se)
decomp(1)
decomp(2)
decomp(3)
decomp(4)
% decomp(1)*decomp(2)*decomp(3)*decomp(4) �Ǵ����
% rse = imdilate(imdilate(imdilate(decomp(1), decomp(2)), decomp(3)),...
% decomp(4)) �Ǵ����

%% endpoints 
clc
clear

f = imread('..\Pictures\images_ch09\Fig0914(a)(bone-skel).tif');
imshowMy(f)
title('ԭʼ��̬������ͼ��')

g = endpoints(f);
imshowMy(g)
title('ʹ�ú���[endpoints]��õ��Ķ˵�ͼ��')

f = imread('..\Pictures\images_ch09\Fig0916(a)(bone).tif');
imshowMy(f)
title('ԭʼ��ͷͼ��')

g = endpoints(f);
imshowMy(g)
title('ʹ�ú���[endpoints]��õ��Ķ˵�ͼ��ʲôҲû�У�')

%% bwmorph   'remove' 'skel' 'shrink' ��thin��
clc
clear

BW = imread('circles.png');
imshowMy(BW);

BW2 = bwmorph(BW,'remove');
imshowMy(BW2)

BW3 = bwmorph(BW,'skel',Inf);
imshowMy(BW3)

BW4 = bwmorph(BW,'shrink',Inf); % ȥ��ë�̵ġ���������
imshowMy(BW4)

ginf = bwmorph(BW, 'thin', Inf); 
imshowMy(ginf)
title('ʹ�ú���[bwmorph]ϸ�����ȶ�״̬���ͼ��')

%% P433 �߽���ȡ bwmorph   'remove' 'skel' 'shrink' ��thin��

clc
clear

BW = imread('..\DIP_SourceImage\images_chapter_09\Fig9.14(a).jpg');
imshowMy(BW)
title('ԭʼͼ��')

BW2 = bwmorph(BW,'remove'); % ��ʱ�ﲻ���������ȡ�߽�Ч��
imshowMy(BW2)

BW3 = bwmorph(BW,'skel',Inf);
imshowMy(BW3)

BW4 = bwmorph(BW,'shrink',Inf); % ȥ��ë�̵ġ���������
imshowMy(BW4)

ginf = bwmorph(BW, 'thin', Inf); 
imshowMy(ginf)
title('ʹ�ú���[bwmorph]ϸ�����ȶ�״̬���ͼ��')

%% bwmorph   'bridge' 'clean' 'hbreak'
clc
clear

f = imread('..\Pictures\images_ch09\Fig0911(a)(noisy-fingerprint).tif');

imshowMy(f)  % ԭʼͼ
title('ԭʼͼ��')

BW3 = bwmorph(f,'bridge',Inf);
imshowMy(BW3)

BW3 = bwmorph(BW3,'hbreak',Inf); % ����ϸ΢�ı仯
imshowMy(BW3)

BW3 = bwmorph(f,'clean',Inf);
imshowMy(BW3)


%% bwmorph   'thin' ָ��ͼ�� ϸ��1
clc
clear

f = imread('..\Pictures\images_ch09\Fig0911(a)(noisy-fingerprint).tif');
% f = imread('..\Pictures\Beautiful\hehe1.tif');
imshowMy(f)
title('ԭʼָ��ͼ��')

g1 = bwmorph(f, 'thin', 1);
imshowMy(g1)
title('ʹ�ú���[bwmorph]ϸ��һ�κ��ͼ��')

g2 = bwmorph(f, 'thin', 2);
imshowMy(g2)
title('ʹ�ú���[bwmorph]ϸ�����κ��ͼ��')

% ϸ�����ȶ�״̬
ginf = bwmorph(f, 'thin', Inf); 
imshowMy(ginf)
title('ʹ�ú���[bwmorph]ϸ�����ȶ�״̬���ͼ��')

%% bwmorph   'thin' ��ͷͼ�� ϸ��2
clc
clear

f = imread('..\Pictures\images_ch09\Fig0916(a)(bone).tif');
% f = imread('..\Pictures\Beautiful\hehe1.tif');
imshowMy(f)
title('ԭʼ��ͷͼ��')

g1 = bwmorph(f, 'thin', 1);
imshowMy(g1)
title('ʹ�ú���[bwmorph]ϸ��һ�κ��ͼ��')

g2 = bwmorph(f, 'thin', 2);
imshowMy(g2)
title('ʹ�ú���[bwmorph]ϸ�����κ��ͼ��')

% ϸ�����ȶ�״̬
ginf = bwmorph(f, 'thin', Inf); 
imshowMy(ginf)
title('ʹ�ú���[bwmorph]ϸ�����ȶ�״̬���ͼ��')
%% bwmorph  'skel' ��ͷͼ�� ������1
clc
clear

f = imread('..\Pictures\images_ch09\Fig0916(a)(bone).tif');
% f = imread('..\Pictures\Beautiful\hehe1.tif');
imshowMy(f)
title('ԭʼ��ͷͼ��')

g1 = bwmorph(f, 'skel', 1);
imshowMy(g1)
title('ʹ�ú���[bwmorph]������һ�κ��ͼ��')

g2 = bwmorph(f, 'skel', 2);
imshowMy(g2)
title('ʹ�ú���[bwmorph]���������κ��ͼ��')

% ���������ȶ�״̬
fs = bwmorph(f, 'skel', Inf); 
imshowMy(fs)
title('ʹ�ú���[bwmorph]���������ȶ�״̬���ͼ��')

for k = 1:5
    fs = fs & ~endpoints(fs);
end
imshowMy(fs)
title('ʹ�ú���[endpoints]����޼������˵���ͼ��')

%% bwmorph  'skel' ָ��ͼ�� ������2
clc
clear

f = imread('..\Pictures\images_ch09\Fig0911(a)(noisy-fingerprint).tif');
% f = imread('..\Pictures\Beautiful\hehe1.tif');
imshowMy(f)
title('ԭʼָ��ͼ��')

g1 = bwmorph(f, 'skel', 1);
imshowMy(g1)
title('ʹ�ú���[bwmorph]������һ�κ��ͼ��')

g2 = bwmorph(f, 'skel', 2);
imshowMy(g2)
title('ʹ�ú���[bwmorph]���������κ��ͼ��')

% ���������ȶ�״̬
fs = bwmorph(f, 'skel', Inf); 
imshowMy(fs)
title('ʹ�ú���[bwmorph]���������ȶ�״̬���ͼ��')

for k = 1:5
    fs = fs & ~endpoints(fs);
end
imshowMy(fs)
title('ʹ�ú���[endpoints]����޼������˵���ͼ��')
%% ��9.7 bwlabel ��ע��ͨ����
clc
clear
f = imread('..\Pictures\images_ch09\Fig0917(a)(ten-objects).tif');
imshowMy(f)
title('ԭʼͼ��')

[L4,n4] = bwlabel(f,4);  % 14��4��ͨ����
imshowMy(L4,[]) % ���е�12 13 14������ C �ĹսǴ�������
[L,n] = bwlabel(f);      % 10��8��ͨ����
imshowMy(L,[])


imshowMy(f) % ����
hold on     % ����
[r,c] = find(L == 3);
rbar = mean(r);
cbar = mean(c);
% plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k',...
%         'MarkerFaceColor','k','MarkerSize',10);
plot(cbar,rbar,'Marker','*','MarkerFaceColor','w');
title('��ǵ�����������ͨ�����������ĺ��ͼ��')

imshowMy(f) % ����
hold on     % ����
for k =1:n
    [r,c] = find(L == k);
    rbar = mean(r);
    cbar = mean(c);
%     plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k',...
%         'MarkerFaceColor','k','MarkerSize',10);
    plot(cbar,rbar,'Marker','*','MarkerFaceColor','w');
end
title('ʹ��ѭ��������ж�����ͨ�����������ĺ��ͼ��')



%% ��9.8 imreconstruct imfill imclearborder
clc
clear
f = imread('..\Pictures\images_ch09\Fig0922(a)(book-text).tif');
imshowMy(f)
title('ԭʼͼ��')

fe = imerode(f,ones(51,1));
imshowMy(fe)
title('ʹ�����߸�ʴ���ͼ��')

fo = imopen(f,ones(51,1));
imshowMy(fo)
title('ʹ����������������ͼ��')

fobr = imreconstruct(fe,f);
imshowMy(fobr)
title('ʹ���������ع����ͼ��')

g = imfill(f,'holes');
imshowMy(g)
title('���׶�����ȫ��գ����ͼ��')

g1 = imclearborder(f,8);
imshowMy(g1)
title('����߽������ͼ��')



%% ��9.9 ʹ�ÿ�����ͱ����������̬ѧƽ��
clc
clear
f = imread('..\Pictures\images_ch09\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ľ������ԭʼͼ��')

se = strel('disk',5);
fo = imopen(f,se);
imshowMy(fo)
title('ʹ�ð뾶Ϊ5��Բ��ִ�п�������ͼ��')

foc = imclose(fo,se);
imshowMy(foc)
title('������������پ���������ͼ��')

fasf = f;
for k = 2:5
    se = strel('disk',k);
    fasf = imclose(imopen(fasf,se),se);
end
imshowMy(fasf)
title('����˳���˲����ͼ��')

%% ��9.10 ʹ�ö�ñ�任 �� ��ñ�任
clc
clear
f = imread('..\Pictures\images_ch09\Fig0926(a)(rice).tif');
imshowMy(f)
title('ԭʼͼ��')

T1 = 255*graythresh(f)
g = f>=T1;
imshowMy(g)
title('������ֵ������ͼ��')

se = strel('disk',10);
fo = imopen(f,se);
imshowMy(fo)
title('������������ͼ��')

f2 = imsubtract(f,fo);
imshowMy(f2)
title('��ñ�任(ԭʼͼ���ȥ������������ͼ��)')

T2 = 255*graythresh(f2) % �Զ������ֵ
g1 = f2>=T2;
imshowMy(g1)
title('������ֵ�����Ķ�ñ�任ͼ��')

f2 = imtophat(f,se); % ʹ�ö�ñ�任
imshowMy(f2)
title('��ñ�任[ʹ�� imtophat ����]')

se1 = strel('disk',10);
f3 = imbothat(imcomplement(f),se1); % ʹ�õ�ñ�任
imshowMy(f3)
title('��ñ�任[ʹ�� imbothat ����]')

se = strel('disk',3);
g2 = imsubtract(imadd(f,imtophat(f,se)),imbothat(f,se));
imshowMy(g2)
title('��ñ�任�͵�ñ�任����ʹ�ã�������ǿ�Աȶȣ�')

%% ��ñ�任һ������ imtophat + imadjust
clc
clear

I = imread('rice.png');
imshowMy(I)

K1 = imadjust(I);
imshowMy(K1)

se = strel('disk',12);
J = imtophat(I,se);
imshowMy(J)

K2 = imadjust(J);
imshowMy(K2)

%% ��ñ�任�͵�ñ�任����ʹ�ã�������ǿ�Աȶȣ�
clc
clear
I = imread('pout.tif');
imshowMy(I)

se = strel('disk',3);

J = imsubtract(imadd(I,imtophat(I,se)),imbothat(I,se));
imshowMy(J)
title('��ñ�任�͵�ñ�任����ʹ�ã�������ǿ�Աȶȣ�')


%% ��9.11 �������� ����ͼ��
clc
clear
f = imread('..\Pictures\images_ch09\Fig0926(a)(rice).tif');
imshowMy(f)
title('ԭʼͼ��')

sumpixels = zeros(1,36);
for k = 0:35
    se = strel('disk',k);
    fo = imopen(f,se);
    sumpixels(k + 1) = sum(fo(:));
end
figure,plot(0:35,sumpixels)
xlabel('k'),ylabel('Surface area')
set(gcf,'outerposition',get(0,'screensize'))

figure,plot(-diff(sumpixels)) % ��ʾ�뾶�ߴ�Ϊ5�Ķ�����࣬���Ϊ�ߴ�6
xlabel('k'),ylabel('Surface area reduction')
set(gcf,'outerposition',get(0,'screensize'))

%% ��9.11 �������� ͼ��ͼ��ʱ��ϳ���
clc
clear
f = imread('..\Pictures\images_ch09\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ľ������ԭʼͼ��')

se = strel('disk',5);
fo = imopen(f,se);
imshowMy(fo)
title('ʹ�ð뾶Ϊ5��Բ��ִ�п�������ͼ��')

foc = imclose(fo,se);
imshowMy(foc)
title('������������پ���������ͼ��')

fasf = f;
for k = 2:5
    se = strel('disk',k);
    fasf = imclose(imopen(fasf,se),se);
end
imshowMy(fasf)
title('����˳���˲����ͼ��')

sumpixels = zeros(1,36);
for k = 0:35
    se = strel('disk',k);
    fo = imopen(f,se);
    sumpixels(k + 1) = sum(fo(:));
end
figure,plot(0:35,sumpixels)
xlabel('k'),ylabel('Surface area')
set(gcf,'outerposition',get(0,'screensize'))

figure,plot(-diff(sumpixels)) % ��ʾ�뾶�ߴ�Ϊ5�Ķ�����࣬���Ϊ�ߴ�6
xlabel('k'),ylabel('Surface area reduction')
set(gcf,'outerposition',get(0,'screensize'))

f = fasf;
sumpixels = zeros(1,36);
for k = 0:35
    se = strel('disk',k);
    fo = imopen(f,se);
    sumpixels(k + 1) = sum(fo(:));
end
figure,plot(0:35,sumpixels)
xlabel('k'),ylabel('Surface area')
set(gcf,'outerposition',get(0,'screensize'))

figure,plot(-diff(sumpixels)) % ��ʾ�뾶�ߴ�Ϊ5�Ķ�����࣬���Ϊ�ߴ�6
xlabel('k'),ylabel('Surface area reduction')
set(gcf,'outerposition',get(0,'screensize'))

%% P283 �Ҷ��ع�(ɾ���ȽṹԪ��С�Ķ���)
clc
clear
f = imread('..\Pictures\images_ch09\Fig0925(a)(dowels).tif');
imshowMy(f)
title('ԭʼͼ��')

se = strel('disk',5);
fe = imerode(f,se); % �������ͼ��
fobr = imreconstruct(fe,f);
imshowMy(fobr)
title('�������ع����ͼ��')

fobrc = imcomplement(fobr);
fobrce = imerode(fobrc,se);
fobrcbr = imcomplement(imreconstruct(fobrce,fobrc));
imshowMy(fobrcbr)
title('���������ع����پ��������ع���ͼ��')

fobrc = imcomplement(f);
fobrce = imerode(fobrc,se);
fobrcbr = imcomplement(imreconstruct(fobrce,fobrc));
imshowMy(fobrcbr)
title('ֱ�ӽ��б������ع���ͼ��')

%% ��9.12 ʹ���ع�ɾ������ͼ��ı���
clc
clear
f = imread('..\Pictures\images_ch09\Fig0930(a)(calculator).tif');
imshowMy(f)
title('ԭʼͼ��')

f_obr = imreconstruct(imerode(f,ones(1,71)),f);
imshowMy(f_obr)
title('������ʴ�����ع����ͼ�񣨽ṹԪ�أ�ʹ��һ����ˮƽ�ߣ�')

% f_obr = imreconstruct(imopen(f,ones(1,71)),f);
% imshowMy(f_obr)
% title('�����������ع����ͼ�񣨽ṹԪ�أ�ʹ��һ����ˮƽ�ߣ�')

f_o = imopen(f,ones(1,71));
imshowMy(f_o)
title('������׼��������ͼ�񣨽ṹԪ�أ�ʹ��һ����ˮƽ�ߣ�')

f_thr = imsubtract(f,f_obr);
imshowMy(f_thr)
title('�����������ع����ͼ����ģͼ��')

f_th = imsubtract(f,f_o);
imshowMy(f_th)
title('������ñ�任���ͼ��')

g_obr = imreconstruct(imerode(f_thr,ones(1,11)),f_thr);
imshowMy(g_obr)
title('��[�����������ع����ͼ��]ʹ��һ��ˮƽ�߿������ع����ͼ��')

g_obrd = imdilate(g_obr,ones(1,21));
imshowMy(g_obrd)
title('ʹ��һ��ˮƽ�߶���һ��ͼ��������ͺ��ͼ��')

temp = min(g_obrd,f_thr);
imshowMy(temp)
title('���ͼ��')

f2 = imreconstruct(min(g_obrd,f_thr),f_thr);
imshowMy(f2)
title('�����ع����')

%% ��9.12 ʹ���ع�ɾ������ͼ��ı��������Ჽ�裩
clc
clear
f = imread('..\Pictures\images_ch09\Fig0930(a)(calculator).tif');
imshowMy(f)
title('ԭʼͼ��')

f_obr = imreconstruct(imerode(f,ones(1,71)),f);
imshowMy(f_obr)
title('������ʴ�����ع����ͼ�񣨽ṹԪ�أ�ʹ��һ����ˮƽ�ߣ�')

f_thr = imsubtract(f,f_obr);
imshowMy(f_thr)
title('�����������ع����ͼ����ģͼ��')

g_obr = imreconstruct(imerode(f_thr,ones(1,11)),f_thr);
imshowMy(g_obr)
title('��[�����������ع����ͼ��]ʹ��һ��ˮƽ�߿������ع����ͼ��')

g_obrd = imdilate(g_obr,ones(1,21));
imshowMy(g_obrd)
title('ʹ��һ��ˮƽ�߶���һ��ͼ��������ͺ��ͼ��')

temp = min(g_obrd,f_thr);
imshowMy(temp)
title('���ͼ��')

f2 = imreconstruct(min(g_obrd,f_thr),f_thr);
imshowMy(f2)
title('�����ع����')


%% ��̱ʼǸ�¼

%% ���л�����������ʽ�ȼ۱��ʵ��
���л����й�ʽ 1�� imerode(bw,se1) & ~imdilate(bw,reflect(se2))
���л����й�ʽ 2�� imerode(bw,se1) & imerode(~bw,se2)
%% ��̬ѧ�������ܽ�

1�� ���� imerode �� imdilate ������Ҫ��������̬ѧ������
    ��Ϊ�������е���������������ͨ���򵥵� &, |, ~, reflect, -, imerode��imdilate��ʵ�֡�
    ��� imerode��imdilate �ľ���ʵ������ͨ������ morphop ��ʵ�ֵġ�

    ��ǰ�˵Ļ����ϣ����ǵĹ���ֻ��Ҫ�����ֲ����Ĺ�ʽ���������壡

    ������Щ����ֻ��ֽ��̸����ǧ���ܺ��ӱ�̻�������

2�� imreconstruct imfill imclearborder ����������imfill imclearborder ��ʹ���� imreconstruct���� imreconstruct ��ͨ�� C++ ʵ�ֵġ�

3�� ��̬ѧ�ع������ã�ֻ���°����ṹԪ�صĶ���

4�� �Ҷ�ͼ����������ã����Գ�ȥ�ȽṹԪ�ظ�С������ϸ�ڣ�ͬʱ����ͼ������ĻҶȼ��ͽϴ���������򲻱䡣
    �Ҷ�ͼ�����������ã����Գ�ȥ�ȽṹԪ�ظ�С�İ���ϸ�ڣ�ͬʱ����ͼ������ĻҶȼ��ͽϴ�İ������򲻱䡣
   
5�� ��̬ѧƽ�����ȿ������ٱ����㣬����ͬʱ��ȥ��Ϊ�����Ͱ������ػ�������

6�� ��ñ�任��������ǿ��Ӱ��ϸ�ں����ô������ж����Ȳ�����ͼ�������Ȳ�����
    ��ñ�任�͵�ñ�任����ʹ�ã�������ǿ�Աȶȣ�
   
7�� �Ҷȼ���̬ѧ�ع����������������ȽṹԪ��С�Ķ��󣬶��Һܺõ�ά����ԭʼͼ���ò��   
   
8�� ��ͨ���ڽ�����������Ϸ������ź���Ҫ�����ã�����   

9�� ʹ��ͬ�������ӣ�һ���Ѿ����й�һ�Ρ�����������ͼ��������ٽ��ж��ٴΡ���������Ҳ�����б仯�ˡ����ڡ��ղ�����ͬ��֮��
    ����ͬһ��ͼ���ȿ��ٱա��͡��ȱ��ٿ����������������ͬ�ġ����ɴ˿�֪�������������͡��ղ��������������С�˳�򡱽�����
   
   
   
   
   
   
   
   