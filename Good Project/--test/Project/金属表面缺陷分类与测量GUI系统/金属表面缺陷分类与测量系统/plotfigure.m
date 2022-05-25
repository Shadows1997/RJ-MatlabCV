function [dis] = plotfigure(max_x,min_x,max_y,min_y,anm)
%����⵽�Ļ��������˵㼰������
%�������:
%max_x:x�������ֵ;min_x:x������Сֵ
%max_y:y�������ֵ;min_y:y������Сֵ
%anm:��ֱ����y��ļн�
%�������:dis:���۳���
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

