clf reset
x=-2*pi:0.4:2*pi;
y1=sin(x);y2=cos(x);
plot(x,y1,x,y2,'g',x,zeros(size(x)),'k:')
hg=findobj(gca,'Color','g')			%在当前轴上寻找绿线的句柄
set(hg,'Color','r')
y3=get(hc(1),'ydata')+0.3; 
set(hc(1),'ydata',y3)
set(hc(3),'linestyle','+')