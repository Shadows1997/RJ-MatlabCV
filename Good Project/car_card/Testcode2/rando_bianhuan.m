%---------------------------------------------%
%					      %
%          工作室提供代做matlab仿真	      %
%					      %
%  详情请访问：http://cn.mikecrm.com/5k6v1DP  %
%					      %
%---------------------------------------------%

function qingxiejiao=rando_bianhuan(I)
I=edge(I);%figure,imshow(I);
% I = zeros(100,100);
% I(25:75, 25:75) = 1;
theta = 1:180;
[R,xp] = radon(I,theta);
%figure,imagesc(theta,xp,R);colormap(hot);%title('R_{\theta} (X\prime)')%%imshow(theta,xp,R,[],'n')
[I,J] = find(R>=max(max(R)));%J记录了倾斜角
qingxiejiao=90-J;
%直线位置
% xlabel('\theta (degrees)');ylabel('X\prime');
% % colormap(hot)%     colorbar  IMAGE(C) displays matrix C as an image.
% title('R_{\theta} (X\prime)');
% colorbar;