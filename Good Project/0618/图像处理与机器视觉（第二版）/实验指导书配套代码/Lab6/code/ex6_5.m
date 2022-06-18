I=imread('bacteria.bmp');
subplot(2,2,1),imshow(I),title('原图像');
I=double(I);
w1=[0 -1 0;-1 4 -1;0 -1 0]
L1=imfilter(I,w1,'corr','replicate');
w2=[-1 -1 -1;-1 8 -1;-1 -1 -1]
L2=imfilter(I,w2,'corr','replicate');
subplot(2,2,2),imshow(abs(L1),[]),title('w1模板');
subplot(2,2,3),imshow(abs(L2),[]),title('w2模板');
w3=[1 4 1;4 -20 4;1 4 1]
L3=imfilter(I,w3,'corr','replicate');
subplot(2,2,4),imshow(abs(L3),[]),title('w3模板');

