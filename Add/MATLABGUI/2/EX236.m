%********************************************************
%����EX236.M
%���ܣ��ֹ���ͼ��ʽ��ͼ�����������ݵ�
%********************************************************
clf                                %���������
axis([0 10 0 10])              %���������᷶Χ����
hold on                           %����ͼ��
x=[ ];                            %����ͼ�α���
y=[ ];                             %����ѭ������
n=0;                               %��ʼ������n
while(1)
[xtemp,ytemp,button]=ginput(1);  %�����õ����ݵ�
plot(xtemp,ytemp,'.')          %����ͼ��
x=[x,xtemp];
y=[y,ytemp];                      %����y������ϵ
n=n+1;                              %n����ѭ��
text(xtemp+0.1,ytemp,int2str(n));    %������ֱ�ע
if(button==3)                     
   break                             %����ѭ��
end
end
t=1:n;                             %����t�ķ�Χ
tt=1:0.1:n;                       %����tt��Χ���̶�
xx=spline(t,x,tt);               %����spline����ͼ��
yy=spline(t,y,tt);                %����spline����ͼ��
plot(xx,yy,'b:');                  %����ͼ��
[xtemp,ytemp,button]=ginput(1);
for i=1:n                                           %ѭ������
   if ((abs(x(i)-xtemp)<0.1)&(abs(y(i)-ytemp)<0.1))
   k=i;
   line([x(k)-0.1,x(k)+0.1],[y(k)-0.3,y(k)+0.3])
   line([x(k)+0.1,x(k)-0.1],[y(k)-0.3,y(k)+0.3])        %�������ݵ������������
   break
end
end                               
[xtemp,ytemp,button]=ginput(1);    %�������ݵ������������
plot(xtemp,ytemp,'r:')     %����ͼ��
k=i;
x(k)=xtemp;
y(k)=ytemp;
text(xtemp+0.1,ytemp,int2str(k));     %������ֱ�ע
xx=spline(t,x,tt);
yy=spline(t,y,tt);
plot(xx,yy,'r-')             %�����µ���������
hold off                        %�رձ���
