close all;                  %关闭当前所有图形窗口，清空工作空间变量，清除工作空间所有变量
clear all;
clc;
[A,map]=imread('01.bmp');  %读入图像
rect=[0 26 108 46];           %定义剪切区域
X1=imcrop(A,rect);              %进行图像剪切
set(0,'defaultFigurePosition',[100,100,1000,500]);%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])%修改图形背景颜色的设置
subplot(121),imshow(A); %显示原图像
rectangle('Position',rect,'LineWidth',2,'EdgeColor','r') %显示图像剪切区域
subplot(122),imshow(X1);   %显示剪切的图像 
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
imwrite(X1,[PathName,FileName]); 