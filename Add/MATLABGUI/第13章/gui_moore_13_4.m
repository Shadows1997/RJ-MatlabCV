function varargout = gui_moore_13_4(varargin)
% GUI_MOORE_13_4 M-file for gui_moore_13_4.fig
%      GUI_MOORE_13_4, by itself, creates a new GUI_MOORE_13_4 or raises the existing
%      singleton*.
%
%      H = GUI_MOORE_13_4 returns the handle to a new GUI_MOORE_13_4 or the handle to
%      the existing singleton*.
%
%      GUI_MOORE_13_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MOORE_13_4.M with the given input arguments.
%
%      GUI_MOORE_13_4('Property','Value',...) creates a new GUI_MOORE_13_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_moore_13_4_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_moore_13_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_moore_13_4

% Last Modified by GUIDE v2.5 07-Sep-2007 18:01:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_moore_13_4_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_moore_13_4_OutputFcn, ...
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


% --- Executes just before gui_moore_13_4 is made visible.
function gui_moore_13_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_moore_13_4 (see VARARGIN)

% Choose default command line output for gui_moore_13_4

set(handles.sx_edit,'String', 30);
set(handles.sy_edit,'String', 0); 
set(handles.txy_edit,'String', 8);
set(handles.rad_edit,'String', 1.0472);     %pi/3
handles.output = hObject;

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_moore_13_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_moore_13_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txy_edit_Callback(hObject, eventdata, handles)
% hObject    handle to txy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txy_edit as text
%        str2double(get(hObject,'String')) returns contents of txy_edit as a double


% --- Executes during object creation, after setting all properties.
function txy_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sy_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sy_edit as text
%        str2double(get(hObject,'String')) returns contents of sy_edit as a double


% --- Executes during object creation, after setting all properties.
function sy_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sy_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to sx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sx_edit as text
%        str2double(get(hObject,'String')) returns contents of sx_edit as a double


% --- Executes during object creation, after setting all properties.
function sx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in moore_pushbutton.
function moore_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to moore_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sx=str2num(get(handles.sx_edit,'String'));
sy=str2num(get(handles.sy_edit,'String')); 
txy=str2num(get(handles.txy_edit,'String'));

a=linspace(0,pi,37);
sa=(sx+sy)/2;
sd=(sx-sy)/2;
sigma=sa+sd*cos(2*a)-txy*sin(2*a);
tau=sd*sin(2*a)+txy*cos(2*a);
axes(handles.axes1)
plot(sigma,tau,sx,txy,'*');
axis equal;
v=axis;
line([v(1),v(2)],[0,0]);
line([0,0],[v(3),v(4)]);
hold;
plot(sa,0,'x');
smax=max(sigma);smin=min(sigma);tmax=max(tau);
msgbox(['最大应力:',num2str(smax),'  最小应力:',num2str(smin),'  最大剪切力:',num2str(tmax)],'应力计算')
set(handles.sigma_pushbutton,'Enable','on')

function rad_edit_Callback(hObject, eventdata, handles)
% hObject    handle to rad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rad_edit as text
%        str2double(get(hObject,'String')) returns contents of rad_edit as a double


% --- Executes during object creation, after setting all properties.
function rad_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rad_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sigma_pushbutton.
function sigma_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sigma_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.rad_edit,'String')); %pi/3;
sx=str2num(get(handles.sx_edit,'String'));
sy=str2num(get(handles.sy_edit,'String')); 
txy=str2num(get(handles.txy_edit,'String'));
sa=(sx+sy)/2;
sd=(sx-sy)/2;
sigma=sa+sd*cos(2*a)-txy*sin(2*a);  
tau=sd*sin(2*a)+txy*cos(2*a);
plot(sigma,tau,'or');
msgbox(['莫尔圆alpha=',num2str(a),' 处的应力＝',num2str(sigma),'  剪切力＝',num2str(tau)])




% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function moore_menu_Callback(hObject, eventdata, handles)
% hObject    handle to moore_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
moore_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function sigma_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sigma_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sigma_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --------------------------------------------------------------------
function file_memu_Callback(hObject, eventdata, handles)
% hObject    handle to file_memu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


