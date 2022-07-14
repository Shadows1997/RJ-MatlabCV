function varargout = gui_I_14_6(varargin)
% GUI_I_14_6 M-file for gui_I_14_6.fig
%      GUI_I_14_6, by itself, creates a new GUI_I_14_6 or raises the existing
%      singleton*.
%
%      H = GUI_I_14_6 returns the handle to a new GUI_I_14_6 or the handle to
%      the existing singleton*.
%
%      GUI_I_14_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_I_14_6.M with the given input arguments.
%
%      GUI_I_14_6('Property','Value',...) creates a new GUI_I_14_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_I_14_6_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_I_14_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_I_14_6

% Last Modified by GUIDE v2.5 11-Sep-2007 16:24:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_I_14_6_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_I_14_6_OutputFcn, ...
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


% --- Executes just before gui_I_14_6 is made visible.
function gui_I_14_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_I_14_6 (see VARARGIN)

% Choose default command line output for gui_I_14_6
%R1= 3 ，R2= 4 ， L1= 2H，L2= 1H，C= 0. 1F
set(handles.canshu_edit,'String','[3,4,2,1,0.1]')
I=imread('pic_gui_I.bmp','bmp');
axes(handles.axes1);
image(I)
axis off;

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_I_14_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_I_14_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in I_pushbutton.
function I_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to I_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
omega=[eps,4,3];us=[8,6,3];%按三种频率设定输入信号数组。
%z1=[3,3,3];z2=[4,4,4]; %电阻分量列成常数数组。
%R1= 3 ，R2= 4 ， L1= 2H，L2= 1H，C= 0. 1F
canshu=str2num(get(handles.canshu_edit,'String'));
R1=canshu(1);R2=canshu(2); L1=canshu(3);L2=canshu(4);C=canshu(5);
z1=R1*ones(1,3);z2=R2*ones(1,3);
z3=j*omega*L1;z4=j*omega*L2;z5=1./(j*omega*C);%电抗分量是频率的函数,自动成为数组。
z11=z5.*z2./(z5+z2)+z4;
z=z1+z3.*z11./(z3+z11);%求等效阻抗。
i=us./z ;%求解
%disp([omega',abs(i'),angle(i')*180/pi])
omega2=omega';im=abs(i');phi=angle(i')*180/pi;
istr=strcat('i=',num2str(im(1)),'+',num2str(im(2)),'cos(',num2str(omega2(2)),'t',num2str(-phi(2)),')+',num2str(im(3)),'cos(',num2str(omega2(3)),'t',num2str(-phi(3)),')')
set(handles.i_text,'String',istr)
% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


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




% --------------------------------------------------------------------
function I_menu_Callback(hObject, eventdata, handles)
% hObject    handle to I_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I_pushbutton_Callback(hObject, eventdata, handles)

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


