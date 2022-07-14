function varargout = gui_limit_12_3(varargin)
% GUI_LIMIT_12_3 M-file for gui_limit_12_3.fig
%      GUI_LIMIT_12_3, by itself, creates a new GUI_LIMIT_12_3 or raises the existing
%      singleton*.
%
%      H = GUI_LIMIT_12_3 returns the handle to a new GUI_LIMIT_12_3 or the handle to
%      the existing singleton*.
%
%      GUI_LIMIT_12_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LIMIT_12_3.M with the given input arguments.
%
%      GUI_LIMIT_12_3('Property','Value',...) creates a new GUI_LIMIT_12_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_limit_12_3_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_limit_12_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_limit_12_3

% Last Modified by GUIDE v2.5 04-Sep-2007 21:13:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_limit_12_3_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_limit_12_3_OutputFcn, ...
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


% --- Executes just before gui_limit_12_3 is made visible.
function gui_limit_12_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_limit_12_3 (see VARARGIN)

% Choose default command line output for gui_limit_12_3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_limit_12_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_limit_12_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in comet_pushbutton.
function comet_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to comet_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axes(handles.axes1); 
x=-700:0.1:700;
box on;
hold on;
axis([-700 700 -0.24 1.1]);
comet(x,sin(x)./x);




% --- Executes on button press in limist_pushbutton.
function limist_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to limist_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes2); 
fplot('sin(x)./x',[-100 100 -0.24 1.1]);
text(30,0.5,'sin(x)/x');

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function comet_menu_Callback(hObject, eventdata, handles)
% hObject    handle to comet_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
comet_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function limit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to limit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
limist_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

close
