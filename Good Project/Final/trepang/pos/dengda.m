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
   subplot(2,1,2),imshow(tmp); %��ʾ�±����ͼƬ
%    %%  д�ļ��������ɹ���
%    picname=[num2str(sprintf('%02d',1)),'.bmp'];  %������ļ�������i=1ʱ��picname=1.bmp picname=[num2str(i),'.bmp'];
%    imwrite(tmp,['fig1\',picname]); 
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
imwrite(tmp,[PathName,FileName]); 