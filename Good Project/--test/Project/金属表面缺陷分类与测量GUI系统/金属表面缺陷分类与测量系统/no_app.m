

c2='Sc_72';
c1='E:\我的文章存放室\数字图像处理课程\课程设计\NEU+surface+defect+database\NEU surface defect database\';
c3='.bmp';
c=[c1,c2,c3];
a6=imread(c);
ma=max(max(a6));
mi=min(min(a6));
for ii=1:200 
    for jj=1:200
        a6(ii,jj)=255*double(a6(ii,jj)-mi)/double(ma-mi);
    end
end
figure(1),imshow(a6,[]);
a6=adapthisteq(a6);
figure(1),imshow(a6,[]);
 Gaborfiter=Ga(1.57,10);
 aaa=filter2(Gaborfiter,a6,'valid');
 %figure(1),imshow(aaa,[]);
%aa=imgaborfilt(a5,10,0);
%bb=imgaborfilt(a2,10,90);
bb=Ga(0,25);
bbb=filter2(bb,a6,'valid');

cc=Ga(0.785,25);
ccc=filter2(cc,a6,'valid');

dd=Ga(2.36,25);
ddd=filter2(dd,a6,'valid');

 %figure(2),imshow(aa,[])
 h=fspecial('average',5);
 ab=filter2(h,abs(abs(aaa)+abs(ddd)-abs(bbb)-abs(ccc)));
 ab=filter2(h,ab);
 ab=uint8(fix(255*ab./max(max(ab))));
 %ab=im2bw(ab,graythresh(ab));
 
 aaa=uint8(fix(255*abs(aaa)./max(max(abs(aaa)))));
 
ss=thres(ab);
ab1=im2bw(ab,ss/255);
%figure(2),imshow(a6,[]);
%[bw,thres]=edge(ab,'log');
% s=strel('disk',2);
% ab=imerode(ab,s);
[B,L]=bwboundaries(ab1);
[x,y]=size(B);
mm=0;
for i=1:x
    ll=length(B{i});
    if ll>mm
      mm=ll;
    end
end
if mm<110
   fprintf('缺陷是点\n'); 
   xi=zeros(x,1);
   yi=zeros(x,1);
   xx=zeros(x,1);
   yy=zeros(x,1);
   xc=zeros(x,1);
   yc=zeros(x,1);
   lll=zeros(x,1);
    for i=1:x
      lll(i)=length(B{i});
      ll=length(B{i});
      if ll>10
        for ij=1:ll
          xi(i)=xi(i)+double(ab(B{i}(ij,1),B{i}(ij,2)));
          yi(i)=yi(i)+double(ab(B{i}(ij,1),B{i}(ij,2)));
          xx(i)=xx(i)+double(ab(B{i}(ij,1),B{i}(ij,2))).*B{i}(ij,1);
          yy(i)=yy(i)+double(ab(B{i}(ij,1),B{i}(ij,2))).*B{i}(ij,2);
        end
      end
   xc(i)=xx(i)./xi(i);
   yc(i)=yy(i)./yi(i);
    end
 xc=xc(~isnan(xc));
 yc=yc(~isnan(yc));
 figure(4),imshow(a6);
 hold on;
 plot(yc+12,xc+12,'*');
 [dd,bb]=size(xc);
 fprintf('一共有%d以上个点',dd);
else
  %ab1=bwmorph(ab1,'thin',5);
%   ss=thres(a6);
%   ab1=im2bw(a6,ss/255);
  figure(3),imshow(ab1);
  a6(1:12,:)=[];
  a6(177:188,:)=[];
  a6(:,1:12)=[];
  a6(:,177:188)=[];
  mu1=uint8(ab1).*a6;
  mu2=uint8(1-ab1).*a6;
  t0=mu1(mu1~=0);
  m1=mean(t0);
  t1=mu2(mu2~=0);
  m2=mean(t1);
  MAPPING=getmapping(16,'riu2');
  %lbps=lbp(a6,2,16,MAPPING,'hist');
  %predict_label = svmclassify(svmModel,lbps); 
  if m1<m2+20
  fprintf('缺陷是斑点\n');
  figure(5),imshow(mu1);
  all=bwarea(ab1);
  pro=all/176/176;
  fprintf('斑点所占总比为%.3f',pro);
  figure(4),imshow(a6);
  hold on;
  for k = 1:length(B)
    boundary = B{k};
    plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
  end
  else  
       ss=thres(a6);
       ab1=im2bw(a6,ss/255);
    %ab1=im2bw(a6,graythresh(a6));
    ab1=imclose(ab1,strel('square',5));
    ab1=bwmorph(ab1,'thin',5);
    %[B,L]=bwboundaries(ab1);
    ab1=edge(ab1,'Canny');
    figure(5),imshow(ab1);
    hold on;
    
  fprintf('缺陷是划痕\n');
  [H,T,R] = hough(ab1,'RhoResolution',5,'Theta',-90:0.1:89.9);
  P=houghpeaks(H,35,'threshold',ceil(0.3*max(H(:))));
  lines = houghlines(ab1,T,R,P,'FillGap',5,'MinLength',7);
  point=zeros(length(lines),4);
  ang=zeros(length(lines),1);
    for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
   dis=sqrt((xy(1,1)-xy(2,1))^2+(xy(1,2)-xy(2,2))^2);
   if dis>30
   point(k,1:2)=lines(k).point1;
   point(k,3:4)=lines(k).point2;
   ang(k)=lines(k).theta;
   
   end
    end
    point(any(point==0,2),:)=[];
    ang(any(ang==0,2),:)=[];
    cen=zeros(length(ang),2);
    po=zeros(length(ang),4);
    an=zeros(length(ang),1);
    p1=zeros(length(ang),4);
    an1=zeros(length(ang),1);
    thm=mean(abs(ang));
    if abs(thm)<45
        thm=40;
    else
        thm=60;
    end

    p1(all(p1==0,2),:)=[];
    an1(all(an1==0,2),:)=[];
    le=length(cen);
    
    for kk=1:le
         cen(kk,1)=(point(kk,1)+point(kk,3))/2;
         cen(kk,2)=(point(kk,2)+point(kk,4))/2;
         point(kk,5)=cen(kk,1);
         point(kk,6)=cen(kk,2);
    end
    
        
        if thm==40
            [point,ind]=sortrows(point,5);
        end
        if thm==60
            point=sortrows(point,6);
        end
       
        
      anm=0;  
      cend=zeros(length(cen)-2,1);
      figure(6),imshow(a6);
      hold on;
      count=0;
     if thm==60   
        for kk=2:le
            if abs(point(kk-1,6)-point(kk,6))<5
               po(kk,:)=point(kk,1:4);
               an(kk)=ang(kk);
               anm=mean(an(1:kk));
            else
                count=count+1;
               po(all(po==0,2),:)=[];
               max_x=max(max(po(:,1)),max(po(:,3)));
               min_x=min(min(po(:,1)),min(po(:,3)));
               max_y=max(max(po(:,2)),max(po(:,4)));
               min_y=min(min(po(:,2)),min(po(:,4)));
         if anm>0
               plot(max_x,max_y,'x','LineWidth',2,'Color','green');
               plot(min_x,min_y,'x','LineWidth',2,'Color','blue');
               xy(1,:)=[max_x,max_y];
               xy(2,:)=[min_x,min_y];
               plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
        else
        plot(max_x,min_y,'x','LineWidth',2,'Color','green');
        plot(min_x,max_y,'x','LineWidth',2,'Color','blue');   
        xy(1,:)=[max_x,min_y];
        xy(2,:)=[min_x,max_y];
        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         end
         dis=sqrt((max_x-min_x)^2+(max_y-min_y)^2);
               fprintf('第%d条划痕长%.2f\n',count,dis);
               po=zeros(length(ang),4);
            end
        end
     po(all(po==0,2),:)=[];
               max_x=max(max(po(:,1)),max(po(:,3)));
               min_x=min(min(po(:,1)),min(po(:,3)));
               max_y=max(max(po(:,2)),max(po(:,4)));
               min_y=min(min(po(:,2)),min(po(:,4)));
         if anm>0
               plot(max_x,max_y,'x','LineWidth',2,'Color','green');
               plot(min_x,min_y,'x','LineWidth',2,'Color','blue');
               xy(1,:)=[max_x,max_y];
               xy(2,:)=[min_x,min_y];
               plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         else
         plot(max_x,min_y,'x','LineWidth',2,'Color','green');
         plot(min_x,max_y,'x','LineWidth',2,'Color','blue'); 
         xy(1,:)=[max_x,min_y];
        xy(2,:)=[min_x,max_y];
        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         end
         count=count+1;
         dis=sqrt((max_x-min_x)^2+(max_y-min_y)^2);
               fprintf('第%d条划痕长%.2f\n',count,dis);
               fprintf('一共有%d条线\n',count);
       
     
     elseif thm==40
         for kk=2:le
            if abs(point(kk-1,5)-point(kk,5))<10
               po(kk,:)=point(kk,1:4);
               an(kk)=ang(kk);
               anm=mean(an(1:kk));
               %poi=mean(po(kk,1));
               %poj=mean(po(kk,3));
            else
%                an(kk)=ang(kk);
%                 anm=mean(an(1:kk));
%                 poi=mean(po(kk,1));
%                 poj=mean(po(kk,3));
                count=count+1;
                po(all(po==0,2),:)=[];
                max_x=max(max(po(:,1)),max(po(:,3)));
               min_x=min(min(po(:,1)),min(po(:,3)));
                max_y=max(max(po(:,2)),max(po(:,4)));
                min_y=min(min(po(:,2)),min(po(:,4)));
               
               
               
         if anm>0
               plot(max_x,max_y,'x','LineWidth',2,'Color','green');
               plot(min_x,min_y,'x','LineWidth',2,'Color','blue');
               xy(1,:)=[max_x,max_y];
               xy(2,:)=[min_x,min_y];
               plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         else
               plot(max_x,min_y,'x','LineWidth',2,'Color','green');
               plot(min_x,max_y,'x','LineWidth',2,'Color','blue');    
               xy(1,:)=[max_x,min_y];
               xy(2,:)=[min_x,max_y];
               plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         end   
               dis=sqrt((max_x-min_x)^2+(max_y-min_y)^2);
               fprintf('第%d条划痕长%.2f\n',count,dis);
               po=zeros(length(ang),4);
            end
               
         end
         
        po(all(po==0,2),:)=[];
               %poi=mean(po(:,1));
               %poj=mean(po(:,3));
               max_x=max(max(po(:,1)),max(po(:,3)));
               min_x=min(min(po(:,1)),min(po(:,3)));
               max_y=max(max(po(:,2)),max(po(:,4)));
               min_y=min(min(po(:,2)),min(po(:,4)));
        if anm>0
               plot(max_x,max_y,'x','LineWidth',2,'Color','green');
               plot(min_x,min_y,'x','LineWidth',2,'Color','blue');
               xy(1,:)=[max_x,max_y];
               xy(2,:)=[min_x,min_y];
               plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
         else
         plot(max_x,min_y,'x','LineWidth',2,'Color','green');
         plot(min_x,max_y,'x','LineWidth',2,'Color','blue');    
         xy(1,:)=[max_x,min_y];
        xy(2,:)=[min_x,max_y];
        plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
        end
        count=count+1;
         dis=sqrt((max_x-min_x)^2+(max_y-min_y)^2);
               fprintf('第%d条划痕长%.2f\n',count,dis);
               fprintf('一共有%d条线\n',count);
     end
       
  end
end


clear;   



