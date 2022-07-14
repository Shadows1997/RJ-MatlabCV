function varargout = gui_ode_12_10(varargin)
% GUI_ODE_12_10 M-file for gui_ode_12_10.fig
%      GUI_ODE_12_10, by itself, creates a new GUI_ODE_12_10 or raises the existing
%      singleton*.
%
%      H = GUI_ODE_12_10 returns the handle to a new GUI_ODE_12_10 or the handle to
%      the existing singleton*.
%
%      GUI_ODE_12_10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_ODE_12_10.M with the given input arguments.
%
%      GUI_ODE_12_10('Property','Value',...) creates a new GUI_ODE_12_10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_ode_12_10_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_ode_12_10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_ode_12_10

% Last Modified by GUIDE v2.5 06-Sep-2007 17:22:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_ode_12_10_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_ode_12_10_OutputFcn, ...
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


% --- Executes just before gui_ode_12_10 is made visible.
function gui_ode_12_10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_ode_12_10 (see VARARGIN)
set(handles.t0_edit,'String',0);
set(handles.tf_edit,'String', 9.4248)  ;%3*pi
set(handles.x0t_edit,'String','[0,0]');
% Choose default command line output for gui_ode_12_10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_ode_12_10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_ode_12_10_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ode_pushbutton.
function ode_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to ode_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%t0=0;tf=3*pi;x0t=[0;0];
t0=str2num(get(handles.t0_edit,'String'));
tf=str2num(get(handles.tf_edit,'String'));
x0t=str2num(get(handles.x0t_edit,'String'));
[t,x]=ode23('fun_12_10',[t0,tf],x0t);
[t45,x45]=ode45('fun_12_10',[t0,tf],x0t);
y=x(:,1);y45=x45(:,1);
for i=1:length(t)
    y2(i)=(1+2/(pi^2))*(1-cos(t(i)))-t(i)^2/(pi^2);
end
u=1-(t.^2)/(pi^2);
plot(t,y,'-',t45,y45,'*',t,y2,'o',t,u,'+')
legend('ode23求解','ode45求解','解析解','输入量',3)
t
t45
% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


function t0_edit_Callback(hObject, eventdata, handles)
% hObject    handle to t0_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t0_edit as text
%        str2double(get(hObject,'String')) returns contents of t0_edit as a double


% --- Executes during object creation, after setting all properties.
function t0_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t0_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tf_edit_Callback(hObject, eventdata, handles)
% hObject    handle to tf_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tf_edit as text
%        str2double(get(hObject,'String')) returns contents of tf_edit as a double


% --- Executes during object creation, after setting all properties.
function tf_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tf_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x0t_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x0t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x0t_edit as text
%        str2double(get(hObject,'String')) returns contents of x0t_edit as a double


% --- Executes during object creation, after setting all properties.
function x0t_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x0t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function ode_menu_Callback(hObject, eventdata, handles)
% hObject    handle to ode_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

ode_pushbutton_Callback(hObject, eventdata, handles)
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


