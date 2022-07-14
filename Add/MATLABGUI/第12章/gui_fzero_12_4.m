function varargout = gui_fzero_12_4(varargin)
% GUI_FZERO_12_4 M-file for gui_fzero_12_4.fig
%      GUI_FZERO_12_4, by itself, creates a new GUI_FZERO_12_4 or raises the existing
%      singleton*.
%
%      H = GUI_FZERO_12_4 returns the handle to a new GUI_FZERO_12_4 or the handle to
%      the existing singleton*.
%
%      GUI_FZERO_12_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_FZERO_12_4.M with the given input arguments.
%
%      GUI_FZERO_12_4('Property','Value',...) creates a new GUI_FZERO_12_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_fzero_12_4_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_fzero_12_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_fzero_12_4

% Last Modified by GUIDE v2.5 05-Sep-2007 10:58:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_fzero_12_4_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_fzero_12_4_OutputFcn, ...
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


% --- Executes just before gui_fzero_12_4 is made visible.
function gui_fzero_12_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_fzero_12_4 (see VARARGIN)

% Choose default command line output for gui_fzero_12_4
x=-10:0.1:10;
y=fun_12_4(x);
plot(x,y,'b');hold on;
plot(x,zeros(size(x)),'k--');
xlabel('x');
ylabel('y');
title('sin(x).^2.*exp(-0.1*x)-0.5*abs(x)','Fontsize',10,'Fontweight','bold');
hold off



handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_fzero_12_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_fzero_12_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function fzero_menu_Callback(hObject, eventdata, handles)
% hObject    handle to fzero_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fzero_pushbutton_Callback(hObject, eventdata, handles)

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




% --- Executes on button press in fzero_pushbutton.
function fzero_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to fzero_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[xx,yy]=ginput(4);
str_getpoint=strcat('(',num2str(xx(1)),',',num2str(yy(1)),'), (',num2str(xx(2)),',',num2str(yy(2)),'), (',num2str(xx(3)),',',num2str(yy(3)),'), (',num2str(xx(4)),',',num2str(yy(4)),')');
set(handles.getpoint_text,'String',str_getpoint);
xzero1=fzero('fun_12_4',xx(1));
xzero2=fzero('fun_12_4',xx(2));
xzero3=fzero('fun_12_4',xx(3));
xzero4=fzero('fun_12_4',xx(4));
str_getpoint=num2str([xzero1 xzero2 xzero3 xzero4]);
set(handles.fzero_text,'String',str_getpoint);
hold on
plot(xzero1,fun_12_4(xzero1),'rp',xzero2,fun_12_4(xzero2),'rp',xzero3,fun_12_4(xzero3),'rp',xzero4,fun_12_4(xzero4),'rp')
legend('Ô­º¯Êý','y=0','Áãµã')

