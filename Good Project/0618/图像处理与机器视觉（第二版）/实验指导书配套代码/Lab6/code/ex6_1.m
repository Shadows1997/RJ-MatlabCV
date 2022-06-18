f=imread('pout.tif');%读入图像
imshow(f);
w=[1 1 1;1 1 1;1 1 1]/9 %滤波模板

g=imfilter(f,w,'corr','replicate');%滤波
figure,imshow(g);
