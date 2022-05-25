function [ab] = filterimage(a6)
%Gabor滤波算法
%输入参数:
%a6:待滤波灰度图
%输出参数:滤波后的灰度图
%选取四个方向的卷积核:0,0.5pi,pi,1.5pi;卷积核大小:25*25
%author:Faust.Cao
%time:2018.11.1

Gaborfiter=Ga(1.57,25);
aaa=filter2(Gaborfiter,a6,'valid');
bb=Ga(0,25);
bbb=filter2(bb,a6,'valid');
cc=Ga(0.785,25);
ccc=filter2(cc,a6,'valid');
dd=Ga(2.36,25);
ddd=filter2(dd,a6,'valid');
h=fspecial('average',5);
ab=filter2(h,abs(abs(aaa)+abs(ddd)-abs(bbb)-abs(ccc)));
ab=filter2(h,ab);
ab=uint8(fix(255*ab./max(max(ab))));

end

