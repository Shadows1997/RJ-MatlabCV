clear all
clc
I8 = imread('011.BMP');
I8=im2bw(I8);
% I = rgb2gray(I);  % ��ͼ����лҶȴ������ǣ�������
[m n]=size(I8); % m n�ֱ�Ϊͼ����� ����
%--- ���д�ֱ�Ҷ�ͶӰ
for y=1:n
     V(y)=sum(I8(1:m,y));
end
y=1:n;
figure
subplot(211), plot(y,V(y));
title('��ֱ�Ҷ�ͶӰ');
% ����ˮƽ�Ҷ�ͶӰ
for x=1:m
    L(x)=sum(I8(x,:));
end
x=1:m;
subplot(212),plot(x,L(x));
title('ˮƽ�Ҷ�ͶӰ');