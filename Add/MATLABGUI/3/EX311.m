%*********************************************************
%程序：EX311.M
%功能：视角设置view使用实例
%*********************************************************
subplot(2,2,1)     %子图设置
ezmesh(@peaks);    %设置图形
view(3);              %默认的三维视图视角，相当于az = -37.5, el = 30
[a,b]=view;title(mat2str([a,b])) %视角设置并添加标注
subplot(2,2,2)         %子图设置
ezmesh(@peaks);       %图形类型设置
view(2);                %默认的二维视图视角，相当于az = 0, el = 90
[a,b]=view;title(mat2str([a,b]))   %视角设置并添加标注
subplot(2,2,3)                          %子图设置
ezmesh(@peaks);                         %图形设置
view([30 45]);                          %设置视角位置在azimuth角度和elevation角度确定的射线上
[a,b]=view;title(mat2str([a,b]))   %视角设置并添加标注
subplot(2,2,4)                             %子图设置
ezmesh(@peaks);                            %图形设置
view([1 1 sqrt(2)]);
[a,b]=view;title(mat2str([a,b]))       %视角设置并添加标注
