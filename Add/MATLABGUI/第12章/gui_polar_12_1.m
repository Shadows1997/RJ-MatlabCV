function varargout = gui_polar_12_1(varargin)
% GUI_POLAR_12_1 M-file for gui_polar_12_1.fig
%      GUI_POLAR_12_1, by itself, creates a new GUI_POLAR_12_1 or raises the existing
%      singleton*.
%
%      H = GUI_POLAR_12_1 returns the handle to a new GUI_POLAR_12_1 or the handle to
%      the existing singleton*.
%
%      GUI_POLAR_12_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_POLAR_12_1.M with the given input arguments.
%
%      GUI_POLAR_12_1('Property','Value',...) creates a new GUI_POLAR_12_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_polar_12_1_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_polar_12_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_polar_12_1

% Last Modified by GUIDE v2.5 03-Sep-2007 21:02:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_polar_12_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_polar_12_1_OutputFcn, ...
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


% --- Executes just before gui_polar_12_1 is made visible.
function gui_polar_12_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_polar_12_1 (see VARARGIN)

I=imread('pic_gui_polar.bmp','bmp');
axes(handles.axes1);
image(I)
axis off;
% Choose default command line output for gui_polar_12_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_polar_12_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_polar_12_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot_pushbutton.
function plot_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to plot_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
theta=0:0.1:2*pi;
 str={'a=','b=','n='};
 abcData=InputDlg(str,'输入a b n的值',1);
 if ~isempty(abcData) 
 a=str2double(abcData(1)); b=str2double(abcData(2)); n=str2double(abcData(3));
 set(handles.text2,'String',strcat('a=',abcData(1),'  b=',abcData(2),'  n=',abcData(3)))
 rho=a*cos(b+n*theta);
 axes(handles.axes2);
 polar(theta,rho);
 end
 abcData=InputDlg(str,'输入a b n的值',1);
  if ~isempty(abcData) 
 a=str2double(abcData(1)); b=str2double(abcData(2)); n=str2double(abcData(3));
  set(handles.text3,'String',strcat('a=',abcData(1),'  b=',abcData(2),'  n=',abcData(3)))
 rho=a*cos(b+n*theta);
 axes(handles.axes3);
 polar(theta,rho);
  end

% --------------------------------------------------------------------
function plot_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plot_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot_pushbutton_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close





% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

