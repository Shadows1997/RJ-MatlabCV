 %********************************************************
 %����EX507.M
 %���ܣ�¼��avi�ļ�
 %********************************************************
aviobj=avifile('animation.avi','fps',3);  %ʹ��avifile��������AVI�ļ�
for k=1:25                                         %���������ļ���ͼƬ
h=plot(fft(eye(k+16)));
set(h, 'EraseMode','xor');                    %���ö�������
axis equal;                                        %����������
frame=getframe(gca);
aviobj=addframe(aviobj,frame);              %����ȡ��ͼƬ����AVI�ļ�
end
aviobj=close(aviobj);                           %�رվ��ֵΪaviobj��AVI�ļ��������¼��
