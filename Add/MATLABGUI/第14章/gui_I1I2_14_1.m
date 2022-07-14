function varargout = gui_I1I2_14_1(varargin)
% GUI_I1I2_14_1 M-file for gui_I1I2_14_1.fig
%      GUI_I1I2_14_1, by itself, creates a new GUI_I1I2_14_1 or raises the existing
%      singleton*.
%
%      H = GUI_I1I2_14_1 returns the handle to a new GUI_I1I2_14_1 or the handle to
%      the existing singleton*.
%
%      GUI_I1I2_14_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_I1I2_14_1.M with the given input arguments.
%
%      GUI_I1I2_14_1('Property','Value',...) creates a new GUI_I1I2_14_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_I1I2_14_1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_I1I2_14_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_I1I2_14_1

% Last Modified by GUIDE v2.5 09-Sep-2007 19:34:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_I1I2_14_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_I1I2_14_1_OutputFcn, ...
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


% --- Executes just before gui_I1I2_14_1 is made visible.
function gui_I1I2_14_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_I1I2_14_1 (see VARARGIN)

% Choose default command line output for gui_I1I2_14_1
I=imread('pic_gui_I1I2.bmp','bmp');
image(I)
axis off;
set(handles.canshu_edit,'String','[4,2,7,3,1,0.5,4]');
%R1=R2=R3=4Ω，R4=2Ω，IS =2A，α=0.5，β=4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_I1I2_14_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_I1I2_14_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function canshu_edit_Callback(hObject, eventdata, handles)
% hObject    handle to canshu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of canshu_edit as text
%        str2double(get(hObject,'String')) returns contents of canshu_edit as a double


% --- Executes during object creation, after setting all properties.
function canshu_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canshu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in I1I2_pushbutton.
function I1I2_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to I1I2_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%format compact
canshu=str2num(get(handles.canshu_edit,'String'));
%输入元件参数值
%R1=4;R2=4;R3=4;R4=2;
%Is=2;alpha=0.5;beta=4;
R1=canshu(1);R2=canshu(2);R3=canshu(3);R4=canshu(4);
Is=canshu(5);alpha=canshu(6);beta=canshu(7);
%按Z×X=Y列写电路的矩阵方程,其中：
%X=[U1;U2;I1;I2]
z11=1/R1+1/R2;z12=-1/R2;z13=0;z14=-alpha;
z21=-1/R2;z22=1/R2+1/R3+1/R4;z23=-beta/R3;z24=alpha;
z31=1/R2;z32=-1/R2;z33=-1;z34=0;
z41=0;z42=1/R4;z43=0;z44=-1;
%以上设置系数矩阵X的元素
Z=[z11,z12,z13,z14;z21,z22,z23,z24;z31,z32,z33,z34;
z41,z42,z43,z44];
Y=[Is;0;0;0];
X=Z\Y; %求解结果
I1=X(3);I2=X(4);
set(handles.I1_text,'String',I1)
set(handles.I2_text,'String',I2)
%I1,I2%输出结果

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function I1I2_menu_Callback(hObject, eventdata, handles)
% hObject    handle to I1I2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I1I2_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


