% clear all;close all;clc
I=imread('������ת����.jpg');
%  imtool(I)
[temp, rect] = imcrop(I);
figure,imshow(temp);
% figure(1),imshow(I),title('ѡȡ����Ȥ���򣬽���');
% BW=roipoly;
% Ir=double(I(:,:,1)).*double(BW);
% Ig=double(I(:,:,2)).*double(BW);
% Ib=double(I(:,:,3)).*double(BW);
% newI=cat(3,Ir,Ig,Ib); 
% figure(2),imshow(mat2gray(newI));
a=double(temp);
[x y z]=size(temp)
xy=x*y; %���ݾ����С���ͼƬ���ص����, x,y�ֱ���size(a)��ý����ǰ��������
r=a(:,:,1);
g=a(:,:,2);
b=a(:,:,3);
R=sum(sum(r));
G=sum(sum(g));
B=sum(sum(b));
AR=R/xy
AG=G/xy
AB=B/xy
% [FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
%                                  '*.bmp','Bitmap(*.bmp)';...  
%                                  '*.gif','GIF(*.gif)';...  
%                                  '*.*',  'All Files (*.*)'},...  
%                                  'Save Picture','Untitled');  
% imwrite(temp,[PathName,FileName]); 
