close all;                  %�رյ�ǰ����ͼ�δ��ڣ���չ����ռ��������������ռ����б���
clear all;
clc;
[A,map]=imread('01.bmp');  %����ͼ��
rect=[0 26 108 46];           %�����������
X1=imcrop(A,rect);              %����ͼ�����
set(0,'defaultFigurePosition',[100,100,1000,500]);%�޸�ͼ��ͼ��λ�õ�Ĭ������
set(0,'defaultFigureColor',[1 1 1])%�޸�ͼ�α�����ɫ������
subplot(121),imshow(A); %��ʾԭͼ��
rectangle('Position',rect,'LineWidth',2,'EdgeColor','r') %��ʾͼ���������
subplot(122),imshow(X1);   %��ʾ���е�ͼ�� 
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
imwrite(X1,[PathName,FileName]); 