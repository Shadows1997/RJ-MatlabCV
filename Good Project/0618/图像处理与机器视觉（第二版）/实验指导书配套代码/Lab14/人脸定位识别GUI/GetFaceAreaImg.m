function [hsv,erzhi,bw1,BW2] = GetFaceAreaImg(Img, flag)
%�˳���λ����
Image =Img;
hsv = rgb2hsv(Image);%ת����HSV��ɫ�ռ�
map = hsv(:,:,1)<0.09&hsv(:,:,2)>0.15;
erzhi = map;
 map = imfill(map,'holes');%���׶�
 se=strel('square',13);
bw1=imopen(map,se);%��̬ѧ������
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
% BW2= imfill(BW,'holes');%%����ֵͼ���еĿն�
istrain = 0;
if(istrain)
    figure();
subplot(1,2,1);imshow(hsv);title('hsv��ɫ�ռ�');
% subplot(2,2,2);imshow(BW);title('������ɫ�ռ��ֵ��ͼ��');
subplot(1,2,2);imshow(BW2);title('�ն�����ͼ��');
end
end
