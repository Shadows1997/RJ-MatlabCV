function [dis] = plotfigure(max_x,min_x,max_y,min_y,anm)
%画检测到的划痕两个端点及其连线
%输入参数:
%max_x:x坐标最大值;min_x:x坐标最小值
%max_y:y坐标最大值;min_y:y坐标最小值
%anm:该直线与y轴的夹角
%输出参数:dis:划痕长度
%author:Faust.Cao
%time:2018.11.1

 if anm>0
    plot(max_x,max_y,'x','LineWidth',2,'Color','green');
    plot(min_x,min_y,'x','LineWidth',2,'Color','blue');
    xy(1,:)=[max_x,max_y];
    xy(2,:)=[min_x,min_y];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 else
    plot(max_x,min_y,'x','LineWidth',2,'Color','green');
    plot(min_x,max_y,'x','LineWidth',2,'Color','blue');   
    xy(1,:)=[max_x,min_y];
    xy(2,:)=[min_x,max_y];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
 end
    dis=sqrt((max_x-min_x)^2+(max_y-min_y)^2);
end

