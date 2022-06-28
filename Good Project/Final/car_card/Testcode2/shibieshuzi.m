%---------------------------------------------%
%					      %
%          工作室提供代做matlab仿真	      %
%					      %
%  详情请访问：http://cn.mikecrm.com/5k6v1DP  %
%					      %
%---------------------------------------------%

function shibieshuzi=shibieshuzi(shuzi,xiuzhengshuzi_1);
[y,x,z]=size(xiuzhengshuzi_1);
   
for k=1:10
sum=0;
for i=1:y
    for j=1:x
         if  shuzi(i,j,k)==xiuzhengshuzi_1(i,j)%统计黑白
             sum=sum+1;
        end
    end
end
baifenbi(1,k)=sum/(x*y);
end
chepai= find(baifenbi>=max(baifenbi));
shibieshuzi=chepai-1;
shibieshuzi=num2str(shibieshuzi);