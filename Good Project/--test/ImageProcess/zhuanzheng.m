w=imread('22.bmp');
% w=im2bw(bw1);
imtool(w)
[L num] = bwlabel(w);
for i=1:num
   if numel(find(L==i)) < 1000
       w(L==i) =0;
   end
end 
% w=~w;
[L num] = bwlabel(w);
for i=1:num
   if numel(find(L==i)) < 1000
       w(L==i) =0;
   end
end 
imtool(w)
% w=imread(m);   
%% ��תƽ�ƹ�����
[L num1]=bwlabel(w,8);%�����ͨ����
D=regionprops(L,'all');%����ˮƽ������Բ����нǣ������������%�ǶȺ�׼
%% ���� ���� ƽ�Ƶ�����
zhixin=D.Centroid;%ȡ����
x0=zhixin(2);%������������
y0=zhixin(1);%������������
[m,n]=size(w);%��ͼ���С

scale = 1;%���ţ�1Ϊ ԭ����
angle_rot = -round(D.Orientation);%�����Ƕ�
x_shift=round(n/2-y0);%x�᷽��Ϊ�з����Centroidȡֵ����һ�£���x-n,y-m
y_shift=round(m/2-x0);%���з���ƫ����

% scale, rotate, and translate I1
I2 = im_rst(w, scale, angle_rot, x_shift, y_shift);%���ǵ��ú��������Եõ��仯��Ľ��ͼ��

figure(1),%subplot(2,1,1),imshow(w),title('ԭͼ');
subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   