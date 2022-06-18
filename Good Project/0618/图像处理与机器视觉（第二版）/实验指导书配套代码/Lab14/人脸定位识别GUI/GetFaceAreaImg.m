function [hsv,erzhi,bw1,BW2] = GetFaceAreaImg(Img, flag)
%此程序定位人脸
Image =Img;
hsv = rgb2hsv(Image);%转换至HSV颜色空间
map = hsv(:,:,1)<0.09&hsv(:,:,2)>0.15;
erzhi = map;
 map = imfill(map,'holes');%填充孔洞
 se=strel('square',13);
bw1=imopen(map,se);%形态学开运算
MAP = map;
map = bw1;
lab = bwlabel(map);
reg = regionprops(lab,'Area');
area = [reg.Area];
[va,maindex] = max(area);
BW2 = lab==maindex;

% th = graythresh(Gray);
% BW = im2bw(Gray,th);
% BW = 1-BW;
% BW2= imfill(BW,'holes');%%填充二值图像中的空洞
istrain = 0;
if(istrain)
    figure();
subplot(1,2,1);imshow(hsv);title('hsv颜色空间');
% subplot(2,2,2);imshow(BW);title('根据颜色空间二值化图像');
subplot(1,2,2);imshow(BW2);title('空洞填充后图像');
end
end
