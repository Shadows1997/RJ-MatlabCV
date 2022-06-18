%%Hougn�任
I=imread('coloredChips.png');
f=rgb2gray(I);%RGB-->gray
f=f(round(end/2):end,1:round(end/2));
BW=edge(f,'canny');  %edge:�ԻҶ�ͼ��Ϊ���룬'canny'Ϊ��Ե�������
                     %     ���BWΪ��ֵͼ�񣬱�Ե��Ϊ�ף�255�����ಿ��Ϊ�ڣ�0��
imshow(f)
title('ԭʼͼ��')
[row,col]=size(BW);
rhomax=round((row*row+col*col)^0.5);
A=zeros(2*rhomax,180);   %���ʵ����rho��ȡֵ��ΧΪ[-rhomax,rhomax]��
                         %����Ϊ�˺����������ͳ�ƣ�ת��Ϊ[1,2rhomax]
for m=1:row
    for n=1:col
        if BW(m,n)>0 %�ж�Ϊ��Ե
            for theta=1:180
                r=theta/180*pi; %�Ƕ�ת��
                rho=round(m*cos(r)+n*sin(r));
                %Hough�任
                rho=rho+rhomax+1;   %����ƽ��
                                    %�������⣬����matlab�������Ǵ�1��ʼ����������+1��
                                    %�������겻��<0������ +rhomax
                A(rho,theta)=A(rho,theta)+1;   %����ͳ��
            end
        end
    end
end
[rho,theta]=find(A>130);   %����130������Ϊ����,rho�кţ�theta�к�
nma=length(rho);
figure,imshow(BW)
for i=1:nma
    hold on
    m=1:row;
    r=theta(i)/180*pi;
    n=(rho(i)-rhomax-m*cos(r))/(0.0001+sin(r));
    plot(n,m,'w-','LineWidth',6);
end
title('hough�߼��');


