% subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   
  %% 摆正后 图像质心
% if fang_fa==2
  D_z{1,1}=regionprops(I2,'all');%计算水平轴与椭圆长轴夹角（度数）描绘子%角度很准
  zhixin_z(1,:)=D_z{1}.Centroid;%取质心
  width1(1)=D_z{1}.BoundingBox(1,3);%最小外界矩形长
  width2(1)=D_z{1}.BoundingBox(1,4);%最小外界矩形高
    %% 裁剪
   kuo_bian=15;%可以酌情调整，一般不动
  jian_tu{1}=imcrop(I2,[zhixin_z(1,1)-(round(width1(1)/2)+kuo_bian),zhixin_z(1,2)-(round(width2(1)/2)+kuo_bian),width1(1)+2*kuo_bian,width2(1)+2*kuo_bian]);%jian_tu{i}{99}就是每一张图片的信息
  %% 统一大小化
  beilv=108/max(size(jian_tu{1}));
% suo_tongyi=imresize(jian_tu,beilv);%第一种方法
  tmp=imresize(jian_tu{1},[NaN,108]);%行按与列相同的方法,缩到统一大小
% else 
%   %% 对方的
%   [x1, y1] = find(I2 ==1);
%  
%   % 截取图像中的数字部分  %% 修改保留边界，不是图像超过边界 确实在这里修改呀
%   %fix(min(x1)-2):fix(max(x1)-2),fix(min(y1)-2):fix(max(y1)+2)
%   %% 可以调整控制图像距离边缘的大小
%   Xmin=min(x1)-3;Xmax=max(x1)+3;Ymin=min(y1)-6;Ymax=max(y1)+6;
%   tmp = I2(Xmin:Xmax,Ymin:Ymax);  
%   % 原来直接到边界 tmp = I2(min(x1):max(x1),min(y1):max(y1));  
%   %%   %改变图像大小要从这里开始   把图像变为256*256的
%   %   rate = 72 / max(size(tmp));%从256变成了72
%   %   tmp = imresize(tmp,rate); 
%   tmp = imresize(tmp,[72 171]); %行缩至72，列按相应比例缩至某一数值
%   %% 我想让他变化成非方形
%   %   [x1, y1] = find(tmp == 1);
%   %   tmp = mubiao(min(x1):max(x1),min(y1):max(y1)); % 截取图像中的数字部分
%   %   imshow(logical(tmp));
%   %% 原来  % 改变图像大小要随着上面的变而变
%   [x1,y1] = size(tmp);
%   %  大小 统一化
%    if x1 ~= 72
%     tmp = [zeros(ceil((72-x1)/2)-1,y1);tmp;zeros(floor((72-x1)/2)+1,y1)];
%    end
%  %    if y1 ~= size(tmp,2)% 这里要根据具体情况作出相应的调整，
%    if y1 ~= 171% 这里要根据具体情况作出相应的调整，
%     tmp = [zeros(171,ceil((171-y1)/2)-1);tmp;zeros(171,floor((171-y1)/2)+1)];
%    end
% end
   tmp=logical(tmp);%转成逻辑图以方便显示
   %% 我修改的
   subplot(2,1,2),imshow(tmp); %显示下保存的图片
%    %%  写文件重命名成功啦
%    picname=[num2str(sprintf('%02d',1)),'.bmp'];  %保存的文件名：如i=1时，picname=1.bmp picname=[num2str(i),'.bmp'];
%    imwrite(tmp,['fig1\',picname]); 
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
imwrite(tmp,[PathName,FileName]); 