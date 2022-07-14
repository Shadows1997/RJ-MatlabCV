function varargout = gui_jifen_12_8(varargin)
% GUI_JIFEN_12_8 M-file for gui_jifen_12_8.fig
%      GUI_JIFEN_12_8, by itself, creates a new GUI_JIFEN_12_8 or raises the existing
%      singleton*.
%
%      H = GUI_JIFEN_12_8 returns the handle to a new GUI_JIFEN_12_8 or the handle to
%      the existing singleton*.
%
%      GUI_JIFEN_12_8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_JIFEN_12_8.M with the given input arguments.
%
%      GUI_JIFEN_12_8('Property','Value',...) creates a new GUI_JIFEN_12_8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_jifen_12_8_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_jifen_12_8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_jifen_12_8

% Last Modified by GUIDE v2.5 06-Sep-2007 10:44:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_jifen_12_8_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_jifen_12_8_OutputFcn, ...
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


% --- Executes just before gui_jifen_12_8 is made visible.
function gui_jifen_12_8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_jifen_12_8 (see VARARGIN)

% Choose default command line output for gui_jifen_12_8
set(handles.a_edit,'String',0);
set(handles.x_edit,'String',9);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_jifen_12_8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_jifen_12_8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function a_edit_Callback(hObject, eventdata, handles)
% hObject    handle to a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_edit as text
%        str2double(get(hObject,'String')) returns contents of a_edit as a double


% --- Executes during object creation, after setting all properties.
function a_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_edit as text
%        str2double(get(hObject,'String')) returns contents of x_edit as a double


% --- Executes during object creation, after setting all properties.
function x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in jifen_pushbutton.
function jifen_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to jifen_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.a_edit,'String'));
x=str2num(get(handles.x_edit,'String'));
dt=0.01;t=a:dt:x;
y = exp(-0.9*t.*abs(cos(t)));
sum_ax=dt*sum(y(1:length(t)-1));
trapz_ax=trapz(t,y);
ff=inline('exp(-0.9*t.*abs(cos(t)))','t');
q_ax=quad(ff,a,x);
q8_ax=quad8(ff,a,x);
set(handles.jifen_text,'String',num2str([sum_ax,trapz_ax,q_ax,q8_ax]));
plot(t,y,'b');
legend('f(x)',3);
title('exp(-0.9*t.*abs(cos(t)))','Fontsize',10,'FontWeight','bold');
% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function jifen_menu_Callback(hObject, eventdata, handles)
% hObject    handle to jifen_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
jifen_pushbutton_Callback(hObject, eventdata, handles)

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


