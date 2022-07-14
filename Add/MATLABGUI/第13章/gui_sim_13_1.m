function varargout = gui_sim_13_1(varargin)
% GUI_SIM_13_1 M-file for gui_sim_13_1.fig
%      GUI_SIM_13_1, by itself, creates a new GUI_SIM_13_1 or raises the existing
%      singleton*.
%
%      H = GUI_SIM_13_1 returns the handle to a new GUI_SIM_13_1 or the handle to
%      the existing singleton*.
%
%      GUI_SIM_13_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SIM_13_1.M with the given input arguments.
%
%      GUI_SIM_13_1('Property','Value',...) creates a new GUI_SIM_13_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_sim_13_1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_sim_13_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_sim_13_1

% Last Modified by GUIDE v2.5 07-Sep-2007 08:24:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_sim_13_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_sim_13_1_OutputFcn, ...
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


% --- Executes just before gui_sim_13_1 is made visible.
function gui_sim_13_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_sim_13_1 (see VARARGIN)
% Choose default command line output for gui_sim_13_1
set(handles.tol_edit,'String',0.4)

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_sim_13_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_sim_13_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sim_pushbutton.
function sim_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to sim_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
hold on                         % 图形迭加
axis([0,100,0,100]);      % 设置坐标轴
k=0;
A=[0,0];                        %导弹初始位置
B=[0,80];                    %飞机初始位置
v=1;
dt=1;                             %离散时间改变量
d=80;                          %相距距离
tol=str2num(get(handles.tol_edit,'String'));
while d>tol
     plot(A(1),A(2),'r.');  %画导弹位置
     plot(B(1),B(2),'b+'); %画飞机位置
     pause(0.1);
     k=k+1;
     B=B+[v*dt,0];             %飞机移动位置
     e=B-A;                         %导弹指向飞机向量
     d=norm(e); e0=e/d;    %取向量方向（单位化）
     A=A+2.0*v*dt*e0;       %导弹追击位置
     str=strcat('k=',num2str(k),'  A(',num2str(A),')  B(',num2str(B),')   d=', num2str(d));
     set(handles.out_edit,'String',strvcat(get(handles.out_edit,'String'),str));
end

set(handles.pos_text,'String',strcat('(',num2str(B(1)),', 80)'))

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close

function out_edit_Callback(hObject, eventdata, handles)
% hObject    handle to out_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of out_edit as text
%        str2double(get(hObject,'String')) returns contents of out_edit as a double


% --- Executes during object creation, after setting all properties.
function out_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to out_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pos_edit_Callback(hObject, eventdata, handles)
% hObject    handle to pos_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pos_edit as text
%        str2double(get(hObject,'String')) returns contents of pos_edit as a double


% --- Executes during object creation, after setting all properties.
function pos_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pos_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function sim_menu_Callback(hObject, eventdata, handles)
% hObject    handle to sim_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
sim_pushbutton_Callback(hObject, eventdata, handles)

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





function tol_edit_Callback(hObject, eventdata, handles)
% hObject    handle to tol_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tol_edit as text
%        str2double(get(hObject,'String')) returns contents of tol_edit as a double


% --- Executes during object creation, after setting all properties.
function tol_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tol_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


