I=imread('01 (9).bmp');
% imtool(I)
[a,b,c]=size(I);   
for i=1:a
    for j=1:b
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R==255
           I(i,j)=I(i,j);
       else
           I(i,j,1)=0;
           I(i,j,2)=0;
           I(i,j,3)=0;
       end
    end
end
% figure,imshow(I);
bw1=im2bw(I);
% figure,imshow(bw1);
[L num] = bwlabel(bw1);
for i=1:num
   if numel(find(L==i)) < 1000
       bw1(L==i) =0;
   end
end 
% figure,imshow(bw1);
bw1=~bw1;
w=imresize(bw1,0.5); 
 imtool(w)
% [L1 num1]=bwlabel(w,8);%标记连通区域
 A=regionprops(w,'Area','Perimeter','BoundingBox');
 A1=A(1).Area
 numberD = length(find(w>0.5));