%***************************************************
%����EX411.M
%���ܣ�shadingģʽ��ʾ
%***************************************************
 [x,y]=meshgrid(-4:0.5:4);                %���þ�������
z=x.^2+2*sin(x*pi)+2*cos(y*pi);        %����z��x��y֮��ĺ�����ϵ
subplot(2,2,1)                              %��ͼ����
surf(x,y,z)                                  %������ά����
title('no shading')                       %Ϊ��ǰͼ����ӱ���
subplot(2,2,2)                             %��ͼ����
surf(x,y,z)                                 %������ά����
shading flat                                %������ӰЧ��
title('shading flat')                    %Ϊ��ǰͼ����ӱ���
subplot(2,2,3)                             %��ͼ����
surf(x,y,z)                                 %������ά����
shading faceted                            %������ӰЧ��
title('shading faceted')                 %Ϊ��ǰͼ����ӱ���
subplot(2,2,4)                             %��ͼ����
surf(x,y,z)                                 %������ά����
shading interp                             %������ӰЧ��
title('shading interp')                  %Ϊ��ǰͼ����ӱ���
