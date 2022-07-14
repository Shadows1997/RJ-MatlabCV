function varargout = gui_vdp_14_7(varargin)
% GUI_VDP_14_7 M-file for gui_vdp_14_7.fig
%      GUI_VDP_14_7, by itself, creates a new GUI_VDP_14_7 or raises the existing
%      singleton*.
%
%      H = GUI_VDP_14_7 returns the handle to a new GUI_VDP_14_7 or the handle to
%      the existing singleton*.
%
%      GUI_VDP_14_7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_VDP_14_7.M with the given input arguments.
%
%      GUI_VDP_14_7('Property','Value',...) creates a new GUI_VDP_14_7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_vdp_14_7_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_vdp_14_7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_vdp_14_7

% Last Modified by GUIDE v2.5 11-Sep-2007 20:28:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_vdp_14_7_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_vdp_14_7_OutputFcn, ...
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


% --- Executes just before gui_vdp_14_7 is made visible.
function gui_vdp_14_7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_vdp_14_7 (see VARARGIN)

% Choose default command line output for gui_vdp_14_7

set(handles.y0_edit,'String','[0;0.3]')%确定初始条件
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_vdp_14_7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_vdp_14_7_OutputFcn(hObject, eventdata, handles) 
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


% --- Executes on button press in vdp_pushbutton.
function vdp_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to vdp_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%求解微分方程:
y0=str2num(get(handles.y0_edit,'String'));%确定初始条件
t0=0;tf=60;%确定积分区间
[t,y]=ode45(@vdp,[t0,tf],y0);%求解微分方程
%绘制振荡波形(t,dy/dt)、(t,y)和相轨迹(y,dy/dt);
axes(handles.axes1)
plot(t,y);
xlabel('波行图')
axes(handles.axes2)
plot(y(:,2),y(:,1));
xlabel('相轨迹')

function ydot=vdp(t,y)
ydot(1)=0.06*(1-y(2)^2)*y(1)-y(2);%mu的值可以任意变化,此处取0.1
ydot(2)=y(1);
ydot=ydot';

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function vdp_menu_Callback(hObject, eventdata, handles)
% hObject    handle to vdp_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vdp_pushbutton_Callback(hObject, eventdata, handles)

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


