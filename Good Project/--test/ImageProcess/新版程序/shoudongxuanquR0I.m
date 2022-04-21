% clear all;close all;clc
I=imread('破损旋转剪切.jpg');
%  imtool(I)
[temp, rect] = imcrop(I);
figure,imshow(temp);
% figure(1),imshow(I),title('选取感兴趣区域，结束');
% BW=roipoly;
% Ir=double(I(:,:,1)).*double(BW);
% Ig=double(I(:,:,2)).*double(BW);
% Ib=double(I(:,:,3)).*double(BW);
% newI=cat(3,Ir,Ig,Ib); 
% figure(2),imshow(mat2gray(newI));
a=double(temp);
[x y z]=size(temp)
xy=x*y; %根据矩阵大小求出图片像素点个数, x,y分别是size(a)求得结果的前两项数字
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
