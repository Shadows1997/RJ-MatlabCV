function varargout = gui_diff_12_7(varargin)
% GUI_DIFF_12_7 M-file for gui_diff_12_7.fig
%      GUI_DIFF_12_7, by itself, creates a new GUI_DIFF_12_7 or raises the existing
%      singleton*.
%
%      H = GUI_DIFF_12_7 returns the handle to a new GUI_DIFF_12_7 or the handle to
%      the existing singleton*.
%
%      GUI_DIFF_12_7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DIFF_12_7.M with the given input arguments.
%
%      GUI_DIFF_12_7('Property','Value',...) creates a new GUI_DIFF_12_7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_diff_12_7_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_diff_12_7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_diff_12_7

% Last Modified by GUIDE v2.5 06-Sep-2007 08:53:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_diff_12_7_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_diff_12_7_OutputFcn, ...
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


% --- Executes just before gui_diff_12_7 is made visible.
function gui_diff_12_7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_diff_12_7 (see VARARGIN)

% Choose default command line output for gui_diff_12_7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_diff_12_7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_diff_12_7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in diff_pushbutton.
function diff_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to diff_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=-6:0.1:6;
y=(x+tan(x)).^(1/3)+sin(x).*cos(6*x);
dx=diff(x);
dy=diff(y);
yd0=dy./dx;
plot(x,y,'b-.',x(1:length(x)-1),yd0,'r-');
axis([-6,6,-30,20]);
legend('f(x)','f(x)µÄµ¼Êý',3)
str='f(x)=(x+tan(x)).^(1/3)+sin(x).*cos(6*x)';
title(str,'Fontsize',12,'FontWeight','bold');

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

% --------------------------------------------------------------------
function diff_menu_Callback(hObject, eventdata, handles)
% hObject    handle to diff_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
diff_pushbutton_Callback(hObject, eventdata, handles)

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


