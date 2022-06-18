I=imread('baby_noise.bmp');
figure,imshow(I)%原图
h=fspecial('average',3);%3x3平均模板
I3=imfilter(I,h,'corr','replicate');%相关滤波，重复填充边界
figure,imshow(I3)
h=fspecial('average',5)%5x5平均模板
I5=imfilter(I,h,'corr','replicate');
figure,imshow(I5)
h=fspecial('average',7);%7x7平均模板
I7=imfilter(I,h,'corr','replicate');
figure,imshow(I7)

