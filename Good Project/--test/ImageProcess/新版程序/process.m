% I = im;
% [a,b,c]=size(I);
% for i=1:a
%     for j=1:b        
%         R=I(i,j,1);
%         G=I(i,j,2);
%         B=I(i,j,3);
%        if R>(G.*2)
%            I(i,j)=I(i,j);
%        else
%         I(i,j,1)=255;
%         I(i,j,2)=255;
%         I(i,j,3)=255;
%        end
%     end
% end
% bw1=im2bw(I);
% bw2=~bw1;
% [L num] = bwlabel(bw2);
% for i=1:num
%    if numel(find(L==i)) < 1000
%        bw2(L==i) =0;
%    end
% end 
% bw3=~bw2;
% [L1 num1] = bwlabel(bw3);
% for j=1:num1
%    if numel(find(L1==j)) <3000
%        bw3(L1==j) =0;
%    end
% end 
% [L,num]= bwlabel(bw3);%����һ����BW��С��ͬ�ľ���L
% STATS = regionprops(L,'Centroid');%ͳ�Ʊ�������������ֲ�
% imshow(bw3); hold on;
% for i = 1 : length(STATS)
%     temp = STATS(i).Centroid;
%     plot(temp(1),temp(2),'g.');
% end
% hold off;
% x=round(temp(1,1));
% y=round(temp(1,2));
% str=[ '�����꣺',num2str(x),'�����꣺' num2str(y)];
% helpdlg(str,'ʶ��Բ��');
% imshow(bw3);
