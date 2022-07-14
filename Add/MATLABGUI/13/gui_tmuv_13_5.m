function varargout = gui_tmuv_13_5(varargin)
% GUI_TMUV_13_5 M-file for gui_tmuv_13_5.fig
%      GUI_TMUV_13_5, by itself, creates a new GUI_TMUV_13_5 or raises the existing
%      singleton*.
%
%      H = GUI_TMUV_13_5 returns the handle to a new GUI_TMUV_13_5 or the handle to
%      the existing singleton*.
%
%      GUI_TMUV_13_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_TMUV_13_5.M with the given input arguments.
%
%      GUI_TMUV_13_5('Property','Value',...) creates a new GUI_TMUV_13_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_tmuv_13_5_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_tmuv_13_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_tmuv_13_5

% Last Modified by GUIDE v2.5 07-Sep-2007 22:42:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_tmuv_13_5_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_tmuv_13_5_OutputFcn, ...
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


% --- Executes just before gui_tmuv_13_5 is made visible.
function gui_tmuv_13_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_tmuv_13_5 (see VARARGIN)

% Choose default command line output for gui_tmuv_13_5
set(handles.t_edit,'String','300');
set(handles.mu_edit,'String','32e-3');
cishu=1;
handles.cishu=cishu;

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_tmuv_13_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_tmuv_13_5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tnuv_pushbutton.
function tnuv_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to tnuv_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
T=str2num(get(handles.t_edit,'String'));
mu=str2num(get(handles.mu_edit,'String'));;
v=0:1500;
y=mxsw(T,mu,v);
plot(v,y);hold on;
v1=260:500;
y1=mxsw(T,mu,v1);

switch  handles.cishu
    case 1
        strcolor='r';
    case 2
        strcolor='b';
    case 3
        strcolor='y';
    otherwise
        strcolor='g';
end
   
fill([v1,500,260],[y1,0,0],strcolor);
handles.cishu=handles.cishu+1;
guidata(hObject, handles);

bili=trapz(y1);
set(handles.bili_text,'String',num2str(bili));
gtext(['T=',num2str(T),',  mu=',num2str(mu),',  ±ÈÀý',num2str(bili)]);

function f=mxsw(T,mu,v)
R=8.31;
k=1.381*10^(-23);
Na=6.022*10^23;
m=mu/Na;
f=4*pi*(m/(2*pi*k*T)).^(3/2).*exp(-m*v.^2./(2*k*T)).*v.*v;

function t_edit_Callback(hObject, eventdata, handles)
% hObject    handle to t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t_edit as text
%        str2double(get(hObject,'String')) returns contents of t_edit as a double


% --- Executes during object creation, after setting all properties.
function t_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mu_edit_Callback(hObject, eventdata, handles)
% hObject    handle to mu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mu_edit as text
%        str2double(get(hObject,'String')) returns contents of mu_edit as a double


% --- Executes during object creation, after setting all properties.
function mu_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function tmuv_menu_Callback(hObject, eventdata, handles)
% hObject    handle to tmuv_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tnuv_pushbutton_Callback(hObject, eventdata, handles)

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


