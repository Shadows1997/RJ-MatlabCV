I=imread('baby.bmp');
subplot(2,2,1),imshow(I),title('ԭͼ��');
Id=double(I);
h_lap=[-1 -1 -1;-1 8 -1;-1 -1 -1]%������˹����
I_lap=imfilter(Id,h_lap,'corr','replicate');
subplot(2,2,2),imshow(uint8(abs(I_lap)),[]),title('Laplacian��ͼ������������');%ȡ����ֵ������255���ϵ���Ӧ�ض�
h_log=fspecial('log',5,0.5);%��СΪ5��sigmaΪ0.5��LoG����
I_log=imfilter(Id,h_log,'corr','replicate');
subplot(2,2,3),imshow(uint8(abs(I_log)),[]),title('��LoG������ͼ��sigma=0.5');
h_log=fspecial('log',5,2);
I_log=imfilter(Id,h_log,'corr','replicate');
subplot(2,2,4),imshow(uint8(abs(I_log)),[]),title('��LoG������ͼ��sigma=2');
