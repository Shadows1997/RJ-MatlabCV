%********************************************************
%程序：EX215.M
%功能：文本框标注函数gtext使用实例
%********************************************************
x=0:0.02*pi:2*pi;                         %定义x坐标轴的范围及刻度
y=2*sin(x)+ 2*cos(x);                   %定义y与x之间的函数关系
plot(x,y,pi,sin(pi)+cos(pi),'o')       %绘制函数图形
text(pi, 2*sin(pi)+ 2*cos(pi),['sin(\pi)+cos(\pi)=',num2str(sin(pi)+cos(pi))])
gtext({'gtext1-line1','gtext1-line2'})         %添加文本框标注
gtext({'gtext2-1';'gtext2-2'})                   %添加文本框标注
