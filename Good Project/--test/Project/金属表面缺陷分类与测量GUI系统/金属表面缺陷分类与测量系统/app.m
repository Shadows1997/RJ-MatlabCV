%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�������ļ�%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%�����б�����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
����ͼ����γ����
1602122�ڶ���
ѧ��:�ྴ�� �ܺ��� �
��ʦ:����
-----------------------------------------------------------------------------------------
//��Ʒ����:
��������Ҫ������ʵ�ֽ�����������ȱ�ݵļ�⡢���༰��������ʹ��GUI���з�װ�Ա����û�ʹ�á�
��GUI���Ե�������еĻҶ�ͼƬ��֮����д�����ȷ��ȱ�ݵ����࣬����⵽��ȱ�ݱ�ע��ԭͼ�ϣ�
���ܹ�������ͬȱ�ݵĴ�С(��ͬȱ�ݺ�����׼��ͬ)��
------------------------------------------------------------------------------------------
//��Ҫ�������:
#pushbutton1_Callback(hObject, eventdata,handles):
����1(��'ͼ����'����)�Ļص�����������ȫ��ͼ�����㷨
#pushbutton2_Callback(hObject, eventdata,handles):
����2(��'ͼƬ����'����)�Ļص���������Ҫ��ͼƬ�ĵ���
#Ga(theta,num):ͼ���Garbor����˵ĳ�ʼ��
#filterimage(a6,Gaborfiter):Garbor�˲��㷨
#thres(image):�Ҷ�ͼ���������ֵ�ָ��㷨
#location():'��������Ƥ'ȱ�ݵĶ�λ����ʾ
#houghtran():����'����'ȱ�ݵĻ���Բ���
#lbp(varargin):���ϵ�'�ֲ���ֵģʽ'������ȡ�㷨
#svm.m:����m�ļ����������н���ȱ����Ƭ��LBP������ȡ��SVM(֧��������)�ලѧϰ�㷨��ѵ�������
--------------------------------------------------------------------------------------------
author:Faust.Cao
time:2018.11.1
%}



%%
function varargout = app(varargin)
%GUIҳ����������MATLAB�ṩ�������޸�

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
% GUI��ʼ������
%�޸����ñ���
%modified by:Faust.Cao

ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 %���ó���ı���ͼΪback.jpg
 ii=imread('D:\matlab\matlab������Ŀ\design\back.jpg');
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');

handles.output = hObject;
guidata(hObject, handles);
%%


function varargout = app_OutputFcn(hObject, eventdata, handles) 
% GUI���������MATLAB�ṩ�������޸�

varargout{1} = handles.output;
%%


function pushbutton1_Callback(hObject, eventdata, handles)
% ����1(��'ͼ����'����)�Ļص�����������ȫ��ͼ�����㷨

global a5;%ȫ�ֱ���
global svmModel;%ȫ�ֱ�������svm.m�ļ�����
axis off;%ȥ��axes���꣬������ʾͼƬ
a6=a5;
a=str2double(get(handles.edit1,'string'));%��ȡ�û�����Ľ���
b=str2double(get(handles.edit2,'string'));%��ȡ�û���������

d=a/(b-a);%�ɸ�˹��ʽ���㴹��Ŵ���

ma=max(max(a6));
mi=min(min(a6));
%�Աȶ���ǿ�����Ҷ�ӳ��Ϊ[0,255]
for ii=1:200 
    for jj=1:200
        a6(ii,jj)=255*double(a6(ii,jj)-mi)./double(ma-mi);
    end
end
%ͼ���˲�
ab=filterimage(a6);

%ͼ���������ֵ�ָ�
ss=thres(ab);
ab1=im2bw(ab,ss/255);

[B,L]=bwboundaries(ab1);%��ֵͼ��Ե������ȡ
[x,y]=size(B);
mm=0;
%Ѱ�������ȡ����
for i=1:x
    ll=length(B{i});
    if ll>mm
      mm=ll;
    end
end
%�ж��Ƿ���'��������Ƥ'ȱ��
if mm<120 
 set(handles.text8,'string','ȱ������������Ƥ');%��text8�ı������ȱ������
 [xc,yc]=findcenter(B,ab);%�����ȡ���������λ��
 axes(handles.axes2);%������axes2����ʾ
 imshow(a6);
 hold on;
 plot(yc+12,xc+12,'*');%�����˲�ʱʧȥ�ı߽�
 [dd,bb]=size(xc);
 tex=['һ����',num2str(dd),'�����ϵĵ�'];
 set(handles.text10,'string',tex);%��text10�ı������ȱ����Ϣ
%����'��������Ƥ'ȱ�ݣ������ж�
else
  %ԭͼ���ֵͼ������ģ����ע����ߴ�С��ͬ����Ҫ���޳�ԭͼ��Ե
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
  %�ж�ȱ���ǰߵ㻹�ǻ���:�ߵ�ȱ����������۱ȱ�����������ģ�뱳��ʣ���ֵ�Ƚ�
  %Ҳ��������ȡͼ���LBP(�ֲ���ֵģʽ)��������ʹ��SVMѵ���Ľ�������з���
  if m1<m2+20
    set(handles.text8,'string','ȱ���ǰߵ�');
    
    all=bwarea(ab1);%����ߵ����
    pro=100*all/176/176;%������ռ�ٷֱ�
    tex=['�ߵ���ռ�����Ϊ',num2str(pro),'%'];
    set(handles.text10,'string',tex);
    axes(handles.axes2);
    imshow(a6);
    hold on;
    %��ע���ߵ�߽�
    for k = 1:length(B)
      boundary = B{k};
      plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 2)
    end
    
  %ȱ���ǻ���
  else  
    a6=adapthisteq(a6);%����Ӧֱ��ͼ���⻯�ٴμ�ǿ�Աȶ�
    ss=thres(a6);
    ab1=im2bw(a6,ss/255);
    
    ab1=imclose(ab1,strel('square',6));%�Զ�ֵͼ�������㣬���Ͽ���������
    ab1=bwmorph(ab1,'thin',5);%�Զ�ֵͼ�ٽ���ϸ��
    ab1=edge(ab1,'Canny');%ʹ��Canny���ӱ�Ե��ȡ
    set(handles.text8,'string','ȱ���ǻ���');
    axes(handles.axes2);
    imshow(a6);
    hold on;
    
    %�����ǻ�����ȡ�ĺ�����������ʾ
    [point,ang]=houghtran( ab1 );%�Դ���õĶ�ֵͼ���л���ֱ�߼��

    cen=zeros(length(ang),2);
    po=zeros(length(ang),4);
    an=zeros(length(ang),1);
    thm=mean(abs(ang));
   %�жϻ����Ǻ��߻�������(ֱ����y��н�)
    if abs(thm)<45%����
        thm=40;
    else%����
        thm=60;
    end
    
    le=length(cen);
    %��ȡÿ��ֱ�ߵ��е�λ��
    for kk=1:le
        cen(kk,1)=(point(kk,1)+point(kk,3))/2;
        cen(kk,2)=(point(kk,2)+point(kk,4))/2;
        point(kk,5)=cen(kk,1);
        point(kk,6)=cen(kk,2);
    end
    %���е��ֱ�߽�������
    if thm==40%��������ߣ�������������
        point=sortrows(point,5);
    end
    if thm==60%����Ǻ��ߣ�������������
        point=sortrows(point,6);
    end
      
    anm=0;     
    count=0;
    data=cell(10,2);
    po(1,:)=point(1,1:4);
    if thm==60   
        for kk=2:le
            if abs(point(kk-1,6)-point(kk,6))<5%�ж��Ƿ���ͬһ����
               po(kk,:)=point(kk,1:4);
               an(kk)=ang(kk);
               anm=mean(an(1:kk));
            else            
               [max_x,min_x,max_y,min_y,count ] = min_max(po,count);%�󻮺۶˵�
               dis=plotfigure(max_x,min_x,max_y,min_y,anm);%��ͼ             
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
               tex=['һ����',num2str(count),'����'];
               set(handles.text10,'string',tex);              
               data{count,1}=dis;%ֱ����ռ���س���
               rea=dis/(d*500);%����̽��������1cm*1cm����Ԫ20um��200*200����
               data{count,2}=rea;%���ι�ѧת�����ʵ�ʳ���
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
               tex=['һ����',num2str(count),'������'];
               set(handles.text10,'string',tex);
    end    
  end
end
%%


function pushbutton2_Callback(hObject, eventdata, handles)
% ����2(��'ͼƬ����'����)�Ļص���������Ҫ��ͼƬ�ĵ���
data={};
set(handles.uitable1,'DATA',data);
hold off;
plot(0,0);
axis off;
global a5;%ȫ�ֱ��������������(�ܱ�����1�ص���������)
axes(handles.axes1);%������axes1����ʾͼƬ
%Ĭ��·��:D:\NEU surface defect database���û������ڴ˴��޸�
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'Pick an image','D:\NEU surface defect database');
str=[pathname filename];
if isequal(filename,0)||isequal(pathname,0)
    warndlg('����ѡ��һ����������ȱ�ݵ�ͼƬ��','Warning');%δѡ����Ƭ��ʾ
    return;
else
    a5 = imread(str);     
    imshow(a5);%��axes1����ʾͼƬ
    
end
%%


function pushbutton4_Callback(hObject, eventdata, handles)
% ����4�Ļص����������û��ṩһ�����ؽ���ȱ�����ݼ�����վ������

web https://pan.baidu.com/s/1B_SLhZNRPeKznDc78GY2QA;%ͼƬ���ݼ����ص�ַ
%%


function edit1_Callback(hObject, eventdata, handles)
% �ı���1�Ļص����������û�������������Ľ���������ʵ�������С

a=str2num(get(hObject,'string'));%����û�����
if isempty(a)
    set(hObject,'string','0');
end
guidata(hObject,handles);
%%



function edit1_CreateFcn(hObject, eventdata, handles)
% �ı���1�ĳ�ʼ��������MATLAB�ṩ�������޸�

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%


function edit2_Callback(hObject, eventdata, handles)
% �ı���2�Ļص����������û������������������ʵ�������С

a=str2num(get(hObject,'string'));%����û�����
if isempty(a)
    set(hObject,'string','0');
end
guidata(hObject,handles);
%%



function edit2_CreateFcn(hObject, eventdata, handles)
% �ı���1�ĳ�ʼ��������MATLAB�ṩ�������޸�

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%end of the file%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
