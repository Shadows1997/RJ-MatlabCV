I=imread('bacteria.bmp');
subplot(2,2,1),imshow(I),title('原图像');
I=double(I);%转换为double型，这样可以保存负值，否则unite8型会把负值截掉
w1=[-1 0;0 1];
w2=[0 -1;1 0];
G1=imfilter(I,w1,'corr','replicate');
G2=imfilter(I,w2,'corr','replicate');
G=abs(G1)+abs(G2);%计算Robert梯度
subplot(2,2,2),imshow(G,[]),title('Robert交叉梯度图像');
subplot(2,2,3),imshow(abs(G1),[]),title('w1滤波后取绝对值并重新标定');
subplot(2,2,4),imshow(abs(G2),[]),title('w1滤波后取绝对值并重新标定');


