function [ Gaborfilter ]=Ga(theta,num)
%ͼ��Gabor�˲�����˳�ʼ��
%�������:
%theta:����˷���[-90 90]
%num:����˴�С
%���������������ں����ڲ��޸�
%���:Gabor�����
%author:Faust.Cao
%2018.11.1

Gaborfilter=zeros(num,num);
x=[-(num-1)/2:1:(num-1)/2];
y=[-(num-1)/2:1:(num-1)/2];
xx=zeros(num,num);
yy=zeros(num,num);
Gaborfilter=zeros(num,num);
for i=1:num
   for j=1:num
      xx(i)=x(i).*cos(theta)+y(j).*sin(theta);
      yy(j)=-x(i).*sin(theta)+y(j).*cos(theta);
      Gaborfilter(i,j)=exp((xx(i)^2+0.25*yy(j)^2)/(-50))*exp(1i*((2*pi*xx(i)/10)));
   end
end
%figure(1),mesh(x,y,real(Gaborfilter));%��ʾGabor��������
end

