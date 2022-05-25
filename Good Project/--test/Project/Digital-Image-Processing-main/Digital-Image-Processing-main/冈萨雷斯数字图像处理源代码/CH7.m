%% ������ С��

%% ��7.1 wfilters wavefun waveinfo �����ٶȺ�����
clc
clear

% Set wavelet name. 
% wname = 'sym2';
wname = 'haar';

% Compute the four filters associated with wavelet name given 
% by the input string wname. 
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wname);
subplot(221); stem(Lo_D); 
title('Decomposition low-pass filter'); 
subplot(222); stem(Hi_D); 
title('Decomposition high-pass filter'); 
subplot(223); stem(Lo_R); 
title('Reconstruction low-pass filter'); 
subplot(224); stem(Hi_R); 
title('Reconstruction high-pass filter'); 
xlabel('The four filters for db5')

% Editing some graphical properties,
% the following figure is generated.

[phi,psi,xval] = wavefun(wname,10);
xaxis = zeros(size(xval));
figure,subplot(121);plot(xval,phi,'k',xval,xaxis,'--k');
% axis([-0.02 1.01 -1.5 1.5]);axis square;
title('Scaling Function');
subplot(122);plot(xval,psi,'k',xval,xaxis,'--k');
% axis([-0.02 1.01 -1.5 1.5]);axis square;
title('Wavelet Function');


%% wavefun
clc
clear

% [PHI1,PSI1,PHI2,PSI2,XVAL] = wavefun('haar');
[PHI1,PSI1,XVAL] = wavefun('haar');

waveinfo('haar')

%% ��7.2 wavedec2
clc
clear

f = magic(8)

[c0,s0] = wavedec2(f,0,'haar')

[c1,s1] = wavedec2(f,1,'haar')

[c2,s2] = wavedec2(f,2,'haar')

[c3,s3] = wavedec2(f,3,'haar')

[c4,s4] = wavedec2(f,4,'haar')

[c10,s10] = wavedec2(f,10,'haar');

%% ��7.3 wavefast fwtcompare
clc
clear

f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');

[ratio maxdifference] = fwtcompare(f,6,'db4')




%% ��7.4 wavedec2  appcoef2 detcoef2 ��ֵ������
clc
clear

f = magic(8)

[c3,s3] = wavedec2(f,3,'haar')

approx = appcoef2(c3,s3,'haar')
approx0 = appcoef2(c3,s3,'haar',0)
approx1 = appcoef2(c3,s3,'haar',1)
approx2 = appcoef2(c3,s3,'haar',2)
approx3 = appcoef2(c3,s3,'haar',3)

horizdet3 = detcoef2('h',c3,s3,3)
horizdet2 = detcoef2('h',c3,s3,2)
horizdet1 = detcoef2('h',c3,s3,1)
% horizdet0 = detcoef2('h',c3,s3,0) % ����ģ�ϸ��û����0�׵�

newc3 = wthcoef2('h',c3,s3,2);
newhorizdet2 = detcoef2('h',newc3,s3,2)

% Ӳ��ֵ
newc3 = wthcoef2('d',c3,s3,1,46,'h'); % ��ֵ��46
newdiagon1_hard = detcoef2('d',newc3,s3,1)
% ����ֵ
newc3 = wthcoef2('d',c3,s3,1,46,'s'); % ��ֵ��46
newdiagon1_soft = detcoef2('d',newc3,s3,1)

%% ��7.5 wavecut wavecopy(ʹ�ñ����Դ��ĺ���)
clc
clear

f = magic(8)

[c3,s3] = wavedec2(f,3,'haar')

approx = wavecopy('a',c3,s3)
approx1 = wavecopy('a',c3,s3,1) % û���ع���ֻ����ȡ���Ľ��ƣ�����appcoef2ǿ��

horizdet = wavecopy('h',c3,s3) % Ĭ��ʱ����ȡ��һ��ϸ��ϵ��
horizdet3 = wavecopy('h',c3,s3,3)
horizdet2 = wavecopy('h',c3,s3,2)

[newc3,horizdet2] = wavecut('h',c3,s3,2)
newhorizdet2 = wavecopy('h',newc3,s3,2)


%% ��7.6 һ��ֽ� �Ӵ�
clc
clear
f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');
[c,s] = wavefast(f,1,'db4'); % һ��ֽ�
wave2gray(c,s);
title('[db4]�Զ�����')

figure,wave2gray(c,s,8);
title('[db4]ϸ��ϵ��8���Ŵ�')

figure,wave2gray(c,s,-8);
title('[db4]ϸ��ϵ��8���Ŵ�ľ���ֵ')


%% ��7.6  ����ֽ� �Ӵ�
clc
clear
f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');
[c,s] = wavefast(f,2,'db4'); % ����ֽ�
s

wave2gray(c,s);
title('[db4]�Զ�����')

figure,wave2gray(c,s,8);
title('[db4]ϸ��ϵ��8���Ŵ�')

figure,wave2gray(c,s,-8);
title('[db4]ϸ��ϵ��8���Ŵ�ľ���ֵ')

%% ��7.6  ����ֽ� �Ӵ� haar
clc
clear
f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');
[c,s] = wavefast(f,2,'haar'); % ����ֽ�
wave2gray(c,s);
title('[haar]�Զ�����')

figure,wave2gray(c,s,8);
title('[haar]ϸ��ϵ��8���Ŵ�')

figure,wave2gray(c,s,8,'append');
title('[haar]ϸ��ϵ��8���Ŵ�ʹ�� append ������')

figure,wave2gray(c,s,-8);
title('[haar]ϸ��ϵ��8���Ŵ�ľ���ֵ')

%% ��7.7 �ؽ�ͼ�� waveback waverec2
clc
clear

f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');
imshowMy(f)

[c,s] = wavefast(f,2,'haar'); % ����ֽ�
figure,wave2gray(c,s);
title('[haar]�Զ�����')

g = waveback(c,s,'haar');
g = uint8(g);
imshowMy(g)

g1 = waverec2(c,s,'haar');
g1 = uint8(g1);
imshowMy(g1)

%% ��7.8 С���ķ����Ժͱ�Ե��� P207
clc
clear
f = imread('..\Pictures\images_ch07\Fig0707(a)(Original).tif');
imshow(f);
title('ԭʼ����ͼ��')

[c s] = wavefast(f,1,'sym4');
figure,wave2gray(c,s,-6);
title('[sym4]С���任���')

[nc,y] = wavecut('a',c,s);
figure,wave2gray(nc,s,-6);
title('�����н���ϵ������Ƶ���֣�����Ϊ0�ı任')

edges = abs(waveback(nc,s,'sym4'));
figure;imshow(mat2gray(edges));
title('���㷴�任�ľ���ֵ���õ��ı�Ե����Ƶϸ�ڣ�ͼ��')

%% ��7.8 С���ķ����Ժͱ�Ե���
clc
clear
f = imread('..\Pictures\images_ch07\Fig0707(a)(Original).tif');
imshow(f);
[c s] = wavefast(f,1,'sym4');
figure,wave2gray(c,s);

[nc,y] = wavecut('a',c,s);
figure,wave2gray(nc,s);

edges = abs(waveback(nc,s,'sym4'));
figure;imshow(mat2gray(edges));

%% ��7.9 ����С����ͼ��ƽ����ģ��
clc
clear
f = imread('..\Pictures\images_ch07\Fig0707(a)(Original).tif');
imshow(f);
title('ԭʼ����ͼ��')

[c s] = wavefast(f,4,'sym4');
figure,wave2gray(c,s,20);
title('[sym4]С���任������Ĵηֽ⣩')

[c,g8] = wavezero(c,s,1,'sym4');
title('������һ����ϸ��ϵ������Ϊ0��ķ��任')

[c,g8] = wavezero(c,s,2,'sym4');
title('����һ��������ϸ��ϵ������Ϊ0��ķ��任')

[c,g8] = wavezero(c,s,3,'sym4');
title('����һ������������ϸ��ϵ������Ϊ0��ķ��任')

[c,g8] = wavezero(c,s,4,'sym4');
title('����һ�����������ļ���ϸ��ϵ������Ϊ0��ķ��任')


%% ��7.9 ����С����ͼ��ƽ����ģ��
clc
clear
f = imread('..\Pictures\images_ch07\Fig0707(a)(Original).tif');
imshow(f);
title('ԭʼ����ͼ��')

[c0 s] = wavefast(f,4,'sym4');
figure,wave2gray(c0,s,20);
title('[sym4]С���任������Ĵηֽ⣩')

[c,g8] = wavezero(c0,s,1,'sym4');
title('������һ����ϸ��ϵ������Ϊ0��ķ��任��ȥ�����۲��׾�������ĸ�Ƶϸ�ڣ�')

[c,g8] = wavezero(c0,s,2,'sym4');
title('�����ڶ�����ϸ��ϵ������Ϊ0��ķ��任')

[c,g8] = wavezero(c0,s,3,'sym4');
title('������������ϸ��ϵ������Ϊ0��ķ��任')

[c,g8] = wavezero(c0,s,4,'sym4');
title('�������ļ���ϸ��ϵ������Ϊ0��ķ��任')





%% ��7.10 �����ع�
clc
clear
f = imread('..\Pictures\images_ch07\Fig0709(original_strawberries).tif');
imshow(f)

[c s] = wavefast(f,4,'jpeg9.7');
figure,wave2gray(c,s,8);

f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

[c s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

[c s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

[c s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

[c s] = waveback(c,s,'jpeg9.7',1);
f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

%% ��7.10 �����ع�
clc
clear
f = imread('..\Pictures\images_ch07\Fig0704(Vase).tif');
imshow(f)

[c s] = wavefast(f,4,'jpeg9.7');
figure,wave2gray(c,s,8);

% f = wavecopy('a',c,s);
% figure;imshow(mat2gray(f));

[c s] = waveback(c,s,'jpeg9.7',4);
f = wavecopy('a',c,s);
figure;imshow(mat2gray(f));

%% 
clc
clear

��������������ƽ����
    --- �����

����ƽ���� 
����� ƽ������ �ǿ����� 
��·����˭ο�� ĸ�ϼ�ƶ���� 
�ǲ��� ��ǰ���� 
���Ȳ���Ӧ���� ���������Ƹ����� 
����ѩ ������ 

���Ī��ţ��͸ 
������ ��Ȼ���� �����ܹ� 
���ƺ��ն����� ��������� 
ֻ���� �ຮ���� 
إ�ذ����һŵ ����ͷ�������� 
�ô��� ������ 

����Ʈ��� 
ʮ���� ������� ����ʦ�� 
�������������� �Կ��������� 
������ ҹ������ 
��������֪���� ���������������� 
ǧ��� Ϊ���� 

������δ�ᶡ�� 
��Щʱ ��˪���� ��˥���� 
ʫ���ӽ������� ��ȡ�Ļ����� 
��Ը�ú������� 
���ռ��������� �ѿ���������� 
�Բ��� �۶��� 







