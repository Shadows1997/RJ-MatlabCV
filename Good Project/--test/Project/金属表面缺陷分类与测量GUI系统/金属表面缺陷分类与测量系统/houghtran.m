function [ point,ang ] = houghtran( ab1 )
%使用hough变换提取二值图中的直线
%输入参数:
%B:边缘提取后的二值图
%输出参数:
%point:检测到的直线的两端横纵坐标
%ang:检测到的直线与y轴的夹角
%author:Mathworks
%modified:Faust.Cao
%time:2018.11.1

[H,T,R] = hough(ab1,'RhoResolution',5,'Theta',-90:0.1:89.9);
 P=houghpeaks(H,35,'threshold',ceil(0.3*max(H(:))));
 lines = houghlines(ab1,T,R,P,'FillGap',5,'MinLength',7);
 point=zeros(length(lines),4);
 ang=zeros(length(lines),1);
 for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    dis=sqrt((xy(1,1)-xy(2,1))^2+(xy(1,2)-xy(2,2))^2);
   if dis>30%淘汰过段的直线，认为其是噪声或误检测
    point(k,1:2)=lines(k).point1;
    point(k,3:4)=lines(k).point2;
    ang(k)=lines(k).theta;
   
   end
  end
point(any(point==0,2),:)=[];
ang(any(ang==0,2),:)=[];

end

