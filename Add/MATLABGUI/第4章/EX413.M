%*****************************************************
%����EX413.M
%���ܣ����շ�����ʾʵ��
%*****************************************************
[x,y]=meshgrid(-1:0.2:1);     %���þ�������
z=sin(x*pi)+cos(y*pi);         %����z��x��y֮��ĺ�����ϵ
subplot(2,2,1)                   %��ͼ����
surf(x,y,z)                       %������������
light('Color','r','Style','infinite','Position',[1 -1 2])   %���ù���Ч��
lighting none                     %�رչ���Ч��
title('lighting none')         %Ϊ��ǰͼ����ӱ���
subplot(2,2,2)                    %��ͼ����
surf(x,y,z)                        %������������
light('Color','r','Style','infinite','Position',[1 -1 2])   %���ù���Ч��
lighting flat    ����������������%��Դ��ͼ����ÿһ���������ͬ����Ч��
title('lighting flat')����    ����  %Ϊ��ǰͼ����ӱ���
subplot(2,2,3)������������������%��ͼ����
surf(x,y,z)��������������������%������������
light('Color','r','Style','infinite','Position',[1 -1 2])����%���ù���Ч��
lighting gouraud����������%Ӱ����ÿһ���������ɫ��Ȼ���ֵȷ����������ɫ
title('lighting gouraud')  %Ϊ��ǰͼ����ӱ���
subplot(2,2,4)                %��ͼ����
surf(x,y,z)                   %������������
light('Color','r','Style','infinite','Position',[1 -1 2])  %���ù���Ч��
lighting phong             %����ÿһ��ͼ�����ص�ķ���ϵ��, Ȼ���ֵȷ����������ɫ
title('lighting phong')
