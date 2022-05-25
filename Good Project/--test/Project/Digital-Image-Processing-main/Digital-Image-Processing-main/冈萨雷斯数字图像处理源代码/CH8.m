%% �ڰ��� ͼ��ѹ��

%% ����ѹ��ǰ������ compare P213
clc
clear
f1 = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');
imshowMy(f1)
imfinfoMy(f1)

f12 = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).jpg'); % Ʒ��Ϊ12ʱ
imshowMy(f12)
imfinfoMy(f12)

f05 = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy05).jpg'); % Ʒ��Ϊ5ʱ
imshowMy(f05)
imfinfoMy(f05)

rmes12 = compare(f1,f12)

rmes05 = compare(f1,f05,15)

%% ��8.1 entropy ��
clc
clear

f = [119 123 168 119; 123 119 168 168];
f = [f;119 119 107 119; 107 107 119 119]
[p x] = hist(f(:),8)
hist(f(:),8)
p = p/sum(p)
h = entropy(f)
c = huffman(hist(double(f(:)),4))

cp = huffman([0.1875 0.5 0.125 0.1875])

%% ��8.2 dec2bin huffman mat2huff P222
clc
clear

% f2 = uint8([2 3 4.3 2; 3 2 9 4; 2 2 1 2; 1 1 2 2])
f2 = [2 3 4.3 2; 3 2 9.8 4; 2 2 1 2; 1 1 2 2]
R1 = whos('f2')

c = huffman(hist(double(f2(:)),5))

% h1f2 = c(f2(:))'
% whos('h1f2')
% 
% h2f2 = char(h1f2)'
% whos('h2f2')
% 
% % 1010011000011011
% %  1 11  1001  0  
% %  0 10  1  1     
% 
% h2f2 = h2f2(:);
% h2f2(h2f2 == ' ') = [];
% h2f2
% whos('h2f2')

h3f2 = mat2huff(f2) % ����
whos('h3f2')

g = huff2mat(h3f2) % ���� ע����벢������ 4.3������Ϊ4, 9.8������Ϊ10

hcode = h3f2.code;
R2 = whos('hcode')

dec2bin(double(hcode))

ratio = R1.bytes/R2.bytes % �ֲڵ�ѹ������
% dec2bin(9)

%% cell ???
clc
clear
X = cell(2, 3)

X{1}= {8,9}
X{1}
X(1)

X{2} = 5 % �ȼ��� X{2} = {5}or[5]
X{2}
X(2)

X(3) = {6} % �ȼ��� X[3] = {[6]} ע�⣺6or[6]���Ǵ����
X{3}
X(3)


X(4) = {[7 9]}
X{4}
X(4)

X{5} = {[10,11]}
X{5}
X(5)

X{6} = [12,13]
X{6}
X(6)

celldisp(X)
cellplot(X)


%% ��ȥ��һ��Ԫ�ص�ʵ�ַ���
clc
clear
p = [1 2 3 4]
p(1) = []
p

%% ��8.2 �䳤��ӳ��
clc
clear

f2 = uint8([236 3 4 2; 3 2 4 4; 2 2 100 2; 1 1 2 2])
whos('f2')

c = huffman(hist(double(f2(:)),6))


h3f2 = mat2huff(f2)
whos('h3f2')

% **************************************
hcode = h3f2.code
whos('hcode')

% �������
% h3f2 = 
% 
%     size: [4 4]                �����С��̬
%      min: 32769                ������Сֵ
%     hist: [1x236 uint16]       ��Сֵ�����ֵ֮��ķֲ�
%     code: [5419 11655 30720]   �Ծ�����ϵ��¡������ұ���õ��Ľ��

% **************************************

dec2bin(double(hcode))




%% ��8.3 ʹ��mat2huff���б���
clc
clear

f = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');
c = mat2huff(f);
cr1 = imratio(f,c)

save ..\Data\SqueezeTracy c;
cr2 = imratio('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif','..\Data\SqueezeTracy.mat')


%% ��8.4 ʹ��huff2mat����
clc
clear
load ..\Data\SqueezeTracy.mat
g = huff2mat(c);
f = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');
rmse = compare(f,g)




%% ��8.5 ����Ԥ�����
clc
clear

f = imread('..\Pictures\images_ch08\Fig0807(c)(Aligned).tif');
imshowMy(f)

fShang = entropy(f)
imfinfoMy(f)
c0 = mat2huff(double(f));
cfShang = entropy(c0.code)
cfr = imratio(f,c0)

% *************** ���� ********
e = mat2lpc(f);
imfinfoMy(e)
imshowMy(mat2gray(e));
eShang = entropy(e)
cer = imratio(f,uint8(e))

c = mat2huff(e);
ceShang = entropy(c.code)
cr = imratio(f,c)
% ****************************

% *************** ���� ********
ee = huff2mat(c);
ff = lpc2mat(ee);
imshowMy(ff,[])
% ****************************

[h,x] = hist(e(:)*512,512);
figure,bar(x,h,'k')
set(gcf,'outerposition',get(0,'screensize'))
title('Ԥ������ֱ��ͼ')

g = lpc2mat(huff2mat(c));
compare(f,g) % ����ǰ��ͼ���������

%% ��8.6
clc
clear






%% ��8.7 ��������Ԥ��ͻ���������Ļ��IGS������16��
clc
clear
f = imread('..\Pictures\images_ch08\Fig0810(a)(Original).tif');
imshowMy(f)
title('ԭʼͼ��')
imfinfoMy(f)

imshowMy(f, 16)
title('��������Ϊ16���Ҷ�ͼ��')

% ********************************
% [Y, newmap] = imapprox(f,16);
% imshowMy(Y, newmap)
% title('����ͼ��16ɫ��')
% 
% % Y = grayslice(mat2gray(double(f)),16);
% % imshowMy(Y)
% % title('����ͼ��16ɫ��')
% 
% Y= ind2gray(f,16);
% imshowMy(Y, newmap)
% title('����ͼ��16ɫ��')
% ********************************

q = quantize(f,4,'igs');
imshowMy(q,[])
imfinfoMy(q)
title('(�Ľ��ĻҶȼ�����)IGS����Ϊ16���Ҷ�ͼ��')

qs = double(q)/16;
imshowMy(qs,[])
imfinfoMy(qs)
title('IGS����Ϊ16���Ҷ�ͼ��')

e = mat2lpc(qs);
c = mat2huff(e);
cr = imratio(f,c)
% ------------------
ne = huff2mat(c);
nqs = lpc2mat(ne);
% imshowMy(nqs)
nq = 16*nqs;
% imshowMy(nq,[])

compare(q,nq)
 
rmes = compare(f,nq)

%% ��8.7 ��������Ԥ��ͻ���������Ļ��IGS������8��
clc
clear
f = imread('..\Pictures\images_ch08\Fig0810(a)(Original).tif');
imshowMy(f)
title('ԭʼͼ��')
imfinfoMy(f)

imshowMy(f, 8)
title('��������Ϊ8���Ҷ�ͼ��')



q = quantize(f,3,'igs');
imshowMy(q,[])
imfinfoMy(q)
title('(�Ľ��ĻҶȼ�����)IGS����Ϊ8���Ҷ�ͼ��')

qs = double(q)/32;
imshowMy(qs,[])
imfinfoMy(qs)
title('IGS����Ϊ8���Ҷ�ͼ��')

e = mat2lpc(qs);
c = mat2huff(e);
cr = imratio(f,c)
% ------------------
ne = huff2mat(c);
nqs = lpc2mat(ne);
% imshowMy(nqs)
nq = 32*nqs;
% imshowMy(nq,[])

compare(q,nq)
 
rmes = compare(f,nq)

%% ��8.7 ��������Ԥ��ͻ���������Ļ��IGS������32��
clc
clear
f = imread('..\Pictures\images_ch08\Fig0810(a)(Original).tif');
imshowMy(f)
title('ԭʼͼ��')
imfinfoMy(f)

imshowMy(f, 32)
title('��������Ϊ32���Ҷ�ͼ��')



q = quantize(f,5,'igs');
imshowMy(q,[])
imfinfoMy(q)
title('(�Ľ��ĻҶȼ�����)IGS����Ϊ32���Ҷ�ͼ��')

qs = double(q)/8;
imshowMy(qs,[])
imfinfoMy(qs)
title('IGS����Ϊ32���Ҷ�ͼ��')

e = mat2lpc(qs);
c = mat2huff(e);
cr = imratio(f,c)
% ------------------
ne = huff2mat(c);
nqs = lpc2mat(ne);
% imshowMy(nqs)
nq = 8*nqs;
% imshowMy(nq,[])

compare(q,nq)
 
rmes = compare(f,nq)

%% ��8.8 im2jpeg JPEG ѹ�� DCT ��ɢ����
clc
clear

f = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');
imshowMy(f)

c1 = im2jpeg(f);
f1 = jpeg2im(c1);
imshowMy(f1)

imratio(f,c1)

compare(f,f1,3)

c4 = im2jpeg(f,4);
f4 = jpeg2im(c4);
imshowMy(f1)

imratio(f,c4)

compare(f,f4,3)

whos

%% ��8.8 im2jpeg JPEG ѹ�� DCT ��ɢ����(����ʾͼƬ)
clc
clear

f = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');

c1 = im2jpeg(f);
% f1 = jpeg2im(c1);
imratio(f,c1)

% compare(f,f1,3)

c4 = im2jpeg(f,4);
% f4 = jpeg2im(c4);
imratio(f,c4)

% compare(f,f4,3)

c8 = im2jpeg(f,8);
% f8 = jpeg2im(c8);
imratio(f,c8)

%% ��8.9
clc
clear
f = imread('..\Pictures\images_ch08\Fig0804(a)(Tracy).tif');
imshowMy(f)

c1 = im2jpeg2k(f,5,[8 8.5]);
f1 = jpeg2k2im(c1);
imshowMy(f1)
rms1 = compare(f,f1)
cr1 = imratio(f,c1)

c2 = im2jpeg2k(f,5,[8 7]);
f2 = jpeg2k2im(c2);
imshowMy(f2)
rms2 = compare(f,f2)
cr2 = imratio(f,c2)

c3 = im2jpeg2k(f,1,[1 1 1 1]);
f3 = jpeg2k2im(c3);
imshowMy(f3)
rms3 = compare(f,f3)
cr3 = imratio(f,c3)

whos

%%
clc
clear

      �����ݸ�ͷ��
         -- ��Т�� 
  
�������ϣ�����çȻƽ�� 
��������˪�羢���ı������������� 
׷�뵱���£���������������������ϣ��Ҹ�أ������ȡ� 
��ˮձ�磬����ţ���£������ݺᡣ 
���������ԣ����һ�������չı�����ǲ�˾��� 

���������ϻ�н����հ�󼣬���γɡ� 
ʱ��ʧ����ͽ׳���꽫�㡣���񾩡� 
���𷽻�Զ�������ݣ����ݱ��� 
�ڸ�ʹ���׳��ͣ���Ϊ�顣 
�ŵ���ԭ���ϣ���������������캡� 
ʹ���˵��ˣ��ҷ������ߣ��������㣡 






