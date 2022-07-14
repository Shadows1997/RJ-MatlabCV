function varargout = gui_B_13_7(varargin)
% GUI_B_13_7 M-file for gui_B_13_7.fig
%      GUI_B_13_7, by itself, creates a new GUI_B_13_7 or raises the existing
%      singleton*.
%
%      H = GUI_B_13_7 returns the handle to a new GUI_B_13_7 or the handle to
%      the existing singleton*.
%
%      GUI_B_13_7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_B_13_7.M with the given input arguments.
%
%      GUI_B_13_7('Property','Value',...) creates a new GUI_B_13_7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_B_13_7_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_B_13_7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_B_13_7

% Last Modified by GUIDE v2.5 08-Sep-2007 11:32:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_B_13_7_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_B_13_7_OutputFcn, ...
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


% --- Executes just before gui_B_13_7 is made visible.
function gui_B_13_7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_B_13_7 (see VARARGIN)

% Choose default command line output for gui_B_13_7
set(handles.R_edit,'String',2);
set(handles.I0_edit,'String',100);
set(handles.N_edit,'String',30);
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_B_13_7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_B_13_7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in B_pushbutton.
function B_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to B_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
R=str2num(get(handles.R_edit,'String'));
I0=str2num(get(handles.I0_edit,'String'));
N=str2num(get(handles.N_edit,'String'));   %将电流分段为20段
mu0=4*pi*1e-7;
c0=mu0/(4*pi)*I0;
x=linspace(-3,3,N);y=x;            %确定观察点的范围 
thta0=linspace(0,2*pi,N+1);        %环周的分段数 
thta1=thta0(1:N);
y1=R*cos(thta1);                  %环各段矢量的起点坐标y1,z1;
z1=R*sin(thta1);
thta2=thta0(2:N+1);
y2=R*cos(thta2);                  %环各段矢量的起点坐标y2,z2;
z2=R*sin(thta2);
xc=0;yc=(y2+y1)/2;zc=(z2+z1)/2;      %计算环各段矢量中点的3个坐标分量 
dlx=0;dly=y2-y1;dlz=z2-z1;           %计算环各段矢量dl的3个长度分量
NGx=N;NGy=NGx;                %确定网格数
for i=1:NGy                        %循环计算各网格点上的B(x,y)值
        for j=1:NGx
           rx=x(j)-xc;ry=y(i)-yc;rz=0-zc;        
           r3=sqrt(rx.^2+ry.^2+rz.^2).^3;
           dlxr_x=dly.*rz-dlz.*ry;
           dlxr_y=dly.*rx-dlx.*rz;
           Bx(i,j)=sum(c0*dlxr_x./r3);      %把环各段产生的磁场分量累加
           By(i,j)=sum(c0*dlxr_y./r3);  
           B=(Bx.^2+By.^2).^0.5;          %计算B的大小 
         end
end
%subplot(1,2,1),
axes(handles.axes1);
quiver(x,y,Bx,By);      %缩小0.8倍的矢量图
xlabel( 'x'),ylabel('y')
axis([-3,3,-3,3])
title('Z=0处x-y平面上的磁感线的分布')
%subplot(1,2,2)
axes(handles.axes2);
mesh(x,y,B); 
xlabel( 'x'),ylabel('y'),zlabel('z')
grid on                                    %加网格
title('电流环Z=0处x-y平面上的磁感强度分布')



% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


function R_edit_Callback(hObject, eventdata, handles)
% hObject    handle to R_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of R_edit as text
%        str2double(get(hObject,'String')) returns contents of R_edit as a double


% --- Executes during object creation, after setting all properties.
function R_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to R_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function I0_edit_Callback(hObject, eventdata, handles)
% hObject    handle to I0_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of I0_edit as text
%        str2double(get(hObject,'String')) returns contents of I0_edit as a double


% --- Executes during object creation, after setting all properties.
function I0_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to I0_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function N_edit_Callback(hObject, eventdata, handles)
% hObject    handle to N_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of N_edit as text
%        str2double(get(hObject,'String')) returns contents of N_edit as a double


% --- Executes during object creation, after setting all properties.
function N_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to N_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function B_menu_Callback(hObject, eventdata, handles)
% hObject    handle to B_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 B_pushbutton_Callback(hObject, eventdata, handles)

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


