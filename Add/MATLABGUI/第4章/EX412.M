%*****************************************************
%����EX412.M
%���ܣ���Դ�������ʵ��
%*****************************************************
 [x,y]=meshgrid(-1:0.1:1);      %���þ�������       
z=sin(x*pi)+cos(y*pi);          %����z��x��y֮��ĺ�����ϵ
subplot(2,2,1)          %��ͼ����
surf(x,y,z)             %������������
title('no light')     %Ϊ��ǰͼ����ӱ���
subplot(2,2,2)         %��ͼ����
surf(x,y,z)             %������������
light('Color','r','Style','infinite','Position',[0 1 2])  %���ù���Ч��
title('red infinite light')    %Ϊ��ǰͼ����ӱ���
subplot(2,2,3)            %��ͼ����
surf(x,y,z)                %������������
light('Color','g','Style','infinite','Position',[0 1 2])  %���ù���Ч��
title('green infinite light')  %Ϊ��ǰͼ����ӱ���
subplot(2,2,4)                 %��ͼ����
surf(x,y,z)                     %������������
light('Color','r','Style','local','Position',[0 1 2])    %���ù���Ч��
title('red local light')   %Ϊ��ǰͼ����ӱ���
