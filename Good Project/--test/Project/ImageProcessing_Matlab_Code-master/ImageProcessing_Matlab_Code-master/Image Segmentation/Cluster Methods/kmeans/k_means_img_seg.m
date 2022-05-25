%����k��ֵ�����㷨����ͼ��ָ�k_means
%����ѡ��������n
%��ʼ�������ĴӶ��������ѡȡ
%������ֹ����1.���ѭ������2.���������������
%���룺�ص���Ŀk�Ͱ���n����������ݿ�
%�����k���أ�ʹƽ�����׼����С
clc;
clear;
close all;
[filename,filepath]=uigetfile({'*.jpg';'*.png';'*.bmp'},'Iput an Image');
str=[filepath filename];
Img=imread(str);
Img=rgb2gray(Img);
[M N]=size(Img);
Img_o=zeros(M,N);

n=3;%�صĸ���������Ϊ���࣬����Ϊ2
e=0.01;%����ֹͣʹ�õ��������
k=zeros(1,n);
k_bar=zeros(1,n);%��Ŵ�ƽ��ֵ
k_pos=zeros(n,2);
for i=1:length(k)
    k_pos(i,1)=uint8(M*rand(1));
    k_pos(i,2)=uint8(N*rand(1));
    k(i)=Img(k_pos(i,1),k_pos(i,2));
end
d=zeros(1,length(k));%������ص��������ľ���
k
%���ʼ���׼����E��ֵ
%��ŷʽ���벢����
for i=1:M
    for j=1:N
        for dim=1:length(k)
            d(dim)=abs(double(Img(i,j))-double(k(dim)));
        end
        temp=min(d);
        Img_o(i,j)=find(d==temp,1,'first');
    end
end
for i=1:length(k)
    Img_o(k_pos(i))=i;
end
% figure,imshow(Img_o,[]);
%��ƽ��ֵ
for i=1:length(k)
    temp=find(Img_o==i);
    k_bar(i)=sum(Img(temp))/numel(temp);
end
k_bar
%E
E=0;
for i=1:length(k)
    temp=find(Img_o==i);
    j=(double(Img(temp))/255-double(k_bar(i))/255).^2/numel(temp);
    E=E+sum(j);
end
E
%����ֱ������
while E>e
    for i=1:M
        for j=1:N
            for dim=1:length(k)
                d(dim)=abs(double(Img(i,j))-double(k_bar(dim)));
            end
            temp=min(d);
            Img_o(i,j)=find(d==temp,1,'first');
        end
    end
    for i=1:length(k)
        temp=find(Img_o==i);
        k_bar(i)=sum(Img(temp))/numel(temp);
    end
    E=0;
    for i=1:length(k)
        temp=find(Img_o==i);
        j=(double(Img(temp))/255-double(k_bar(i))/255).^2/numel(temp);
        E=E+sum(j);
    end
    k_bar
    E
end

%��ʾ���
figure,imshow(Img_o,[]);



