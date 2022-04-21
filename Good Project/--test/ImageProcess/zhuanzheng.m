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
%% 旋转平移归整化
[L num1]=bwlabel(w,8);%标记连通区域
D=regionprops(L,'all');%计算水平轴与椭圆长轴夹角（度数）描绘子%角度很准
%% 缩放 摆正 平移到质心
zhixin=D.Centroid;%取质心
x0=zhixin(2);%得质心所在行
y0=zhixin(1);%得质心所在列
[m,n]=size(w);%求图像大小

scale = 1;%缩放，1为 原比例
angle_rot = -round(D.Orientation);%摆正角度
x_shift=round(n/2-y0);%x轴方向为列方向和Centroid取值坐标一致，即x-n,y-m
y_shift=round(m/2-x0);%求行方向偏移量

% scale, rotate, and translate I1
I2 = im_rst(w, scale, angle_rot, x_shift, y_shift);%这是调用函数，用以得到变化后的结果图像

figure(1),%subplot(2,1,1),imshow(w),title('原图');
subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   