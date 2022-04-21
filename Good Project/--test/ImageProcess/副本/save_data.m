function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 29-Jan-2018 12:12:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;
ha=axes('units','normalized','pos',[0 0 1 1]);
 uistack(ha,'down');
 ii=imread('12.jpg');
%设置程序的背景图为beijing1.jpg
 image(ii);
 colormap gray
 set(ha,'handlevisibility','off','visible','off');
%%
% Update handles structure
guidata(hObject, handles);
 setappdata(handles.figure1,'img_src',0);


% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
[filename,pathname]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif'},'选择图片');
str=[pathname,filename];
im=imread(str);
axes(handles.axes1);
imshow(im)

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
if FileName==0  
    return;  
else  
    h=getframe(handles.axes2);  
    imwrite(h.cdata,[PathName,FileName]);  
end;  


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%  保存数据
data=getappdata(handles.figure1,'avg');%获得数据
data = num2str(data);%数字转成字符串
[FileName PathName]=uiputfile({
    '*.txt','Txt Files(*.txt)';'*.*','All Files(*.*)'},'choose a File');%pathname获取保存数据路径，filename获取保存数据名称
str= [PathName FileName]
% set(handles.edit4,'string',str);
% m=get(handles.displayArea,'String')
fid = fopen(char(str), 'w');
fwrite(fid, '', 'integer*4')
fprintf(fid,'%s',data);
fclose(fid)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1=rgb2gray(im);
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1=im2bw(im);
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
se=strel('disk',14);
im1=imdilate(im,se);
axes(handles.axes2);
imshow(im1)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
se=strel('disk',14);
im1=imerode(im,se);
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1= imresize(im, 0.5);
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1=imrotate(im,30,'bilinear','loose');
axes(handles.axes2);
imshow(im1)
% imshow(imrotate(A,30,'bilinear','crop'));

% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
im1=imcrop(im,[30 130 800 2000]);
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
I=rgb2gray(im);
im1=flipdim(I,2);
axes(handles.axes2);
imshow(im1)
% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
I=rgb2gray(im);
im1=flipdim(I,1);
axes(handles.axes2);
imshow(im1)


% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
i2=im2double(im);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
k2=medfilt2(ixc,[7 7]);
isuo=imresize(k2,0.25,'bicubic');
im1=edge(isuo,'sobel');
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
i2=im2double(im);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
k2=medfilt2(ixc,[7 7]);
isuo=imresize(k2,0.25,'bicubic');
im1=edge(isuo,'roberts');
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
i2=im2double(im);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
k2=medfilt2(ixc,[7 7]);
isuo=imresize(k2,0.25,'bicubic');
im1=edge(isuo,'prewitt');
axes(handles.axes2);
imshow(im1)

% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
i2=im2double(im);
ihd=rgb2gray(i2);
[thr,sorh,keepapp]=ddencmp('den','wv',ihd);
ixc=wdencmp('gbl',ihd,'sym4',2,thr,sorh,keepapp);
k2=medfilt2(ixc,[7 7]);
isuo=imresize(k2,0.25,'bicubic');
im1=edge(isuo,'canny');
axes(handles.axes2);
imshow(im1)


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
set(hObject,'xtick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');

% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(hObject,'xtick',[]);
set(hObject,'ytick',[]);
set(hObject,'box','on');
% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
% RGB1=imcrop(im,[1500,1600,400,425]);
% figure,imshow(img);
[m n]=size(im);
max=0;
min=256;
avg=0;
for i=1:1:m
    for j=1:1:n
        if im(i,j)<min
            min=im(i,j);
        end
        if im(i,j)>max
            max=im(i,j);
        end
        avg=avg+double(im(i,j));
    end
end

%avg=mean(mean(img));
avg=uint8(avg/(m*n));
% max
% min

set(handles.text1,'string',num2str(avg));
setappdata(handles.figure1,'avg',avg); 

% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im
HSV=rgb2hsv(im);
Hgray=rgb2gray(HSV);
%% 
%计算64位灰度共生矩阵 计算四个共生矩阵,取距离为1，角度分别为0,45,90,135
glcms1=graycomatrix(Hgray,'numlevels',64,'offset',[0 1;-1 1;-1 0;-1 -1]);
%纹理特征统计值(包括对比度、相关性、熵、平稳度、二阶矩也叫能量)
stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
%% 
ga1=glcms1(:,:,1);%0度
ga2=glcms1(:,:,2);%45度
ga3=glcms1(:,:,3);%90度
ga4=glcms1(:,:,4);%135度

%%
s1=0;s2=0;s3=0;s4=0;s5=0;
for m=1:4
    s1=stats.Contrast(1,m)+s1;%对比度
    m=m+1;
end
for m=1:4
    s2=stats.Correlation(1,m)+s2;%相关性
    m=m+1;
end
for m=1:4
    s3=stats.Energy(1,m)+s3;%熵
    m=m+1;
end
for m=1:4
    s4=stats.Homogeneity(1,m)+s4;%平稳度
    m=m+1;
end

%% 整合数据

Contrast = stats.Contrast
Correlation = stats.Correlation
Energy = stats.Energy
Homogeneity = stats.Homogeneity
data=[Contrast Correlation Energy Homogeneity];
% data = num2str(data);%数字转成字符串
set(handles.text1,'string',num2str(data));
setappdata(handles.figure1,'avg',data); 


% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_33_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_28_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
