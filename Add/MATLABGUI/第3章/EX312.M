%*********************************************************
%����EX312.M
%���ܣ����������ú���axisʹ��ʵ��
%*********************************************************
close all            %�ر����д���
subplot(1,3,1)     %��ͼ����
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis auto;title('auto')   %��������ϵ����ע
subplot(1,3,2)        %��ͼ����
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis equal;title('equal')    %����������Ϊ�����β���ע
subplot(1,3,3)                  %��ͼ����
ezsurf(@(t,s)(sin(t).*cos(s)),@(t,s)(sin(t).*sin(s)),@(t,s)cos(t),[0,2*pi,0,2*pi])
axis square;title('square')    %����������Ϊ�����β���ע
