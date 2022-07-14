function varargout = gui_RLC2_14_4(varargin)
% GUI_RLC2_14_4 M-file for gui_RLC2_14_4.fig
%      GUI_RLC2_14_4, by itself, creates a new GUI_RLC2_14_4 or raises the existing
%      singleton*.
%
%      H = GUI_RLC2_14_4 returns the handle to a new GUI_RLC2_14_4 or the handle to
%      the existing singleton*.
%
%      GUI_RLC2_14_4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_RLC2_14_4.M with the given input arguments.
%
%      GUI_RLC2_14_4('Property','Value',...) creates a new GUI_RLC2_14_4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_RLC2_14_4_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_RLC2_14_4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_RLC2_14_4

% Last Modified by GUIDE v2.5 11-Sep-2007 10:26:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_RLC2_14_4_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_RLC2_14_4_OutputFcn, ...
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


% --- Executes just before gui_RLC2_14_4 is made visible.
function gui_RLC2_14_4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_RLC2_14_4 (see VARARGIN)

% Choose default command line output for gui_RLC2_14_4

set(handles.canshu_edit,'String','[1.5,1,1,1]')
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_RLC2_14_4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_RLC2_14_4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in RLC2_pushbutton.
function RLC2_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to RLC2_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
canshu=str2num(get(handles.canshu_edit,'String'));
R=canshu(1);L=canshu(2);C=canshu(3);Us=canshu(4);
a=[0,1;-1/L/C,-R/L];
b=[0,1/L/C]';
c=[1,0];
d=0;
hold on;
sys=ss(a,b,c,d);
pic=step(sys);
axes(handles.axes1)
plot(pic);hold on
title('阶跃响应曲线')
xlabel('time')
ylabel('amplitude')
axis([0 120 0 1.4])
plot(ones(1,length(pic)),'k:')
[z,p,k]=zpkdata(sys,'v');
ii=find(real(p)>0);
Np=length(ii);
if(Np>0)
    set(handles.wd_text,'String','系统是不稳定的')
else
    set(handles.wd_text,'String','系统是稳定的')
end

num=1;
den=[1,1,1];
Finalvalue=polyval(num,0)/polyval(den,0);

[y,t]=step(sys);
[Ymax,k]=max(y);
PeakTime=t(k);
OverPerent=100*(Ymax-Finalvalue)/Finalvalue;

n=1;
while y(n)<0.1*Finalvalue,n=n+1;
end
m=1;
while y(m)<0.9*Finalvalue,m=m+1;
end
RiseTime=t(m)-t(n);

l=length(t);
while (y(l)>0.98*Finalvalue)&(y(l)<1.02*Finalvalue)
l=l-1;
end
SettlingTime=t(l);
out=[Finalvalue,PeakTime,OverPerent,RiseTime,SettlingTime];
set(handles.out_text,'String',num2str(out))

function canshu_edit_Callback(hObject, eventdata, handles)
% hObject    handle to canshu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of canshu_edit as text
%        str2double(get(hObject,'String')) returns contents of canshu_edit as a double


% --- Executes during object creation, after setting all properties.
function canshu_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to canshu_edit (see GCBO)
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
function RLC2_menu_Callback(hObject, eventdata, handles)
% hObject    handle to RLC2_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RLC2_pushbutton_Callback(hObject, eventdata, handles)
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


