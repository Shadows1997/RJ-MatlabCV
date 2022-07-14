 %********************************************************
 %程序：EX507.M
 %功能：录制avi文件
 %********************************************************
aviobj=avifile('animation.avi','fps',3);  %使用avifile函数建立AVI文件
for k=1:25                                         %建构动画文件的图片
h=plot(fft(eye(k+16)));
set(h, 'EraseMode','xor');                    %设置动画属性
axis equal;                                        %调整坐标轴
frame=getframe(gca);
aviobj=addframe(aviobj,frame);              %将获取的图片放入AVI文件
end
aviobj=close(aviobj);                           %关闭句柄值为aviobj的AVI文件，以完成录制
