t=(0:100)/100*2*pi;
hls=line('Xdata',t,'Ydata',sin(t),'Color','r');
hlc=line(t,cos(t),'Color','b','LineStyle','o');
text(pi,0.8,'\fontsize{14}sin(t)');
text(5.5,0.6,'cos(t)');
hchild=get(get(hls,'parent'),'children')	%轴之所有“子”的句柄
T=get(hchild,'Type')						%轴之所有“子”对象名称  


get(hls,'color')
get(hlc)
set(hls,'color',[1 0 1])
set(hlc,'LineStyle','*')

title('Handle Graphics Example')
ht=get(gca, 'Title' )  %获得Title的句柄
set(ht,'FontSize',16)   %设置字体大小