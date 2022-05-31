I=imread('01 (2).bmp');
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
% imtool(w)
[L1 num1]=bwlabel(w,8);%�����ͨ����
D=regionprops(L1,'all');%����ˮƽ������Բ����нǣ������������%�ǶȺ�׼
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

% figure(1),%subplot(2,1,1),imshow(w),title('ԭͼ');
% subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   
% subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   
  %% ������ ͼ������
% if fang_fa==2
  D_z{1,1}=regionprops(I2,'all');%����ˮƽ������Բ����нǣ������������%�ǶȺ�׼
  zhixin_z(1,:)=D_z{1}.Centroid;%ȡ����
  width1(1)=D_z{1}.BoundingBox(1,3);%��С�����γ�
  width2(1)=D_z{1}.BoundingBox(1,4);%��С�����θ�
    %% �ü�
   kuo_bian=15;%�������������һ�㲻��
  jian_tu{1}=imcrop(I2,[zhixin_z(1,1)-(round(width1(1)/2)+kuo_bian),zhixin_z(1,2)-(round(width2(1)/2)+kuo_bian),width1(1)+2*kuo_bian,width2(1)+2*kuo_bian]);%jian_tu{i}{99}����ÿһ��ͼƬ����Ϣ
  %% ͳһ��С��
  beilv=108/max(size(jian_tu{1}));
% suo_tongyi=imresize(jian_tu,beilv);%��һ�ַ���
  tmp=imresize(jian_tu{1},[NaN,108]);%�а�������ͬ�ķ���,����ͳһ��С
% else 
%   %% �Է���
%   [x1, y1] = find(I2 ==1);
%  
%   % ��ȡͼ���е����ֲ���  %% �޸ı����߽磬����ͼ�񳬹��߽� ȷʵ�������޸�ѽ
%   %fix(min(x1)-2):fix(max(x1)-2),fix(min(y1)-2):fix(max(y1)+2)
%   %% ���Ե�������ͼ������Ե�Ĵ�С
%   Xmin=min(x1)-3;Xmax=max(x1)+3;Ymin=min(y1)-6;Ymax=max(y1)+6;
%   tmp = I2(Xmin:Xmax,Ymin:Ymax);  
%   % ԭ��ֱ�ӵ��߽� tmp = I2(min(x1):max(x1),min(y1):max(y1));  
%   %%   %�ı�ͼ���СҪ�����￪ʼ   ��ͼ���Ϊ256*256��
%   %   rate = 72 / max(size(tmp));%��256�����72
%   %   tmp = imresize(tmp,rate); 
%   tmp = imresize(tmp,[72 171]); %������72���а���Ӧ��������ĳһ��ֵ
%   %% ���������仯�ɷǷ���
%   %   [x1, y1] = find(tmp == 1);
%   %   tmp = mubiao(min(x1):max(x1),min(y1):max(y1)); % ��ȡͼ���е����ֲ���
%   %   imshow(logical(tmp));
%   %% ԭ��  % �ı�ͼ���СҪ��������ı����
%   [x1,y1] = size(tmp);
%   %  ��С ͳһ��
%    if x1 ~= 72
%     tmp = [zeros(ceil((72-x1)/2)-1,y1);tmp;zeros(floor((72-x1)/2)+1,y1)];
%    end
%  %    if y1 ~= size(tmp,2)% ����Ҫ���ݾ������������Ӧ�ĵ�����
%    if y1 ~= 171% ����Ҫ���ݾ������������Ӧ�ĵ�����
%     tmp = [zeros(171,ceil((171-y1)/2)-1);tmp;zeros(171,floor((171-y1)/2)+1)];
%    end
% end
   tmp=logical(tmp);%ת���߼�ͼ�Է�����ʾ
   %% ���޸ĵ�
%    subplot(2,1,2),imshow(tmp); %��ʾ�±����ͼƬ
%    %%  д�ļ��������ɹ���
%    picname=[num2str(sprintf('%02d',1)),'.bmp'];  %������ļ�������i=1ʱ��picname=1.bmp picname=[num2str(i),'.bmp'];
%    imwrite(tmp,['fig1\',picname]); 
% [FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
%                                  '*.bmp','Bitmap(*.bmp)';...  
%                                  '*.gif','GIF(*.gif)';...  
%                                  '*.*',  'All Files (*.*)'},...  
%                                  'Save Picture','Untitled');  
% imwrite(tmp,[PathName,FileName]); 
% [A,map]=tmp;  %����ͼ��
rect=[0 26 108 46];           %�����������
X1=imcrop(tmp,rect);              %����ͼ�����
set(0,'defaultFigurePosition',[100,100,1000,500]);%�޸�ͼ��ͼ��λ�õ�Ĭ������
set(0,'defaultFigureColor',[1 1 1])%�޸�ͼ�α�����ɫ������
% subplot(121),imshow(A); %��ʾԭͼ��
% rectangle('Position',rect,'LineWidth',2,'EdgeColor','r') %��ʾͼ���������
% subplot(122),imshow(X1);   %��ʾ���е�ͼ�� 
I8 = X1;
I8=im2bw(I8);
% I = rgb2gray(I);  % ��ͼ����лҶȴ��������ǣ�������
[m n]=size(I8); % m n�ֱ�Ϊͼ����� ����
%--- ���д�ֱ�Ҷ�ͶӰ
for y=1:n
     V(y)=sum(I8(1:m,y));
end
y=1:n;
figure
plot(y,V(y));
title('��ֱ�Ҷ�ͶӰ');
% % ����ˮƽ�Ҷ�ͶӰ
% for x=1:m
%     L(x)=sum(I8(x,:));
% end
% x=1:m;
% subplot(212),plot(x,L(x));
% title('ˮƽ�Ҷ�ͶӰ');

column=[0];  %һ�����У��á�;���ֿ�
p1=[V(y) column];
% display(p1);
load a61.mat
%% �������ѵ����/���Լ�
%  a = randperm(20);
Train = a61(1:10,:);
Test = p1(1:end,:);
%% ѵ������
Ptrain = Train(:,1:end-1);
Ttrain = Train(:,end);
%% ��������
 P_test = Test(:,1:end-1);
 T_test = Test(:,end);
%% ����������������
ctree = ClassificationTree.fit(Ptrain,Ttrain);
%% �鿴��������ͼ
view(ctree,'mode','graph');
%% IV. �������
T_pre = predict(ctree,P_test);
 if T_pre<1
     print('1')
     %set(handles.edit2,'string','���');%��edit2�ı������ȱ������
 else
      print('2')
     %set(handles.edit2,'string','�ٴ�');%��edit2�ı������ȱ������
 end