A = imread('rectangle.bmp');
B = imrotate(A,30,'nearest');
C = imrotate(A,30,'bilinear');
D = imrotate(A,30,'bicubic');

subplot(2,2,1),imshow(A);
title('ԭͼ��');
subplot(2,2,2),imshow(B);
title('����ڲ�ֵ');
subplot(2,2,3),imshow(C);
title('˫���Բ�ֵ');
subplot(2,2,4),imshow(D);
title('˫���β�ֵ');

