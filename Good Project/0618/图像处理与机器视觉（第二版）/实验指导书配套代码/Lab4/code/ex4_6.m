%图像转置
A = imread('baby.jpg');
tform = maketform('affine',[0 1 0;1 0 0;0 0 1]);
B = imtransform(A,tform,'nearest');
%定义装置变换矩阵
subplot(1,2,1),imshow(A);
title('原图像');   
subplot(1,2,2),imshow(B);
title('图像转置');
