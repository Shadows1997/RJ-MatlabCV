function [ ss ]=thres(a6) 
%最大熵阈值分割算法
%输入:a6:输入灰度图
%输出:阈值
%author:Faust.Cao
%2018.11.1

hi=imhist(a6);
e1=0;
e2=0;
maxx=0;
[w,l]=size(a6);
for i=1:254
    c1=sum(hi(1:1+i));
    c2=w*l-c1;
    h1=hi(1:1+i)/c1;
    for iii=0:i-1
        if h1(iii+1)==0||c1==0
            continue;
        end
        e1=e1-h1(iii+1).*log(h1(iii+1));
    end
    for jjj=i:254
        if hi(jjj+2)==0||c2==0
            continue;
        end
        e2=e2-(hi(jjj+2)/c2).*log(hi(jjj+2)/c2);
    end
    e=e1+e2;
    e1=0;
    e2=0;
     if maxx<e
         maxx=e;
         ss=i;
     end
end
end

