t=(0:100)/100*2*pi;
hls=line('Xdata',t,'Ydata',sin(t),'Color','r');
hlc=line(t,cos(t),'Color','b','LineStyle','o');
text(pi,0.8,'\fontsize{14}sin(t)');
text(5.5,0.6,'cos(t)');
hchild=get(get(hls,'parent'),'children')	%��֮���С��ӡ��ľ��
T=get(hchild,'Type')						%��֮���С��ӡ���������  


get(hls,'color')
get(hlc)
set(hls,'color',[1 0 1])
set(hlc,'LineStyle','*')

title('Handle Graphics Example')
ht=get(gca, 'Title' )  %���Title�ľ��
set(ht,'FontSize',16)   %���������С