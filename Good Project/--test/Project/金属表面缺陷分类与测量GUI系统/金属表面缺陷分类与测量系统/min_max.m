function [max_x,min_x,max_y,min_y,count ] = min_max(po,count)
%�������������ֵ����Сֵ
%�������:
%po:ֱ�����˵��������
%count:ֱ�߼���
%�������:
%max_x:x�������ֵ;min_x:x������Сֵ
%max_y:y�������ֵ;min_y:y������Сֵ
%author:Faust.Cao
%time:2018.11.1

po(any(po==0,2),:)=[];
max_x=max(max(po(:,1)),max(po(:,3)));
min_x=min(min(po(:,1)),min(po(:,3)));
max_y=max(max(po(:,2)),max(po(:,4)));
min_y=min(min(po(:,2)),min(po(:,4)));
count=count+1;

end

