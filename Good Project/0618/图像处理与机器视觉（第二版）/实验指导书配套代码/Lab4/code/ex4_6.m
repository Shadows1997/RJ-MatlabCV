%ͼ��ת��
A = imread('baby.jpg');
tform = maketform('affine',[0 1 0;1 0 0;0 0 1]);
B = imtransform(A,tform,'nearest');
%����װ�ñ任����
subplot(1,2,1),imshow(A);
title('ԭͼ��');   
subplot(1,2,2),imshow(B);
title('ͼ��ת��');
