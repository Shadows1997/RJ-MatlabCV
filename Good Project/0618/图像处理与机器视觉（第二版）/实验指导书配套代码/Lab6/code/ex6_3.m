clear all;
close all;
 
I=imread('baby_noise.bmp');
subplot(2,3,1),imshow(I),title('原图像');
h3_5=fspecial('gaussian',3,0.5);%sigma=0.5的3x3高斯模板
I3_5=imfilter(I,h3_5);
subplot(2,3,2),imshow(I3_5),title('3x0.5');

h3_8=fspecial('gaussian',3,0.8);%sigma=0.8的3x3高斯模板
I3_8=imfilter(I,h3_8);
subplot(2,3,3),imshow(I3_8),title('3x0.8');

h3_18=fspecial('gaussian',3,1.8);%sigma=1.8的3x3高斯模板，接近于平均模板
I3_18=imfilter(I,h3_18);
subplot(2,3,4),imshow(I3_18),title('3x1.8');

h5_8=fspecial('gaussian',5,0.8);%sigma=0.8的3x3高斯模板
I5_8=imfilter(I,h5_8);
subplot(2,3,5),imshow(I3_8),title('5x0.8');
imwrite(I5_8,'baby5_8.bmp');

h7_12=fspecial('gaussian',7,1.2);%sigma=0.8的3x3高斯模板
I7_12=imfilter(I,h7_12);
subplot(2,3,6),imshow(I7_12),title('7x1.2');
imwrite(I7_12,'baby7_12.bmp');
