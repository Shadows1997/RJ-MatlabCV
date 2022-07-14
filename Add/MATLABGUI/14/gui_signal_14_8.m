function varargout = gui_signal_14_8(varargin)
% GUI_SIGNAL_14_8 M-file for gui_signal_14_8.fig
%      GUI_SIGNAL_14_8, by itself, creates a new GUI_SIGNAL_14_8 or raises the existing
%      singleton*.
%
%      H = GUI_SIGNAL_14_8 returns the handle to a new GUI_SIGNAL_14_8 or the handle to
%      the existing singleton*.
%
%      GUI_SIGNAL_14_8('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_SIGNAL_14_8.M with the given input arguments.
%
%      GUI_SIGNAL_14_8('Property','Value',...) creates a new GUI_SIGNAL_14_8 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_signal_14_8_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_signal_14_8_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_signal_14_8

% Last Modified by GUIDE v2.5 12-Sep-2007 08:02:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_signal_14_8_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_signal_14_8_OutputFcn, ...
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


% --- Executes just before gui_signal_14_8 is made visible.
function gui_signal_14_8_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_signal_14_8 (see VARARGIN)

% Choose default command line output for gui_signal_14_8
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_signal_14_8 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_signal_14_8_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in signal_pushbutton.
function signal_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to signal_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t=0:.01:2*pi;%�趨һ��ʱ������,��101����
y=sin(t);
axes(handles.axes1)
plot(t,y),pause(3)
%Ƶ��Ϊw=1(f=1/2��)�����һ���
y=sin(t)+sin(3*t)/3;plot(t,y),pause(3)%��������г��
%��1,3,5,7,9��г������
y=sin(t)+sin(3*t)/3+sin(5*t)/5+sin(7*t)/7+sin(9*t)/9;plot(t,y)
%Ϊ�˻�����ά����,Ҫ�Ѹ��β������ݴ�Ϊһ����ά����,��˱������¶���y,�ر�̡�
y=zeros(10,max(size(t)));x=zeros(size(t));
for k=1:2:19
x=x+sin(k*t)/k;
y((k+1)/2,:)=x;
end
%�������ε��ϻ��
pause(3),plot(t,y(1:9,:)),grid
%set(gcf,'color','w')%����ͼ�α���ɫΪ��ɫ
line([0,pi+0.5],[pi/4,pi/4])%���Ϸ��������߼���ע
text(pi+0.5,pi/4,'pi/4')
title('г���ϳɵĶ�ά����')
%�����벨�λ����ά����ͼ,��������г���״ζԷ����ƽ��̶ȵ�Ӱ��
halft=ceil(length(t)/2);
pause(1)
axes(handles.axes2)
%set(gcf,'color','w')%����ͼ�α���ɫΪ��ɫ
mesh(t(1:halft),[1:10],y(:,1:halft)),%ֻ�������ܲ���
title('г���ϳɵ���ά����')
pause(3)

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function signal_menu_Callback(hObject, eventdata, handles)
% hObject    handle to signal_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
signal_pushbutton_Callback(hObject, eventdata, handles)

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


