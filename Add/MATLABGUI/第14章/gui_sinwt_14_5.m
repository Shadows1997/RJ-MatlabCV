function varargout = gui_sinwt_14_5(varargin)
% GUI_SINWT_14_5 M-file for gui_sinwt_14_5.fig
%      GUI_SINWT_14_5, by itself, creates a new GUI_SINWT_14_5 or raises the existing
%      singleton*.
%
%      H = GUI_SINWT_14_5 returns the handle to a new GUI_SINWT_14_5 or the handle to
%      the existing singleton*.
%
%      GUI_SINWT_14_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SINWT_14_5.M with the given input arguments.
%
%      GUI_SINWT_14_5('Property','Value',...) creates a new GUI_SINWT_14_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_sinwt_14_5_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_sinwt_14_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_sinwt_14_5

% Last Modified by GUIDE v2.5 11-Sep-2007 11:39:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_sinwt_14_5_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_sinwt_14_5_OutputFcn, ...
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


% --- Executes just before gui_sinwt_14_5 is made visible.
function gui_sinwt_14_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_sinwt_14_5 (see VARARGIN)

% Choose default command line output for gui_sinwt_14_5

%L1=3.6;L2=0.08;M=0.475;
%R1=25;R2=0.06;RL=42;
%w=10*pi;Us=120;
set(handles.canshu_edit,'String','[3.6,0.08,0.475,25,0.06,42]')
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_sinwt_14_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_sinwt_14_5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sinwt_pushbutton.
function sinwt_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sinwt_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%L1=3.6;L2=0.08;M=0.475;
%R1=25;R2=0.06;RL=42;
%w=10*pi;Us=120;

canshu=str2num(get(handles.canshu_edit,'String'));
L1=canshu(1);L2=canshu(2);M=canshu(3);
R1=canshu(4);R2=canshu(5);RL=canshu(6);

w=10*pi;Us=120;
%按Z*X=Y列写电路的矩阵方程,其中
%X=[I1;I2]
z11=R1+j*w*L1;z12=j*w*M;
z21=j*w*M;z22=R2+j*w*L2+RL;
%以上设置系数矩阵X的元素
Z=[z11,z12;z21,z22];Y=[Us;0];
X=Z\Y;%求解结果
I1=X(1),I2=X(2),
%I1,I2,%输出结果
r1=abs(I1),angle1=[angle(I1)*180]/pi
r2=abs(I2),angle2=[angle(I2)*180]/pi
set(handles.I1_text,'String',strcat('I1=',num2str(I1),'  r1=',num2str(r1),'  angle1=',num2str(angle1)))
set(handles.I2_text,'String',strcat('I2=',num2str(I2),'  r2=',num2str(r2),'  angle2=',num2str(angle2)))
hi=compass([I1,I2]);
set(hi,'linewidth',2)
xlabel('电流向量图')

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


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




% --------------------------------------------------------------------
function sinwt_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sinwt_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sinwt_pushbutton_Callback(hObject, eventdata, handles)
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


