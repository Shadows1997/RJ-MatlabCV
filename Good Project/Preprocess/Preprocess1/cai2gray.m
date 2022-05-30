function varargout = GUI_TEST(varargin)
% GUI_TEST MATLAB code for GUI_TEST.fig
%      GUI_TEST, by itself, creates a new GUI_TEST or raises the existing
%      singleton*.
%
%      H = GUI_TEST returns the handle to a new GUI_TEST or the handle to
%      the existing singleton*.
%
%      GUI_TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TEST.M with the given input arguments.
%
%      GUI_TEST('Property','Value',...) creates a new GUI_TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_TEST_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_TEST_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_TEST

% Last Modified by GUIDE v2.5 20-Mar-2020 09:03:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_TEST_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_TEST_OutputFcn, ...
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


% --- Executes just before GUI_TEST is made visible.
function GUI_TEST_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_TEST (see VARARGIN)

% Choose default command line output for GUI_TEST
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_TEST wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global label;
label=0;



% --- Outputs from this function are returned to the command line.
function varargout = GUI_TEST_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalPic;

[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},'选择一个图片','F:\test');
str=[pathname filename];

if isequal(filename,0)||isequal(pathname,0)
    warndlg('Please select a picture first!','Warning');
    return;
else
    OriginalPic= imread(str);
    axes(handles.axes1);
    imshow(OriginalPic);
end;





% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalPic;
global GrayPic;
global label;

[rows , cols , colors] = size(OriginalPic); %原图的矩阵参数
GrayPic = zeros(rows , cols);  %用参数创建一个全零矩阵，来存储用灰度图像
GrayPic = uint8(GrayPic);%图像是double型的，将全零矩阵转化为uint8格式
for i = 1:rows  
    for j = 1:cols  
        GrayPic(i , j) = OriginalPic(i , j , 1)*0.3+OriginalPic(i , j , 2)*0.59+OriginalPic(i , j , 3)*0.11; 
        %按照W=0.30,V=0.59,U=0.11进行加权运算，得到最合理的灰度图像
    end  
end  

axes(handles.axes2);
imshow(GrayPic);
label=1;




% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalPic;
global ScalePic;
global label;

ScalePic=imresize(OriginalPic,0.5,'cubic');

axes(handles.axes2);
imshow(ScalePic);
label=2;


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global OriginalPic;
global GrayPic;
global ScalePic;
global label;

[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...
                                 '*.bmp','Bitmap(*.bmp)';...
                                 '*.gif','GIF(*.gif)';...
                                 '*.*',  'All Files (*.*)'},...
                                 'Save Picture','Untitled');
if FileName==0
    return;
else
    if(label==1)
        imwrite(GrayPic,[PathName,FileName]);
    else if(label==2)
        imwrite(ScalePic,[PathName,FileName]);
        else
            imwrite(OriginalPic,[PathName,FileName]);
        end
    end
end






% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
set( gca, 'xtick', [] ); %去掉x轴的刻度 
set( gca, 'ytick', [] ); %去掉y轴的刻度
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
set( gca, 'xtick', [] ); %去掉x轴的刻度 
set( gca, 'ytick', [] ); %去掉y轴的刻度
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If ![在这里插入图片描述](https://img-blog.csdnimg.cn/20200320131256610.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzI5Njg3ODQ3,size_16,color_FFFFFF,t_70)Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

