function [max_x,min_x,max_y,min_y,count ] = min_max(po,count)
%求横纵坐标的最大值与最小值
%输入参数:
%po:直线两端点横纵坐标
%count:直线计数
%输出参数:
%max_x:x坐标最大值;min_x:x坐标最小值
%max_y:y坐标最大值;min_y:y坐标最小值
%author:Faust.Cao
%time:2018.11.1

po(any(po==0,2),:)=[];
max_x=max(max(po(:,1)),max(po(:,3)));
min_x=min(min(po(:,1)),min(po(:,3)));
max_y=max(max(po(:,2)),max(po(:,4)));
min_y=min(min(po(:,2)),min(po(:,4)));
count=count+1;

end

