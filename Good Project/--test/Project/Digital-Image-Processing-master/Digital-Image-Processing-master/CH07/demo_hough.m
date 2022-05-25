%ʹ�û���任����������

%%
%   ����任
f = imread('Fig1006(a).tif');
[H,theta,rho] = hough(f,'ThetaResolution',0.2);
figure,imshow(H,[],'XData',theda,'YData',rho,'InitialMagnification','fit');
axis on,axis normal;
xlabel('\theta'),ylabel('\rho');

%%
%   Ѱ��5��������Ļ���任��ֵ
peaks = houghpeaks(H,5);
hold on;
plot(theta(peaks(:,2)),rho(peaks(:,1)),'linestyle','none','marker','s','color','w');

 %%
 %  Ѱ�Һ������߶�
lines = houghlines(f,theta,rho,peaks);
figure,imshow(f),hold on;
for k = 1:length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',4,'Color',[.8 .8 .8]);
end