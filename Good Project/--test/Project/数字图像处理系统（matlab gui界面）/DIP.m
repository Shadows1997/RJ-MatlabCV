function varargout = DIP(varargin)
% DIP MATLAB code for DIP.fig
%      DIP, by itself, creates a new DIP or raises the existing
%      singleton*.
%
%      H = DIP returns the handle to a new DIP or the handle to
%      the existing singleton*.
%
%      DIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP.M with the given input arguments.
%
%      DIP('Property','Value',...) creates a new DIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIP

% Last Modified by GUIDE v2.5 10-Jul-2020 13:47:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIP_OpeningFcn, ...
                   'gui_OutputFcn',  @DIP_OutputFcn, ...
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


% --- Executes just before DIP is made visible.
function DIP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIP (see VARARGIN)

% Choose default command line output for DIP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIP_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles) %open回调
global I sz
try
[fileName, pathName] = uigetfile({'*.bmp';'*jpg';'*.tif';'*.png'});%获取需读取图片的路径
I = imread([pathName fileName]);   %读取图片
sz = length(size(I));                      
handles.ori_img = I;
axes(handles.axes1);
imshow(handles.ori_img,'InitialMagnification','fit'),title('原图');
handles.output=hObject;
guidata(hObject,handles);
catch
    errordlg('something wrong!!','Error');
end



function pushbutton2_Callback(hObject, eventdata, handles)  %save回调
[f,p]=uiputfile({'.jpg'},'保存图片');
str=strcat(p,f);
pic=getframe(handles.axes2);    %获取目前axes2处的图像
imwrite(pic.cdata,str,'jpg');

function pushbutton3_Callback(hObject, eventdata, handles)  %图像缩放功能回调
global chazhifangfa suofangbeishu I sz
axes(handles.axes2);%显示在第二张图上
if sz == 2
    if chazhifangfa==1
        X=imresize(I,suofangbeishu,'nearest');
        imshow(X,[],'InitialMagnification','fit');title(['最近邻插值法将图像缩放',num2str(suofangbeishu),'倍'])
    elseif chazhifangfa==2
        X=imresize(I,suofangbeishu,'bilinear');
        imshow(X,[],'InitialMagnification','fit');title(['双线性插值法实现图像缩放',num2str(suofangbeishu),'倍'])
    else
        X=imresize(I,suofangbeishu,'bicubic');
        imshow(X,[],'InitialMagnification','fit');title(['双立方插值法实现图像缩放',num2str(suofangbeishu),'倍'])
    end
else
    if chazhifangfa==1
        X1=imresize(I(:,:,1),suofangbeishu,'nearest');
        X2=imresize(I(:,:,2),suofangbeishu,'nearest');
        X3=imresize(I(:,:,3),suofangbeishu,'nearest');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['最近邻插值法将图像缩放',num2str(suofangbeishu),'倍'])
    elseif chazhifangfa==2
        X1=imresize(I(:,:,1),suofangbeishu,'bilinear');
        X2=imresize(I(:,:,2),suofangbeishu,'bilinear');
        X3=imresize(I(:,:,3),suofangbeishu,'bilinear');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['双线性插值法实现图像缩放',num2str(suofangbeishu),'倍'])
    else
        X1=imresize(I(:,:,1),suofangbeishu,'bicubic');
        X2=imresize(I(:,:,2),suofangbeishu,'bicubic');
        X3=imresize(I(:,:,3),suofangbeishu,'bicubic');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['双立方插值法实现图像缩放',num2str(suofangbeishu),'倍'])
    end
end

function edit1_Callback(hObject, eventdata, handles)    %获取缩放倍数的回调
global suofangbeishu
suofangbeishu = str2double(get(handles.edit1,'string'));    %获取缩放倍数

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% 选择缩放使用的插值算法
% 1.选择最近邻插值法
function checkbox1_Callback(hObject, eventdata, handles)
global chazhifangfa;
if(get(hObject,'Value'))
   chazhifangfa=1;
end

% 2.选择双线性插值法
function checkbox2_Callback(hObject, eventdata, handles)
global chazhifangfa
if(get(hObject,'Value'))
    chazhifangfa=2;
end

% 1.选择双立方插值法
function checkbox3_Callback(hObject, eventdata, handles)
global chazhifangfa
if(get(hObject,'Value'))
    chazhifangfa=3;
end

function pushbutton4_Callback(hObject, eventdata, handles)  %旋转回调
global I
global xuanzhuanjiaodu
axes(handles.axes2);
J=imrotate(I,xuanzhuanjiaodu, 'bilinear');
imshow(J,'InitialMagnification','fit');title(['逆时针旋转',num2str(xuanzhuanjiaodu),'度图像'])

function edit3_Callback(hObject, eventdata, handles)    

%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global xuanzhuanjiaodu
xuanzhuanjiaodu = str2double(get(handles.edit3,'string'));  %获取旋转角度

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)  
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)   %裁剪回调
global I
msgbox('请选择要裁剪的区域，并双击选定区域以显示','提示信息');
waitforbuttonpress;
clf;
I2=imcrop(I);
close
axes(handles.axes2)
imshow(I2,'InitialMagnification','fit'),title('裁剪后的图像')


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)  %图像像素反转回调
global I sz
if sz == 3
    errordlg('彩色图无法线性反转','Error');
else
    img=double(I);
    img=-img+255;   %图像反转线性变换
    H=uint8(img);
    axes(handles.axes2)
    imshow(H,'InitialMagnification','fit'),title('灰度反转线性变换')
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)  %直方图均衡回调
global I sz
if sz == 2
    equa=histeq(I); %直方图均衡
    figure,
    subplot(121),imhist(I),title('直方图均衡前')
    subplot(122),imhist(equa),title('直方图均衡后')
    axes(handles.axes2)
    imshow(equa,'InitialMagnification','fit'),title('直方图均衡后图')
else
    equa1 = histeq(I(:,:,1));
    equa2 = histeq(I(:,:,2));
    equa3 = histeq(I(:,:,3));
    figure,
    subplot(231),imhist(I(:,:,1)),title('R分量直方图均衡前');
    subplot(232),imhist(I(:,:,2)),title('G分量直方图均衡前');
    subplot(233),imhist(I(:,:,3)),title('B分量直方图均衡前');
    subplot(234),imhist(equa1),title('R分量直方图均衡前');
    subplot(235),imhist(equa2),title('G分量直方图均衡前');
    subplot(236),imhist(equa3),title('B分量直方图均衡前');
    axes(handles.axes2)
    imshow(cat(3,equa1,equa2,equa3),'InitialMagnification','fit'),title('直方图均衡后图')
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)      %二值化回调
global I erzhihuayuzhi sz
if sz == 2
    bw=imbinarize(I,erzhihuayuzhi);
    axes(handles.axes2)
    imshow(uint8(255*bw),[],'InitialMagnification','fit'),title(['以',num2str(erzhihuayuzhi),'为阈值分割的二值图'])
else
    i = rgb2gray(I);
    bw=imbinarize(i,erzhihuayuzhi);
    axes(handles.axes2)
    imshow(uint8(255*bw,'InitialMagnification','fit'),[]),title(['转化为灰度图后以',num2str(erzhihuayuzhi),'为阈值分割的二值图'])
end

function edit4_Callback(hObject, eventdata, handles)    

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global erzhihuayuzhi;
erzhihuayuzhi=str2double(get(handles.edit4,'string'));  %二值化阈值获取

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global filterType I sz D0 D1
[m,n,~]=size(I);
Dcut=100;
% disp(D0)
% if D0 == ' '
%     D0=150;
% if D1 == ' '
%     D1=250;
% end
% end
D0_use = str2double(D0);
D1_use = str2double(D1);
disp(D0_use)
disp(D1_use)
%生成三种低通滤波器
for u=1:m
    for v=1:n
        D(u,v)=sqrt(u^2+v^2);
        BUTTER_LOW(u,v)=1/(1+(sqrt(2)-1)*(D(u,v)/Dcut)^2);  %巴特沃斯低通滤波器
        EXPOT_LOW(u,v)=exp(log(1/sqrt(2))*(D(u,v)/Dcut)^2); %指数低通滤波器
        if D(u,v)<D0_use
            TRAPE_LOW(u,v)=1;                               %梯形低通滤波器
        else if D(u,v)<=D1_use
                TRAPE_LOW(u,v)=(D(u,v)-D1_use)/(D0_use-D1_use);
            else TRAPE_LOW(u,v)=0;
            end
        end
    end
end
%生成三种高通滤波器
for u=1:m
    for v=1:n
        D(u,v)=sqrt(u^2+v^2);
        BUTTER_HIGH(u,v)=1/(1+(sqrt(2)-1)*(Dcut/D(u,v))^2);     %巴特沃斯高通滤波器
        EXPOTH_HIGH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);   %指数高通滤波器
        if D(u,v)<D1_use
            THPF_HIGH(u,v)=0;                                   %梯形高通滤波器
        else if D(u,v)<=D0_use
                THPF_HIGH(u,v)=(D(u,v)-D1_use)/(D0_use-D1_use);
            else THPF_HIGH(u,v)=1;
            end
        end
    end
end
if sz == 2
    F=fft2(I);  %fft变换
    fftshift(F);
    axes(handles.axes2)
    switch filterType
        case 1
            BUTTERG_LOW=BUTTER_LOW.*F;  %通过滤波器
            BUTTERfiltered_LOW=ifft2(BUTTERG_LOW);
            figure,plot(BUTTER_LOW),title('巴特沃斯低通滤波器');
            axes(handles.axes2)
            imshow(BUTTERfiltered_LOW,[],'InitialMagnification','fit'),title('经过巴特沃斯低通滤波器后的图像');
        case 2
            EXPOTG_LOW=EXPOT_LOW.*F;
            EXPOTfiltered_LOW=ifft2(EXPOTG_LOW);
            figure,plot(EXPOT_LOW),title('指数低通滤波器');
            axes(handles.axes2)
            imshow(EXPOTfiltered_LOW,[],'InitialMagnification','fit'),title('经过指数低通滤波器后的图像');
        case 3
            TRAPEG_LOW=TRAPE_LOW.*F;
            TRAPEfiltered_LOW=ifft2(TRAPEG_LOW);
            figure,plot(TRAPE_LOW),title('梯形低通滤波器');
            axes(handles.axes2)
            imshow(TRAPEfiltered_LOW,[],'InitialMagnification','fit'),title('经过梯形低通滤波器后的图像');
        case 4    
            BUTTERG_HIGH=BUTTER_HIGH.*F;
            BUTTERfiltered_HIGH=ifft2(BUTTERG_HIGH);
            figure,plot(BUTTER_HIGH),title('巴特沃斯高通滤波器');
            axes(handles.axes2)
            imshow(BUTTERfiltered_HIGH,[],'InitialMagnification','fit'),title('经过巴特沃斯高通滤波器后的图像');
        case 5 
            EXPOTG_HIGH=EXPOTH_HIGH.*F;
            EXPOTfiltered_HIGH=ifft2(EXPOTG_HIGH);
            figure,plot(EXPOT_HIGH),title('指数高通滤波器');
            axes(handles.axes2)
            imshow(EXPOTfiltered_HIGH,[],'InitialMagnification','fit'),title('经过指数高通滤波器后的图像');
        case 6
            TRAPEG_HIGH=TRAPE_HIGH.*F;
            TRAPEfiltered_HIGH=ifft2(TRAPEG_HIGH);
            figure,plot(TRAPE_HIGH),title('梯形高通滤波器');
            axes(handles.axes2)
            imshow(TRAPEfiltered_HIGH,[],'InitialMagnification','fit'),title('经过梯形高通滤波器后的图像');
    end
else
    F1=fft2(I(:,:,1));
    F2=fft2(I(:,:,2));
    F3=fft2(I(:,:,3));
    fftshift(F1);
    fftshift(F2);
    fftshift(F3);
    axes(handles.axes2)
    switch filterType
        case 1
            BUTTERG_LOW1=BUTTER_LOW.*F1;
            BUTTERfiltered_LOW1=ifft2(BUTTERG_LOW1);
            BUTTERG_LOW2=BUTTER_LOW.*F2;
            BUTTERfiltered_LOW2=ifft2(BUTTERG_LOW2);
            BUTTERG_LOW3=BUTTER_LOW.*F3;
            BUTTERfiltered_LOW3=ifft2(BUTTERG_LOW3);        %rgb三分量都经过滤波器
            figure,plot(BUTTER_LOW),title('巴特沃斯低通滤波器');
            figure
            subplot(221),imshow(BUTTERfiltered_LOW1,[]),title('R分量')
            subplot(222),imshow(BUTTERfiltered_LOW2,[]),title('G分量')
            subplot(223),imshow(BUTTERfiltered_LOW3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,BUTTERfiltered_LOW1,BUTTERfiltered_LOW2,BUTTERfiltered_LOW3);    %rgb分量合成为彩色图
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过巴特沃斯低通滤波器后的图像');
        case 2
            EXPOTG_LOW1=EXPOT_LOW.*F1;
            EXPOTfiltered_LOW1=ifft2(EXPOTG_LOW1);
            EXPOTG_LOW2=EXPOT_LOW.*F2;
            EXPOTfiltered_LOW2=ifft2(EXPOTG_LOW2);
            EXPOTG_LOW3=EXPOT_LOW.*F3;
            EXPOTfiltered_LOW3=ifft2(EXPOTG_LOW3);
            figure,plot(EXPOT_LOW),title('指数低通滤波器');
            figure
            subplot(221),imshow(EXPOTfiltered_LOW1,[]),title('R分量')
            subplot(222),imshow(EXPOTfiltered_LOW2,[]),title('G分量')
            subplot(223),imshow(EXPOTfiltered_LOW3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,EXPOTfiltered_LOW1,EXPOTfiltered_LOW2,EXPOTfiltered_LOW3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过指数低通滤波器后的图像');
        case 3
            TRAPEG_LOW1=TRAPE_LOW.*F1;
            TRAPEfiltered_LOW1=ifft2(TRAPEG_LOW1);
            TRAPEG_LOW2=TRAPE_LOW.*F2;
            TRAPEfiltered_LOW2=ifft2(TRAPEG_LOW2);
            TRAPEG_LOW3=TRAPE_LOW.*F3;
            TRAPEfiltered_LOW3=ifft2(TRAPEG_LOW3);
            figure,plot(TRAPE_LOW),title('梯形低通滤波器');
            figure
            subplot(221),imshow(TRAPEfiltered_LOW1,[]),title('R分量')
            subplot(222),imshow(TRAPEfiltered_LOW2,[]),title('G分量')
            subplot(223),imshow(TRAPEfiltered_LOW3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,TRAPEfiltered_LOW1,TRAPEfiltered_LOW2,TRAPEfiltered_LOW3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过梯形低通滤波器后的图像');
        case 4    
            BUTTERG_HIGH1=BUTTER_HIGH.*F1;
            BUTTERfiltered_HIGH1=ifft2(BUTTERG_HIGH1);
            BUTTERG_HIGH2=BUTTER_HIGH.*F2;
            BUTTERfiltered_HIGH2=ifft2(BUTTERG_HIGH2);
            BUTTERG_HIGH3=BUTTER_HIGH.*F3;
            BUTTERfiltered_HIGH3=ifft2(BUTTERG_HIGH3);
            figure,plot(BUTTER_HIGH),title('巴特沃斯高通滤波器');
            figure
            subplot(221),imshow(BUTTERfiltered_HIGH1,[]),title('R分量')
            subplot(222),imshow(BUTTERfiltered_HIGH2,[]),title('G分量')
            subplot(223),imshow(BUTTERfiltered_HIGH3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,BUTTERfiltered_HIGH1,BUTTERfiltered_HIGH2,BUTTERfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过巴特沃斯高通滤波器后的图像');
        case 5 
            EXPOTG_HIGH1=EXPOTH_HIGH.*F1;
            EXPOTfiltered_HIGH1=ifft2(EXPOTG_HIGH1);
            EXPOTG_HIGH2=EXPOTH_HIGH.*F2;
            EXPOTfiltered_HIGH2=ifft2(EXPOTG_HIGH2);
            EXPOTG_HIGH3=EXPOTH_HIGH.*F3;
            EXPOTfiltered_HIGH3=ifft2(EXPOTG_HIGH3);
            figure,plot(EXPOT_HIGH),title('指数高通滤波器');
            figure
            subplot(221),imshow(EXPOTfiltered_HIGH1,[]),title('R分量')
            subplot(222),imshow(EXPOTfiltered_HIGH2,[]),title('G分量')
            subplot(223),imshow(EXPOTfiltered_HIGH3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,EXPOTfiltered_HIGH1,EXPOTfiltered_HIGH2,EXPOTfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过指数高通滤波器后的图像');
        case 6
            TRAPEG_HIGH1=THPF_HIGH.*F1;
            TRAPEfiltered_HIGH1=ifft2(TRAPEG_HIGH1);
            TRAPEG_HIGH2=THPF_HIGH.*F2;
            TRAPEfiltered_HIGH2=ifft2(TRAPEG_HIGH2);
            TRAPEG_HIGH3=THPF_HIGH.*F3;
            TRAPEfiltered_HIGH3=ifft2(TRAPEG_HIGH3);
            figure,plot(THPF_HIGH),title('梯形高通滤波器');
            figure
            subplot(221),imshow(TRAPEfiltered_HIGH1,[]),title('R分量')
            subplot(222),imshow(TRAPEfiltered_HIGH2,[]),title('G分量')
            subplot(223),imshow(TRAPEfiltered_HIGH3,[]),title('B分量')
            axes(handles.axes2)
            ca = cat(3,TRAPEfiltered_HIGH1,TRAPEfiltered_HIGH2,TRAPEfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('经过梯形高通滤波器后的图像');
    end
end

function edit5_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global D0
D0 = get(handles.edit5,'string');   %获取滤波器参数

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global D1
D1 = get(handles.edit6,'string');    %获取滤波器参数

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% 选择滤波器种类
% 1.选择巴特沃斯低通滤波
function radiobutton1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global filterType       
if(get(hObject,'value'))
    filterType=1;
end

% 2.选择指数低通滤波器
function radiobutton3_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global filterType
if(get(hObject,'value'))
    filterType=2;
end

% 3.选择梯形低通滤波器
function radiobutton4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global filterType
if(get(hObject,'value'))
    filterType=3;
end

% 4.选择巴特沃斯高通滤波
function radiobutton5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global filterType
if(get(hObject,'value'))
    filterType=4;
end

% 5.选择指数高通滤波器
function radiobutton6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton6
global filterType
if(get(hObject,'value'))
    filterType=5;
end

% 6.选择梯形高通滤波器
function radiobutton7_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton7
global filterType
if(get(hObject,'value'))
    filterType=6;
end

%% 添加噪声
function pushbutton11_Callback(hObject, eventdata, handles) %加噪声回调
global I
global choose_gau
global choose_salt
global choose_spe
global choose_rom
str='图片中添加了:';
str1='高斯噪声';
str2='椒盐噪声';
str3='乘性噪声';
str4='随机噪声';
img=I;
if choose_gau==1
    img=imnoise(img,'gaussian',0,0.02);     %加入高斯噪声
    str=strcat([str,' ',str1]);
end
if choose_salt==1
    img=imnoise(img,'salt & pepper', 0.02); %加入椒盐噪声
    str=strcat([str,' ',str2]);
end
if choose_spe==1
    img=imnoise(img,'speckle',0.06);        %加入乘性噪声
    str=strcat([str,' ',str3]);
end
if choose_rom==1
    noise_rom=0.1*randn(size(img));         %生成随机矩阵
    img=imadd(img,im2uint8(noise_rom));     %加随机噪声
    str=strcat([str,' ',str4]);
end

axes(handles.axes2)
imshow(img,'InitialMagnification','fit'),title(str)

%% 选择加入噪声种类
% 1.选择高斯噪声
function checkbox4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox4
global choose_gau
if(get(hObject,'Value'))
    choose_gau=1;
else
    choose_gau=0;
end

% 2.选择椒盐噪声
function checkbox5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox5
global choose_salt
if(get(hObject,'Value'))
    choose_salt=1;
else
    choose_salt=0;
end

% 3.选择乘性噪声
function checkbox6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox6
global choose_spe
if(get(hObject,'Value'))
    choose_spe=1;
else
    choose_spe=0;
end

% 4.选择随机噪声
function checkbox7_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox7
global choose_rom
if(get(hObject,'Value'))
    choose_rom=1;
else
    choose_rom=0;
end



function pushbutton13_Callback(hObject, eventdata, handles)
global I sz

if sz == 3
    img = gamma_light(I);   %利用gamma方式光照不均处理算法
    axes(handles.axes2)
    imshow(img,'InitialMagnification','fit'),title('采用gamma方法去除不均匀光照')
else
    img = light_use(I);     %使用滤波法去除背景处理光照不均
    axes(handles.axes2)
    imshow(img,'InitialMagnification','fit'),title('滤波去背景去除不均匀光照')
end

function pushbutton14_Callback(hObject, eventdata, handles)
set(findobj('style','edit'),'string','')    %重置参数