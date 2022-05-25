%% �ڶ��� ����ԭ��

%% imshow �����̬��Χ��С����
clc
clear

I = imread('..\Pictures\images_ch02\Fig0203(a)(chest-xray).tif');
figure,subplot(121),imshow(I),subplot(122),imhist(I) 
axis tight

% ��̬��Χ�ϵ�
class(I)
min(I(:))  
max(I(:))

figure,imshow(I,[])



%% ����ͼ��
clc
clear

f = imread('..\Pictures\images_ch02\Fig0206(a)(rose-original).tif');
imshow(f)
print -f1 -dtiff -r300 hi_res_rose
% ���浽 G:\DIPUsingMATLAB\MFiles

%% im2uint8
clc
clear
f1 = [-0.5 0.5
     0.75 1.5]
g1 = im2uint8(f1)

f2 = uint8(f1*100)
g2 = im2uint8(f2)

f3 = f1*100
g3 = im2uint8(f3)

f4 = uint16(f1*50000)
g4 = im2uint8(f4)

%% im2bw �Ҷ�ͼ���Ϊ��ֵͼ��
clc
clear

I = imread('liftingbody.png');
imshow(I)

BW = im2bw(I,0.46);

figure,imshow(BW)

%% imabsdiff ��������ͼ���ľ��Բ�
clc
clear

I = imread('cameraman.tif');
imshow(I,[])
J = uint8(filter2(fspecial('gaussian'), I));
imshow(J,[])
K = imabsdiff(I,J);
imshow(K,[]) % [] = scale data automatically

%% imcomplement ��ͼ����
clc
clear

bw = imread('text.png');
bw2 = imcomplement(bw);
subplot(1,2,1),imshow(bw)
subplot(1,2,2),imshow(bw2)


%% im2double
clc
clear
f1 = [-0.5 0.5
     0.75 1.5]
g1 = im2double(f1)

f22 = uint8(f1)
f2 = uint8(f1*100)
g2 = im2double(f2)

f3 = f1*100
g3 = im2double(f3)

f4 = uint16(f1*50000)
g4 = im2double(f4)

%% ����ת�á�ת��
clc
clear
f1 = [-0.5+3*i 0.5+2*i
     0.75 1.5]
f1'   % ����ת��
f1.'  % ת��




%% ����������������������ͳͳ���в�����
clc
clear
f1 = [-0.5+3*i 0.5+2*i
     0.75 1.5
     0.6 2+5*i]
f1(:)  % ������������

f1(1:end) % ������������

f1(1:2:end)

f1([1 4 5]) % һ��������Ϊ��һ������������

%% linspace
clc
clear
x = linspace(0,1,5)

%% һ�ּ�Ϊ���õ��߼�����Ѱַ!!!
clc
clear
A = [1 2 3
     4 5 6
     7 8 9]
I =[1 0 0
    0 0 1
    1 0 0];

D = logical(I)

A(D)
B = A
B(D) = 0;
B

%% magic��double����
clc
clear

f1 = magic(5)
g1 = im2uint8(f1)

f2 = uint8(magic(5))
g2 = im2uint8(f2)




%% 
clc
clear

A = [1 2
     3 4 ]
B = A

B = 3
A

A = []
B



%%
clc
clear

A = [1 2
     3 4 ]
B = [8 9
    12 23]
A + B

A1 = uint8(A*100)
B1 = uint8(B*100)
A1 + B1

imadd(A1,B1)

%% max
clc
clear

A = [3 2
    0.6 0.5
     1 4 ]
[C,I] = max(A)
[C,I] = max(A,[],1)
[C,I] = max(A,[],2)



%%
clc
clear

eps

realmax

realmin

computer

version % MATLAB�汾


error('��ã���Ҫ�¡�')

A = [3 2
    0.6 0.5
     1 4 ]

%% twodsin �������㷨�Ż�ʱ��
clc
clear
[rt,f,g] = twodsin(1,1/(4*pi),1/(4*pi),1024,1024);





%% meshgrid ��Ϊ��Ҫ����������������
clc
clear

c = [1 2 3]
r = [1 2 3 4 5]
[C,R] = meshgrid(c,r)




%% input ����ʽ����
clc
clear

reply = input('Do you want more? Y/N [Y]: ','s');
if isempty(reply)
    reply = 'Y';
end




%% input
clc
clear
reply = input('Enter your data: ','s')

class(reply)
size(reply)

n = str2num(reply)

class(n)
size(n)

%% strread
clc
clear

t = '12.6, x2y, z';
[a b c] = strread(t,'%f%q%q','delimiter',',')

%% str2num  ��μ�P43�ľ�������

clc
clear

str2num(['1 2';'3 4'])



%% �ṹ
clc
clear

s.zxr = 5;
s.jie = 6;
s.child = '56h';

s
s.child
class(s.child)




%% Matlab����μ���������е�ʱ�䣿
clc
clear



        tic
          your_code;
        toc
        ����ʹ��
        t=cputime; 
          your_operation; 
        cputime-t


%% tic toc

for n = 1:100
    A = rand(n,n);
    b = rand(n,1);
    tic
    x = A\b;
    t(n) = toc;
end
plot(t)


