function varargout = gui_dyn_14_3(varargin)
% GUI_DYN_14_3 M-file for gui_dyn_14_3.fig
%      GUI_DYN_14_3, by itself, creates a new GUI_DYN_14_3 or raises the existing
%      singleton*.
%
%      H = GUI_DYN_14_3 returns the handle to a new GUI_DYN_14_3 or the handle to
%      the existing singleton*.
%
%      GUI_DYN_14_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DYN_14_3.M with the given input arguments.
%
%      GUI_DYN_14_3('Property','Value',...) creates a new GUI_DYN_14_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_dyn_14_3_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_dyn_14_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_dyn_14_3

% Last Modified by GUIDE v2.5 10-Sep-2007 11:08:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_dyn_14_3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_dyn_14_3_OutputFcn, ...
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


% --- Executes just before gui_dyn_14_3 is made visible.
function gui_dyn_14_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_dyn_14_3 (see VARARGIN)

% Choose default command line output for gui_dyn_14_3

set(handles.canshu_edit,'String','[3,0.6,5]')

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_dyn_14_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_dyn_14_3_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in dyn_pushbutton.
function dyn_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to dyn_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%R=2;C=0.5;Uc0=4;%输入元件参数
canshu=str2num(get(handles.canshu_edit,'String'));
R=canshu(1);C=canshu(2);Uc0=canshu(3);
T=R*C;
Usm=10;w=5;Zc=1/(j*w*C);
t=0:0.1:10;
Us=Usm*cos(w*t);%输入激励信号
Ucp=Us*Zc/(R+Zc);%计算稳态分量
Ucp0=Ucp(1);%计算稳态分量的初始值
Uct=[Uc0-Ucp0]*exp(-t/T);%计算暂态分量
Uc=Uct+Ucp;%计算电路的全响应
plot(t,Uc,'og',t,Uct,'+r',t,Ucp,'*b')
grid%绘制稳态分量，暂态分量，全响应的波形图(如图4)
legend('Uc 全响应','Uct暂态分量','Ucp稳态分量')%波形注释



function dyn_menu_Callback(hObject, eventdata, handles)
% hObject    handle to dyn_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dyn_pushbutton_Callback(hObject, eventdata, handles)

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


% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

