function varargout = image_processing_system(varargin)
% IMAGE_PROCESSING_SYSTEM MATLAB code for image_processing_system.fig
%      IMAGE_PROCESSING_SYSTEM, by itself, creates a new IMAGE_PROCESSING_SYSTEM or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING_SYSTEM returns the handle to a new IMAGE_PROCESSING_SYSTEM or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING_SYSTEM.M with the given input arguments.
%
%      IMAGE_PROCESSING_SYSTEM('Property','Value',...) creates a new IMAGE_PROCESSING_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_processing_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_processing_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_processing_system

% Last Modified by GUIDE v2.5 08-Jan-2021 16:22:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_processing_system_OpeningFcn, ...
                   'gui_OutputFcn',  @image_processing_system_OutputFcn, ...
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


% --- Executes just before image_processing_system is made visible.
function image_processing_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_processing_system (see VARARGIN)

% Choose default command line output for image_processing_system
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes image_processing_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_processing_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


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
%打开图片
global im;
axes(handles.axes1);  
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},...
                'Pick an image',...
                'D:\matlab\bin\matlab work');  
str=[pathname filename];  
if isequal(filename,0)||isequal(pathname,0)  
    warndlg('Please select a picture first!','Warning');  
    return;  
else  
    im = imread(str); 
    imshow(im);    
end
axes(handles.axes1);%用axes命令设定当前操作的坐标轴是axes1
fpath=[pathname filename];%将文件名和目录名组合成一个完整的路径
imshow(imread(fpath));

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)%保存图片
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
end


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGB图转灰度图
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
imshow(I);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGB图转索引图
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
[X1,map1]=rgb2ind(im,64);%将RGB图像转化为索引图像，颜色种类N至少64种
imshow(X1);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGB图转二值图
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
BW=im2bw(im);
imshow(BW);
toc
time=toc;
set(handles.edit4,'string',time);


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


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


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
%线性灰度变换
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
gamma=0.5;                            %设定调整线性度取值
I=im;                   			  %读入要处理的图像，并赋值给I
R=I;                                  %将图像数据赋值给R
R (:,:,2)=0;                          %将原图像变成单色图像，保留红色
R(:,:,3)=0;
R1=imadjust(R,[0.5 0.8],[0 1],gamma); %利用函数imadjust调整R的灰度，结果返回R1
G=I;								  %将图像数据赋值给G
G(:,:,1)=0;							  %将原图像变成单色图像，保留绿色
G(:,:,3)=0;
G1=imadjust(G,[0 0.3],[0 1],gamma);	  %利用函数imadjust调整G的灰度，结果返回G1
B=I;								  %将图像数据赋值给B
B(:,:,1)=0;							  %将原图像变成单色图像，保留蓝色
B(:,:,2)=0;
B1=imadjust(B,[0 0.3],[0 1],gamma);	  %利用函数imadjust调整B的灰度，结果返回B1
I1=R1+G1+B1;                          %求变换后的RGB图像  
imshow(I1);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%分段线性灰度变换
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
R=im;                   %读入原图像，赋值给R
J=rgb2gray(R);          %将彩色图像数据R转换为灰度图像数据J
[M,N]=size(J);          %获得灰度图像数据J的行列数M，N
x=1;y=1;                %定义行索引变量x、列索引变量y    
for x=1:M
    for y=1:N
        if (J(x,y)<=35);     %对灰度图像J进行分段处理，处理后的结果返回给矩阵H
            H(x,y)=J(x,y)*10;
        elseif(J(x,y)>35&J(x,y)<=75);
            H(x,y)=(10/7)*[J(x,y)-5]+50;
        else(J(x,y)>75);
            H(x,y)=(105/180)*[J(x,y)-75]+150;
        end
    end
end
set(0,'defaultFigurePosition',[100,100,1000,500]);%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])%修改图形背景颜色的设置
imshow(H);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%非线性灰度变换
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
R=im;                                       %读入图像，赋值给R
G=rgb2gray(R);                              %转成灰度图像
J=double(G);                                %数据类型转换成双精度
H=(log(J+1))/10;                             %进行基于常用对数的非线性灰度变换
set(0,'defaultFigurePosition',[100,100,1000,500]);%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])%修改图形背景颜色的设置
imshow(H);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%加法
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('加数：','加法');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
J=imadd(im,b);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%减法
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('减数：','减法');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
J=imsubtract(im,b);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%乘法
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('乘数：','乘法');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
J=immultiply(im,b);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%除法
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('除数：','除法');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
J=imdivide(im,b);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%与运算操作 (图像阈值分别为0.2、0.4与运算)
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I1=im2bw(im,0.2);
I2=im2bw(im,0.4);
I3=I1&I2;
imshow(I3);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%或运算操作 (图像阈值分别为0.2、0.4或运算)
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I1=im2bw(im,0.2);
I2=im2bw(im,0.4);
I3=I1|I2;
imshow(I3);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%非运算操作 
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I1=im2bw(im);
I2=~I1;
imshow(I2);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%平移图像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=im; %输入图像
addition=inputdlg('横坐标：','横坐标');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
a=addition3(1,1);%输入值横坐标
addition=inputdlg('纵坐标：','纵坐标');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值纵坐标
J1=move(I,a,b);%移动原图像
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);

function J=move(I,a,b) 
% 定义一个函数名字move，I表示输入图像，a和b描述I图像沿着x轴和y轴移动的距离
% 不考虑平移以后，图像溢出情况，找不到对应点的地方都赋值为1
[M,N,G]=size(I);%获取输入图像I的大小
I=im2double(I); %将图像数据类型转换成双精度
J=ones(M,N,G);  %初始化新图像矩阵全为1，大小与输入图像相同
for i=1:M
    for j=1:N
        if((i+a)>=1&&(i+a<=M)&&(j+b>=1)&&(j+b<=N));%判断平移以后行列坐标是否超出范围
            J(i+a,j+b,:)=I(i,j,:);%进行图像平移
        end
    end
end

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
%缩放图像（缩小后图像丢失一部分原图信息，放大后会使得图像更加清晰）
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
addition=inputdlg('缩放大小：','横坐标');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值横坐标
J1=imresize(im,b);
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%转置图像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
J1=transp(im);
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);


function J=transp(I)
%I表示输入的原始图像
%J表示经过转置以后的图像
[M,N,G]=size(I);%获取输入图像I的大小
I=im2double(I); %将图像数据类型转换成双精度
J=ones(N,M,G);  %初始化新图像矩阵全为1，大小与输入图像相同
for i=1:M
    for j=1:N
      J(j,i,:)=I(i,j,:);%进行图像转置    
    end
end

% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%旋转
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('旋转角度：','旋转');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
J=imrotate(im,b);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%水平镜像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
J1=mirror(im,1);
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);




function OutImage=mirror(InImage,n)
%mirror函数实现图像镜像变换功能
%参数n为1时，实现水平镜像变换
%参数n为2时，实现垂直镜像变换
%参数n为3时，实现水平垂直镜像变换
I=InImage;
[M,N,G]=size(I);%获取输入图像I的大小
J=I;  %初始化新图像矩阵全为1，大小与输入图像相
if (n==1)
    for i=1:M
        for j=1:N
            J(i,j,:)=I(M-i+1,j,:);%n=1,水平镜像
        end
    end;
elseif (n==2)
     for i=1:M
        for j=1:N
            J(i,j,:)=I(i,N-j+1,:);%n=2,垂直镜像
        end
     end    
elseif (n==3)
     for i=1:M
        for j=1:N
            J(i,j,:)=I(M-i+1,N-j+1,:);%n=3,水平垂直镜像
        end
     end
else
    error('参数n输入不正确，n取值1、2、3')%n输入错误时提示
end
    OutImage=J;

    

% --------------------------------------------------------------------
function Untitled_33_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%垂直镜像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
J1=mirror(im,2);
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_34_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%水平垂直镜像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
J1=mirror(im,3);
imshow(J1);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_36_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_37_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_38_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_43_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%高斯低通滤波器
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);%滤波器行数
N=2*size(I,2);%滤波器列数
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=80;%低通截止频率为80
H=double(D<=D0);%理想低通滤波器
J=fftshift(fft2(I,size(H,1),size(H,2)));%时域图像转换到频域
K=J.*H;%滤波处理
L=ifft2(ifftshift(K));%傅里叶反变换
L=L(1:size(I,1),1:size(I,2));
imshow(L);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_44_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%巴特沃斯高通滤波器
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);%滤波器行数
N=2*size(I,2);%滤波器列数
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
D0=50;%截止频率为50
n=6;%巴特沃斯滤波器的阶数
H=1./(1+(D0./D).^(2*n));%设计滤波器
J=fftshift(fft2(I,size(H,1),size(H,2)));%时域图像转化为频域
K=J.*H;%滤波
L=ifft2(ifftshift(K));%频域图像转化为时域
L=L(1:size(I,1),1:size(I,2));%调整大小
imshow(L);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_45_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%带阻滤波器
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);
N=2*size(I,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u, v);
D=sqrt(U.^2+V.^2);
D0=50;
W=30;
H=double(or(D<(D0-W/2), D>D0+W/2));
J=fftshift(fft2(I, size(H, 1), size(H, 2))); 
K=J.*H;
L=ifft2(ifftshift(K));
L=L(1:size(I,1), 1:size(I, 2));
imshow(L);
toc
time=toc;
set(handles.edit4,'string',time);




% --------------------------------------------------------------------
function Untitled_41_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_42_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_39_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%灰度变换增强图像
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
M=stretchlim(I);%获取最佳区间
J=imadjust(I,M,[]);%调整灰度范围
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);



% --------------------------------------------------------------------
function Untitled_40_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%直方图增强（直方图规定化）
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
hgram=ones(1,256);
J=histeq(I,hgram);
imshow(uint8(J));
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_47_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%线性滤波（默认：平滑滤波器）
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im;
h=fspecial('average',3);%采用3*3平均模板
I2=imfilter(I,h,'corr','replicate');%平滑滤波
imshow(I2);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_48_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%中值滤波器
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
R=medfilt2(im(:,:,1));%%红，中值滤波器，模板大小3*3
G=medfilt2(im(:,:,2));%%绿，中值滤波器，模板大小3*3
B=medfilt2(im(:,:,3));%%蓝，中值滤波器，模板大小3*3
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_49_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%排序波器
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
R=ordfilt2(im(:,:,1),1,true(3));
G=ordfilt2(im(:,:,2),1,true(3));
B=ordfilt2(im(:,:,3),1,true(3));
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit4,'string',time);






% --------------------------------------------------------------------
function Untitled_50_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%自适应滤波-维纳滤波
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
[R,noise1]=wiener2(im(:,:,1));%%红，维纳滤波窗口3*3，返回值noise为噪声的能量
[G,noise2]=wiener2(im(:,:,2));%%绿，维纳滤波窗口3*3，返回值noise为噪声的能量
[B,noise3]=wiener2(im(:,:,3));%%蓝，维纳滤波窗口3*3，返回值noise为噪声的能量
W(:,:,1)=R;
W(:,:,2)=G;
W(:,:,3)=B;
imshow(W);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_63_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_71_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_77_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_82_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_83_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%确定图像中的圆形目标
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I = im;
[a,b,c]=size(I);
for i=1:a
    for j=1:b        
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R>(G.*2)
           I(i,j)=I(i,j);
       else
        I(i,j,1)=255;
        I(i,j,2)=255;
        I(i,j,3)=255;
       end
    end
end
bw1=im2bw(I);
bw2=~bw1;
[L num] = bwlabel(bw2);
for i=1:num
   if numel(find(L==i)) < 1000
       bw2(L==i) =0;
   end
end 
bw3=~bw2;
[L1 num1] = bwlabel(bw3);
for j=1:num1
   if numel(find(L1==j)) <3000
       bw3(L1==j) =0;
   end
end 
[height,width]=size(bw3);
for i=1:height %%循环中进行反色
for j=1:width
    if bw3(i,j)==1
        bw3(i,j)=0;
    else bw3(i,j)=1;
    end 
end
end
[L,num]=bwlabel(bw3,8);
plot_x=zeros(1,num);%%用于记录质心位置的坐标
plot_y=zeros(1,num);
for k=1:num  %%num个区域依次统计质心位置
    sum_x=0;sum_y=0;area=0;
    for i=1:height
    for j=1:width
       if L(i,j)==k
        sum_x=sum_x+i;
        sum_y=sum_y+j;
        area=area+1;   
       end
    end
    end
    plot_x(k)=fix(sum_x/area);
    plot_y(k)=fix(sum_y/area);
end
for i=1:num
    imshow(bw3);
hold on
plot(plot_y(i) ,plot_x(i), '*');
end
 hold off
y=plot_x;
x=plot_y;
str=[ '横坐标：',num2str(x),'纵坐标：' num2str(y)];
helpdlg(str,'识别圆心');
toc
time=toc;
set(handles.edit4,'string',time);




% --------------------------------------------------------------------
function Untitled_84_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Untitled_86_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_87_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%识别车牌
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
tu=im;
tu1=caijian(tu);%将车牌区域分离出来
[y,x]=size(tu1);  
num=round((y*x)/150);  %取车牌区域面积1/150的值
tu2=qiege(tu1);   %将车牌区域切割一下（舍去掉上下左右多余的地方）以便下一步方便
[word1, tu3]=fenli_left(tu2);  %裁剪出左边第一个字符（中文字符）
% subplot(2,2,4);imshow(tu3);
tu4=medfilt2(tu3,[3 3]);     %中值滤波
tu5=bwareaopen(tu4,num,8);   %去掉面积少于1/150车牌区域的不连通区域（过滤掉例如第二位与第三位字符中间的点以及大型杂点）
tu6=medfilt2(tu5,[3 3]);     %再次滤波（可省略）
[word2,word3,word4,word5,word6,word7]=fenli(tu6); %将剩下的车牌区域进行裁剪，输出是剩余六个字符区域
str=shibie_cnn(word1,word2,word3,word4,word5,word6,word7); %将七个裁剪下来的字符区域进行神经网络识别，得出结果
helpdlg(str,'车牌号');
hold off;
toc
time=toc;
set(handles.edit4,'string',time);





% --------------------------------------------------------------------
function Untitled_88_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_78_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%膨胀操作
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',4);%结构元素为圆形，大小为2
bw2=imdilate(BW,se);%膨胀操作
imshow(bw2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_79_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%腐蚀操作
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',2);%结构元素为圆形，大小为2
bw2=imerode(BW,se);%膨胀操作
imshow(bw2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_80_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%开操作
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',2);%结构元素为圆形，大小为2
J=imopen(BW,se);%膨胀操作
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_81_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%闭操作
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',2);%结构元素为圆形，大小为2
J=imclose(BW,se);%膨胀操作
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);



% --------------------------------------------------------------------
function Untitled_64_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_65_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%傅里叶图像变换
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
J=fft2(im);
K=abs(J/256);
imshow(uint8(K))
toc
time=toc;
set(handles.edit4,'string',time);




% --------------------------------------------------------------------
function Untitled_68_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Hough图像变换
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=rgb2gray(im);
I=im2double(I);
BW=edge(I, 'canny');
[H, Theta, Rho]=hough(BW, 'RhoResolution', 0.5, 'ThetaResolution', 0.5);
set(0,'defaultFigurePosition',[100,100,1000,500]);
set(0,'defaultFigureColor',[1 1 1])
imshow(imadjust(mat2gray(H)));
axis normal;
colormap hot;
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_52_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_53_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_54_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_61_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_62_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%分水岭分割
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=im2bw(im);
J=watershed(I,4);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_58_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%全局阈值分割
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
% K=I*0;
[width, height]=size(I);
for i=1:width
    for j=1:height
        if (I(i, j)>50)
            K(i, j)=1;
        else 
            K(i, j)=0;
        end
    end
end
imshow(K);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_59_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Otsu阈值分割
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
T=graythresh(im);
J=im2bw(im,T);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_60_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%迭代式阈值分割
warning off       %取消警告
feature jit off   %加速通道
tic
global im
axes(handles.axes2);
I=im2double(im);
T0=0.01;
T1=(min(I(:))+max(I(:)))/2;
r1=find(I>T1);
r2=find(I<=T1);
T2=(mean(I(r1))+mean(I(r2)))/2;
while abs(T2-T1)<T0
    T1=T2;
    r1=find(I>T1);
    r2=find(I<=T1);
    T2=(mean(I(r1))+mean(I(r2)))/2;
end
J=im2bw(I, T2);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);








% --------------------------------------------------------------------
function Untitled_55_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_56_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%canny算子
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'canny');
imshow(BW2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_57_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Laplacian、Gauss算子
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'log');
imshow(BW2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_89_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Roberts算子
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'roberts');
imshow(BW2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_90_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%prewitt算子
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'prewitt');
imshow(BW2);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_91_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Sobel算子
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'sobel');
imshow(BW2);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_92_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Radon正变换
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('请输入角度：','Radon变换');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
[R,xp]=radon(BW,b);
J=imagesc(b,xp,R);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);

% --------------------------------------------------------------------
function Untitled_93_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Radon反变换
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('请输入角度：','Radon变换');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
[R,xp]=iradon(BW,b);
J=imagesc(b,xp,R);
imshow(J);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_94_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%灰度直方图
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=rgb2gray(im);
imhist(I);
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_95_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%伽玛变换
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
addition=inputdlg('伽玛值：','伽玛值');
addition2=cell2mat(addition);%addition数值为元胞，转化为文字
addition3=str2num(addition2);%addition2数值为文字，转化为数值
b=addition3(1,1);%输入值
R=imadjust(im(:,:,1),[],[],b);
G=imadjust(im(:,:,2),[],[],b);
B=imadjust(im(:,:,3),[],[],b);
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit4,'string',time);
% --------------------------------------------------------------------
function Untitled_85_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%最小外接矩形
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im;
bw=im2bw(I);
I= bwareaopen(bw,30,8);
[labelpic,num]=bwlabel(I,8);
[r c]=find(labelpic==1);
[rectx,recty,area,perimeter]=minboundrect(c,r,'p'); %%'a'是按最小面积算，如果按边长算，用'p'
line(rectx(:),recty(:),'color','b'); 
imshow(I);
hold on;
[r c]=find(labelpic==0);
[rectx,recty,area,perimeter]=minboundrect(c,r,'p');
line(rectx(:),recty(:),'color','r');
hold off;
toc
time=toc;
set(handles.edit4,'string',time);


% --------------------------------------------------------------------
function Untitled_96_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%目标区域计数(以数米粒为例)
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
g=im;
SE=strel('disk',4);  % 形态结构元素
X1=imerode(g,SE);  % 二值图像腐蚀
I=imdilate(X1,SE); % 二值图像膨胀
BG=imopen(I,strel('disk',10));
I2=imsubtract(I,BG);    % 减法运算 从一个图像中减去另一个图像或从图像中减去常量
level=graythresh(I2);   % 灰谷 基于otsu方法的全局图像阈值
bw2=imbinarize(I2,level);  % 基于阈值将图像转换为二值图像
[labeled,numObjects]=bwlabel(bw2,8);
max(max(labeled))
f=bw2;
[L,n]= bwlabel(f);  
[r,c]=find(L==3);   % 然后，利用r和C作为输入的mean函数来计算该对象的质心。
rbar = mean(r);
cbar = mean(c);   
    % 可以使用一个循环来计算和显示图像中全部对象的质心。
    % 为了使质心叠置在图像上时可看到该质心，我们将使用中心为白色“*”符号的黑色圆标记来表示，如下所示：
imshow(f);
hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkeRFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
       end
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % 标注标号
    end
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % 标注*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % 标注标号
    end
    hold off;
toc
time=toc;
set(handles.edit4,'string',time);
str=['目标区域数目：' num2str(n)];
helpdlg(str,'区域计数');


function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
