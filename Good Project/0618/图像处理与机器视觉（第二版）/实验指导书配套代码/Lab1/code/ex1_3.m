I = imread('01.jpg'); % ��ȡͼ��

% �ڲ�ͬ������ʾ
figure; %����һ���µĴ���
imshow(I); 
figure; 
imshow(I, [ ]);
% ����ͬ������ʾ
figure;
subplot(1, 2,1); 
imshow(I); 
subplot(1,2,2); 
imshow(I, [ ]);
