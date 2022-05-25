%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%主函数文件%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%请运行本程序%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
数字图像处理课程设计
1602122第二组
学生:燕敬阳 曹恒镇 杨丹
老师:李琳
-----------------------------------------------------------------------------------------
//作品概述:
本代码主要功能是实现金属表面三种缺陷的检测、分类及测量，并使用GUI进行封装以便于用户使用。
该GUI可以导入电脑中的灰度图片，之后进行处理，能确定缺陷的种类，将检测到的缺陷标注在原图上，
并能够测量不同缺陷的大小(不同缺陷衡量标准不同)。
------------------------------------------------------------------------------------------
//重要函数简介:
#pushbutton1_Callback(hObject, eventdata,handles):
按键1(即'图像处理'按键)的回调函数，包含全部图像处理算法
#pushbutton2_Callback(hObject, eventdata,handles):
按键2(即'图片导入'按键)的回调函数，主要是图片的导入
#Ga(theta,num):图像的Garbor卷积核的初始化
#filterimage(a6,Gaborfiter):Garbor滤波算法
#thres(image):灰度图的最大熵阈值分割算法
#location():'轧入氧化皮'缺陷的定位及显示
#houghtran():对于'划痕'缺陷的霍夫圆检测
#lbp(varargin):网上的'局部二值模式'特征提取算法
#svm.m:独立m文件，用于所有金属缺陷照片的LBP特征提取和SVM(支持向量机)监督学习算法的训练与测试
--------------------------------------------------------------------------------------------
author:Faust.Cao
time:2018.11.1
%}



%%
function varargout = app(varargin)
%GUI页面主函数，MATLAB提供，无需修改

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @app_OpeningFcn, ...
                   'gui_OutputFcn',  @app_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
%%

 
function app_OpeningFcn(hObject, eventdata, handles, varargin)
% GUI初始化函数
%修改设置背景
%modified by:Faust.Cao

ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 %设置程序的背景图为back.jpg
 ii=imread('D:\matlab\matlab工程项目\design\back.jpg');
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');

handles.output = hObject;
guidata(hObject, handles);
%%


function varargout = app_OutputFcn(hObject, eventdata, handles) 
% GUI输出函数，MATLAB提供，无需修改

varargout{1} = handles.output;
%%


function pushbutton1_Callback(hObject, eventdata, handles)
% 按键1(即'图像处理'按键)的回调函数，包含全部图像处理算法

global a5;%全局变量
global svmModel;%全局变量，从svm.m文件调用
axis off;%去除axes坐标，完整显示图片
a6=a5;
a=str2double(get(handles.edit1,'string'));%读取用户输入的焦距
b=str2double(get(handles.edit2,'string'));%读取用户输入的物距

d=a/(b-a);%由高斯公式计算垂轴放大率

ma=max(max(a6));
mi=min(min(a6));
%对比度增强，将灰度映射为[0,255]
for ii=1:200 
    for jj=1:200
        a6(ii,jj)=255*double(a6(ii,jj)-mi)./double(ma-mi);
    end
end
%图像滤波
ab=filterimage(a6);

%图像最大熵阈值分割
ss=thres(ab);
ab1=im2bw(ab,ss/255);

[B,L]=bwboundaries(ab1);%二值图边缘坐标提取
[x,y]=size(B);
mm=0;
%寻找最大提取区域
for i=1:x
    ll=length(B{i});
    if ll>mm
      mm=ll;
    end
end
%判断是否是'轧入氧化皮'缺陷
if mm<120 
 set(handles.text8,'string','缺陷是轧入氧化皮');%在text8文本框处输出缺陷类型
 [xc,yc]=findcenter(B,ab);%求各提取区域的质心位置
 axes(handles.axes2);%设置在axes2处显示
 imshow(a6);
 hold on;
 plot(yc+12,xc+12,'*');%加上滤波时失去的边界
 [dd,bb]=size(xc);
 tex=['一共有',num2str(dd),'个以上的点'];
 set(handles.text10,'string',tex);%在text10文本框处输出缺陷信息
%不是'轧入氧化皮'缺陷，继续判断
else
  %原图与二值图进行掩模处理，注意二者大小不同，故要先剔除原图边缘
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
  %判断缺陷是斑点还是划痕:斑点比背景暗，划痕比背景凉；将掩模与背景剩余均值比较
  %也可以先提取图像的LBP(局部二值模式)特征，再使用SVM训练的结果来进行分类
  if m1<m2+20
    set(handles.text8,'string','缺陷是斑点');
    
    all=bwarea(ab1);%计算斑点面积
    pro=100*all/176/176;%计算所占百分比
    tex=['斑点所占面积比为',num2str(pro),'%'];
    set(handles.text10,'string',tex);
    axes(handles.axes2);
    imshow(a6);
    hold on;
    %标注出斑点边界
    for k = 1:length(B)
      boundary = B{k};
      plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
    end
    
  %缺陷是划痕
  else  
    a6=adapthisteq(a6);%自适应直方图均衡化再次加强对比度
    ss=thres(a6);
    ab1=im2bw(a6,ss/255);
    
    ab1=imclose(ab1,strel('square',6));%对二值图做闭运算，将断开部分连接
    ab1=bwmorph(ab1,'thin',5);%对二值图再进行细化
    ab1=edge(ab1,'Canny');%使用Canny算子边缘提取
    set(handles.text8,'string','缺陷是划痕');
    axes(handles.axes2);
    imshow(a6);
    hold on;
    
    %往下是划痕提取的后续处理与显示
    [point,ang]=houghtran( ab1 );%对处理好的二值图进行霍夫直线检测

    cen=zeros(length(ang),2);
    po=zeros(length(ang),4);
    an=zeros(length(ang),1);
    thm=mean(abs(ang));
   %判断划痕是横线还是竖线(直线与y轴夹角)
    if abs(thm)<45%竖线
        thm=40;
    else%横线
        thm=60;
    end
    
    le=length(cen);
    %求取每根直线的中点位置
    for kk=1:le
        cen(kk,1)=(point(kk,1)+point(kk,3))/2;
        cen(kk,2)=(point(kk,2)+point(kk,4))/2;
        point(kk,5)=cen(kk,1);
        point(kk,6)=cen(kk,2);
    end
    %按中点对直线进行排序
    if thm==40%如果是竖线，按横坐标排序
        point=sortrows(point,5);
    end
    if thm==60%如果是横线，按纵坐标排序
        point=sortrows(point,6);
    end
      
    anm=0;     
    count=0;
    data=cell(10,2);
    po(1,:)=point(1,1:4);
    if thm==60   
        for kk=2:le
            if abs(point(kk-1,6)-point(kk,6))<5%判断是否是同一划痕
               po(kk,:)=point(kk,1:4);
               an(kk)=ang(kk);
               anm=mean(an(1:kk));
            else            
               [max_x,min_x,max_y,min_y,count ] = min_max(po,count);%求划痕端点
               dis=plotfigure(max_x,min_x,max_y,min_y,anm);%画图             
               data{count,1}=dis;
               rea=dis/(d*500);
               data{count,2}=rea;
               po=zeros(length(ang),4);
               set(handles.uitable1,'DATA',data);
               po=zeros(length(ang),4);
            end
         end
               [max_x,min_x,max_y,min_y,count ] = min_max(po,count);
               dis=plotfigure(max_x,min_x,max_y,min_y,anm);    
               tex=['一共有',num2str(count),'条线'];
               set(handles.text10,'string',tex);              
               data{count,1}=dis;%直线所占像素长度
               rea=dis/(d*500);%假设探测器像面1cm*1cm。像元20um。200*200像素
               data{count,2}=rea;%几何光学转化后的实际长度
               set(handles.uitable1,'DATA',data);
     
      elseif thm==40
         for kk=2:le
            if abs(point(kk-1,5)-point(kk,5))<10
               po(kk,:)=point(kk,1:4);
               an(kk)=ang(kk);
               anm=mean(an(1:kk));
            else            
               [max_x,min_x,max_y,min_y,count ] = min_max(po,count);
               dis=plotfigure(max_x,min_x,max_y,min_y,anm);
               data{count,1}=dis;
               rea=dis/(d*500);
               data{count,2}=rea;
               po=zeros(length(ang),4);
            end
          end                        
               [max_x,min_x,max_y,min_y,count ] = min_max(po,count);
               dis=plotfigure(max_x,min_x,max_y,min_y,anm);               
               data{count,1}=dis;
               rea=dis/(500*d);
               data{count,2}=rea;
               set(handles.uitable1,'DATA',data);
               tex=['一共有',num2str(count),'条划痕'];
               set(handles.text10,'string',tex);
    end    
  end
end
%%


function pushbutton2_Callback(hObject, eventdata, handles)
% 按键2(即'图片导入'按键)的回调函数，主要是图片的导入
data={};
set(handles.uitable1,'DATA',data);
hold off;
plot(0,0);
axis off;
global a5;%全局变量，函数间调用(能被按键1回调函数调用)
axes(handles.axes1);%设置在axes1处显示图片
%默认路径:D:\NEU surface defect database，用户可以在此处修改
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'Pick an image','D:\NEU surface defect database');
str=[pathname filename];
if isequal(filename,0)||isequal(pathname,0)
    warndlg('请先选择一个金属表面缺陷的图片！','Warning');%未选择照片提示
    return;
else
    a5 = imread(str);     
    imshow(a5);%在axes1处显示图片
    
end
%%


function pushbutton4_Callback(hObject, eventdata, handles)
% 按键4的回调函数，给用户提供一个下载金属缺陷数据集的网站超链接

web https://pan.baidu.com/s/1B_SLhZNRPeKznDc78GY2QA;%图片数据集下载地址
%%


function edit1_Callback(hObject, eventdata, handles)
% 文本框1的回调函数，让用户输入所用相机的焦距来计算实际物体大小

a=str2num(get(hObject,'string'));%获得用户输入
if isempty(a)
    set(hObject,'string','0');
end
guidata(hObject,handles);
%%



function edit1_CreateFcn(hObject, eventdata, handles)
% 文本框1的初始化函数，MATLAB提供，无需修改

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit2_Callback(hObject, eventdata, handles)
% 文本框2的回调函数，让用户输入所用物距来计算实际物体大小

a=str2num(get(hObject,'string'));%获得用户输入
if isempty(a)
    set(hObject,'string','0');
end
guidata(hObject,handles);
%%



function edit2_CreateFcn(hObject, eventdata, handles)
% 文本框1的初始化函数，MATLAB提供，无需修改

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end of the file%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
