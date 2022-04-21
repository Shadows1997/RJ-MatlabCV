I = imread('hong.jpg');
 imtool(I);
[a,b,c]=size(I);
for i=1:a
    for j=1:b        
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R>(G.*2)
           I(i,j)=I(i,j);
       else
        I(i,j,1)=255;
        I(i,j,2)=255;
        I(i,j,3)=255;
       end
    end
end
  figure,imshow(I);
bw1=im2bw(I);
figure,imshow(bw1);
bw2=~bw1;
[L num] = bwlabel(bw2);
for i=1:num
   if numel(find(L==i)) < 1000
       bw2(L==i) =0;
   end
end 
figure,imshow(bw2);
bw3=~bw2;
[L1 num1] = bwlabel(bw3);
for j=1:num1
   if numel(find(L1==j)) <3000
       bw3(L1==j) =0;
   end
end 
figure,imshow(bw3);
% imwrite(bw3,'zuhewancheng.bmp');
% BW = im2bw(bw3);%图像二值化
[L,num]= bwlabel(bw3);%返回一个和BW大小相同的矩阵L

STATS = regionprops(L,'Centroid');%统计被标记区域的面积分布

subplot(121);imshow(bw3);title('目标检测前');

subplot(122),imshow(bw3); hold on;

for i = 1 : length(STATS)

    temp = STATS(i).Centroid;

   plot(temp(1),temp(2),'g.');

    title('目标检测后');

end
x=round(temp(1,1));
y=round(temp(1,2));
% str=['圆心坐标：' [,num2str(x),num2str(y)];
% helpdlg(str,'区域计数');