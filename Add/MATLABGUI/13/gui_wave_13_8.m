function varargout = gui_wave_13_8(varargin)
% GUI_WAVE_13_8 M-file for gui_wave_13_8.fig
%      GUI_WAVE_13_8, by itself, creates a new GUI_WAVE_13_8 or raises the existing
%      singleton*.
%
%      H = GUI_WAVE_13_8 returns the handle to a new GUI_WAVE_13_8 or the handle to
%      the existing singleton*.
%
%      GUI_WAVE_13_8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_WAVE_13_8.M with the given input arguments.
%
%      GUI_WAVE_13_8('Property','Value',...) creates a new GUI_WAVE_13_8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_wave_13_8_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_wave_13_8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_wave_13_8

% Last Modified by GUIDE v2.5 08-Sep-2007 16:28:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_wave_13_8_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_wave_13_8_OutputFcn, ...
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


% --- Executes just before gui_wave_13_8 is made visible.
function gui_wave_13_8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_wave_13_8 (see VARARGIN)

% Choose default command line output for gui_wave_13_8
set(handles.a1_edit,'String',12);
set(handles.w1_edit,'String',80);
set(handles.phi1_edit,'String',3.1416);%pi;
set(handles.a2_edit,'String',15);
set(handles.w2_edit,'String',81);
set(handles.phi2_edit,'String',1.0472);%pi/3;

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_wave_13_8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_wave_13_8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function a1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to a1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a1_edit as text
%        str2double(get(hObject,'String')) returns contents of a1_edit as a double


% --- Executes during object creation, after setting all properties.
function a1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to w1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w1_edit as text
%        str2double(get(hObject,'String')) returns contents of w1_edit as a double


% --- Executes during object creation, after setting all properties.
function w1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phi1_edit_Callback(hObject, eventdata, handles)
% hObject    handle to phi1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phi1_edit as text
%        str2double(get(hObject,'String')) returns contents of phi1_edit as a double


% --- Executes during object creation, after setting all properties.
function phi1_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phi1_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to a2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a2_edit as text
%        str2double(get(hObject,'String')) returns contents of a2_edit as a double


% --- Executes during object creation, after setting all properties.
function a2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to w2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w2_edit as text
%        str2double(get(hObject,'String')) returns contents of w2_edit as a double


% --- Executes during object creation, after setting all properties.
function w2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phi2_edit_Callback(hObject, eventdata, handles)
% hObject    handle to phi2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phi2_edit as text
%        str2double(get(hObject,'String')) returns contents of phi2_edit as a double


% --- Executes during object creation, after setting all properties.
function phi2_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phi2_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in wave_pushbutton.
function wave_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to wave_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a1=str2num(get(handles.a1_edit,'String'));
w1=str2num(get(handles.w1_edit,'String'));
phi1=str2num(get(handles.phi1_edit,'String'));%pi;
a2=str2num(get(handles.a2_edit,'String'));
w2=str2num(get(handles.w2_edit,'String'));
phi2=str2num(get(handles.phi2_edit,'String'));%pi/3;
t=1:0.001:10;%设定时间的范围从1到10
y1=a1*cos(w1*t+phi1); %简谐振动1的运动方程
y2=a2*cos(w2*t+phi2); %简谐振动2的运动方程
y=y1+y2; %简谐振动1、2的合成谐振3
axes(handles.axes1);
plot(t,y1),ylabel('y1') %绘制谐振1、2、3的振动曲线
axes(handles.axes2);
plot(t,y2),ylabel('y2')
axes(handles.axes3);
plot(t,y),ylabel('y'),xlabel('t')
sound(y1);pause(2),
sound(y2);pause(2),sound(y)

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function wave_menu_Callback(hObject, eventdata, handles)
% hObject    handle to wave_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wave_pushbutton_Callback(hObject, eventdata, handles)

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


