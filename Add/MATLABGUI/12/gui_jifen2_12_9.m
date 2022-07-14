function varargout = gui_jifen2_12_9(varargin)
% GUI_JIFEN2_12_9 M-file for gui_jifen2_12_9.fig
%      GUI_JIFEN2_12_9, by itself, creates a new GUI_JIFEN2_12_9 or raises the existing
%      singleton*.
%
%      H = GUI_JIFEN2_12_9 returns the handle to a new GUI_JIFEN2_12_9 or the handle to
%      the existing singleton*.
%
%      GUI_JIFEN2_12_9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_JIFEN2_12_9.M with the given input arguments.
%
%      GUI_JIFEN2_12_9('Property','Value',...) creates a new GUI_JIFEN2_12_9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_jifen2_12_9_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_jifen2_12_9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_jifen2_12_9

% Last Modified by GUIDE v2.5 06-Sep-2007 15:28:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_jifen2_12_9_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_jifen2_12_9_OutputFcn, ...
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


% --- Executes just before gui_jifen2_12_9 is made visible.
function gui_jifen2_12_9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_jifen2_12_9 (see VARARGIN)
set(handles.dx_edit,'String',0.001);
I=imread('pic_gui_jifen.bmp','bmp');
axes(handles.axes1);
image(I)
axis off;

% Choose default command line output for gui_jifen2_12_9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_jifen2_12_9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_jifen2_12_9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function dx_edit_Callback(hObject, eventdata, handles)
% hObject    handle to dx_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dx_edit as text
%        str2double(get(hObject,'String')) returns contents of dx_edit as a double


% --- Executes during object creation, after setting all properties.
function dx_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dx_edit (see GCBO)
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
axes(handles.axes2);
fill([0,1,1,0],[0,0,1,0],'b');hold on;
fill([0.55,0.6,0.6,0.55,0.55],[0,0,0.6,0.55,0],'r');
dx=str2num(get(handles.dx_edit,'String'));
dy=dx;
x=0:dx:1;lx=length(x);
for k=1:lx
    x1=(k-1)*dx;
    y1=0:dy:x1;
    f=x1.^3+2*y1.*2;
    s1(k)=trapz(f)*dy;
end
s=trapz(s1)*dx;
set(handles.jifen_text,'String',num2str(s));

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


