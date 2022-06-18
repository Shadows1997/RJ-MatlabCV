%%MATLAB工具箱中的Hough变换函数进行边缘检测
I=imread('circuit.tif');
rotI=imrotate(I,33,'crop');
BW=edge(rotI,'canny');
imshow(BW);
title('原图');
%对图像进行Hough变换
[H,T,R]=hough(BW);  %[H,theta,rho]
%显示变换域
figure,imshow(imadjust(rescale(H)),'XData',T,'YData',R,...
              'InitialMagnification','fit');
xlabel('\theta');ylabel('\rho');
axis on,axis normal,hold on
title('变换域');
%计算变换域峰值
P=houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x=T(P(:,2));y=R(P(:,1));
plot(x,y,'s','color','red');
%标记直线
lines=houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure,imshow(rotI),hold on
max_len=0;
for k=1:length(lines)
    xy=[lines(k).point1;lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','white');
    %Plot beginning and ends of lines
    plot(xy(1,1),xy(1,2),'xw','LineWidth',2);
    plot(xy(2,1),xy(2,2),'xw','LineWidth',2);
    %Determine the endpoints of the longest line segment
    len=norm(lines(k).point1-lines(k).point2);
    if(len>max_len)
        max_len=len;
        xy_long=xy;
    end
end
title('检测结果')


