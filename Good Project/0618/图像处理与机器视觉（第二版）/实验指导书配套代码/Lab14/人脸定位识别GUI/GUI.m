function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


% 显示figure标记
flag = 1;
% 获取图片库文件列表
    Img =getimage(handles.axes1);
    % 图像预处理
    [Im1, rectValide] = GetValideImage(Img, 0);%自定义的函数
    % 人脸区域定位
    [hsv,erzhi,bw1,BW2] = GetFaceAreaImg(Im1, 0);
        axes(handles.axes2); imshow(hsv, []); title('hsv空间图像');
          axes(handles.axes3); imshow(erzhi, []); title('二值化图像');
        axes(handles.axes4); imshow(bw1); title('形态学处理图像');
         axes(handles.axes5); imshow(BW2, []); title('人脸筛选区域图像');
         
         %人脸标记
         bwimage = BW2;
         [L,nm] = bwlabel(bwimage,8);%找出图像中的八连通区域，视为字符所在区域
axes(handles.axes6);%%使用图像，操作在坐标6
imshow( Img);%在坐标axes6显示
title('定位');
for i =1:nm
%     stats = regionprops(L);
%     Ar = cat(1, stats.Area);
%     ind = find(Ar ==max(Ar));%找到最大连通区域的标号
    [r,c] = find(L ==i);
    left= min(c);%左边界
    right= max(c);%右边界
    top= min(r);%上边界
    buttom= max(r);%下边界
    width=right - left + 1;%宽度
    height = buttom - top + 1;%高度
    rectangle('Position',[left,top,width,height],'EdgeColor','r');%对连通域进行标记
    cropimage = imcrop(Img,[left,top,width,height]);%图像裁剪
    cropgray =rgb2gray(cropimage);
    cropgray = imresize(cropgray,[110,90])
    imwrite(cropgray,'人脸分割.bmp');
    pause(0.01);
end
       
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%打开图像程序
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'选择图像');
if isequal(filename,0)||isequal(pathname,0)
  errordlg('请选择图片','提示');%如果没有输入，则创建错误对话框 
  return;
else
    global im;
    im=[pathname,filename];%合成路径+文件名
    image=imread(im);%读取图像
    global m n k;
    [m n k]=size(image);
    set(handles.axes1,'HandleVisibility','ON');%打开坐标，方便操作
    axes(handles.axes1);%%使用图像，操作在坐标1
    imshow(image);%在坐标axes1显示原图像 
    title('原始图像');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%提取PCA特征部分
global reference;%全局变量
global base;
global imgmean;
imgdata=[];%训练图像矩阵
for i=1:5
  for j=1:5
    a=imread(strcat('.\train\s',num2str(i),'\',num2str(j),'.bmp'));
%     name = strcat('.train\0',num2str(i),'-',num2str(j),'m.jpg');
%     b=a(1:112*92); % b是行矢量 1×N，其中N＝10304
    b=a(1:110*90); % b是行矢量 1×N，其中N＝10304
    b=double(b);
    imgdata=[imgdata; b]; % imgdata 是一个M * N 矩阵，imgdata中每一行数据一张图片，M＝200
  end;
end;
imgdata=imgdata'; %每一列为一张图片
imgmean=mean(imgdata,2); % 平均图片，N维列向量
for i=1:25
  minus(:,i) = imgdata(:,i)-imgmean; % minus是一个N*M矩阵，是训练图和平均图之间的差值
end;

covx=minus'* minus; % M * M 阶协方差矩阵
[COEFF, latent,explained] = pcacov(covx'); %PCA，用协方差矩阵的转置来计算以减小计算量

%选择构成95%的能量的特征值
i=1;
proportion=0;
while(proportion < 95)
  proportion=proportion+explained(i);
  i=i+1;
end;
p=i-1;

% 训练得到特征脸坐标系
i=1;
while (i<=p && latent(i)>0)
  base(:,i) = latent(i)^(-1/2)*minus * COEFF(:,i); % base是N×p阶矩阵，用来进行投影，除以latent(i)^(1/2)是对人脸图像的标准化
  i = i + 1;
end

% 将训练样本对坐标系上进行投影,得到一个 p*M 阶矩阵为参考
reference = base'*minus;
msgbox('特征提取完成');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%人脸识别程序，最小距离法
global reference;
global base;
global imgmean;
a=imread('人脸分割.bmp');
b=a(1:9900);
b=double(b);
b=b';

object = base'*(b-imgmean);
distance=100000;

%最小距离法，寻找和待识别图片最为接近的训练图片
for k=1:25
    temp= norm(object - reference(:,k));
    if (distance > temp)
        which = k;
        distance = temp;
    end;
end;
temp1 = which/5;
temp1 = ceil(temp1);
switch temp1
    case 1
        set(handles.edit3,'string','黄晓明');
          case 2
        set(handles.edit3,'string','杨幂');
         case 3
        set(handles.edit3,'string','沈腾');
              case 4
        set(handles.edit3,'string','迪丽热巴');
              case 5
        set(handles.edit3,'string','刘德华');
end



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
