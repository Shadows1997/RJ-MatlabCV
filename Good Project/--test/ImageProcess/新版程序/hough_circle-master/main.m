
    circleParaXYR=[];  
    I = imread('h6.jpg');  
    [m,n,l] = size(I);  
    if l>1  
        I = rgb2gray(I);  
    end  
    BW = edge(I,'sobel');  
      
    step_r = 1;  
    step_angle = 0.1;  
    minr = 3  
    maxr = 30;  
    thresh = 0.51;  
      
    [hough_space,hough_circle,para] = hough_circlefu(BW,step_r,step_angle,minr,maxr,thresh);  
    figure(1),imshow(I),title('ԭͼ')  
    figure(2),imshow(BW),title('��Ե')  
    figure(3),imshow(hough_circle),title('�����')  
      
    circleParaXYR=para;  
      
    %���  
    fprintf(1,'\n---------------Բͳ��----------------\n');  
    [r,c]=size(circleParaXYR);%r=size(circleParaXYR,1);  
    fprintf(1,'  ����%d��Բ\n',r);%Բ�ĸ���  
    fprintf(1,'  Բ��     �뾶\n');%Բ�ĸ���  
    for n=1:r  
    fprintf(1,'%d ��%d��%d��  %d\n',n,floor(circleParaXYR(n,1)),floor(circleParaXYR(n,2)),floor(circleParaXYR(n,3)));  
    end  
      
    %���Բ  
    figure(4),imshow(I),title('����ͼ�е�Բ')  
    hold on;  
     plot(circleParaXYR(:,2), circleParaXYR(:,1), 'r+');  
     for k = 1 : size(circleParaXYR, 1)  
      t=0:0.01*pi:2*pi;  
      x=cos(t).*circleParaXYR(k,3)+circleParaXYR(k,2);y=sin(t).*circleParaXYR(k,3)+circleParaXYR(k,1);  
      plot(x,y,'r-');  
     end  
       
      
    R_max=maxr;  
    acu=zeros(R_max);  
    stor =[];  
    for j=1:R_max  
      for n=1:r  
       if  j == floor(circleParaXYR(n,3))  
           acu(j)= acu(j)+1;  
       end  
      end  
       stor=[stor;j,acu(j)];  
       %fprintf(1,'%d,%d\n',j,acu(j));  
    end  
      
    fprintf(1,'\n------------���Ӵ�С����Ŀͳ��---------\n');  
    fprintf(1,'���Ӱ뾶�����Ӹ���\n');  
    for j=1:R_max  
      if acu(j) > 0  
       fprintf(1,'%4d %8d\n',stor(j,1),stor(j,2));  
      end  
    end  
      
    fprintf(1,'----------------------------------------\n');  
    figure(5),plot(stor(:,1),stor(:,2),'-k','LineWidth',2),title('������');  
    xlabel('���Ӵ�С');  
    ylabel('���Ӹ���');  
    grid on;  
      
    z=[0,10,20,30,40,50,60,70,80,90,11,35,25,42,48,40,20,75,88,94,23,10,20,30,40,78,60,76,84,95,58,10,20,30,40,50,60,70,80,90,100];%����z������  
    Z=z(:);  
    S=floor(abs(Z)*1);  
    C=floor(abs(Z)*0.5);  
    figure(6),scatter3(circleParaXYR(:,1),circleParaXYR(:,2),Z,circleParaXYR(:,3)*7,'filled'),title('������ά���ӳ�');  