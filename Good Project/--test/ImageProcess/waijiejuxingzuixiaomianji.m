
clear,clc
RGB = imread('1245.png');
figure,imshow(RGB);
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);
figure,imshow(bw)
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);

% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);

% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');

figure,imshow(bw)
ed=edge(bw);
figure,imshow(ed)
%%%%%以上是图像二值化 上面制作二值化图像
L = bwlabel(bw);
L1 = bwlabel(ed);
Ar=zeros(1,max(L(:)));
perimeter=zeros(1,max(L1(:)));
metric=zeros(1,max(L1(:)));
Pwl=zeros(1,max(L1(:)));
Pr=zeros(1,max(L1(:)));
for i=1:max(L(:))
Ar(i)=sum(bw(L==i));
perimeter(i)=sum(ed(L==i));
metric(i) = 4*pi*Ar(i)/perimeter(i)^2;
[r,c]=find(L==i);


% 'a'是按面积算的最小矩形，如果按边长用'p'
[rectx,recty,area,perimeter] = minboundrect(c,r,'p'); 
hold on
line(rectx,recty);
end
