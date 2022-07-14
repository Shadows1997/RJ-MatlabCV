t=(0:pi/60:pi)';
k=0.5:0.1:1;
Y=sin(t)*k;
subplot(1,2,1);plot(t,Y) 
set(gcf,'DefaultAxesLineStyleOrder','-|:');
set(gcf,'DefaultAxesColorOrder',[1 0 0;0 0 1]);
subplot(1,2,2);plot(t,Y) 