I=imread('baby.bmp');
subplot(2,2,1),imshow(I),title('原图像');
Id=double(I);
h_lap=[-1 -1 -1;-1 8 -1;-1 -1 -1]%拉普拉斯算子
I_lap=imfilter(Id,h_lap,'corr','replicate');
subplot(2,2,2),imshow(uint8(abs(I_lap)),[]),title('Laplacian锐化图像，噪声较明显');%取绝对值，并将255以上的响应截断
h_log=fspecial('log',5,0.5);%大小为5，sigma为0.5的LoG算子
I_log=imfilter(Id,h_log,'corr','replicate');
subplot(2,2,3),imshow(uint8(abs(I_log)),[]),title('经LoG处理后的图像，sigma=0.5');
h_log=fspecial('log',5,2);
I_log=imfilter(Id,h_log,'corr','replicate');
subplot(2,2,4),imshow(uint8(abs(I_log)),[]),title('经LoG处理后的图像，sigma=2');
