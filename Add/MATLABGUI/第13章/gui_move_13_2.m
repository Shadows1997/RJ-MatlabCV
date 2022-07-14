function varargout = gui_move_13_2(varargin)
% GUI_MOVE_13_2 M-file for gui_move_13_2.fig
%      GUI_MOVE_13_2, by itself, creates a new GUI_MOVE_13_2 or raises the existing
%      singleton*.
%
%      H = GUI_MOVE_13_2 returns the handle to a new GUI_MOVE_13_2 or the handle to
%      the existing singleton*.
%
%      GUI_MOVE_13_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_MOVE_13_2.M with the given input arguments.
%
%      GUI_MOVE_13_2('Property','Value',...) creates a new GUI_MOVE_13_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_move_13_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_move_13_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_move_13_2

% Last Modified by GUIDE v2.5 07-Sep-2007 10:38:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_move_13_2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_move_13_2_OutputFcn, ...
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


% --- Executes just before gui_move_13_2 is made visible.
function gui_move_13_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_move_13_2 (see VARARGIN)

% Choose default command line output for gui_move_13_2
set(handles.v_slider,'Value',0.5);
set(handles.k_edit,'String',2);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_move_13_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_move_13_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function v_slider_Callback(hObject, eventdata, handles)
% hObject    handle to v_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

start_pushbutton_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function v_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to v_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in start_pushbutton.
function start_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to start_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% anim_zzy1.m		演示红色小球沿一条封闭螺线运动的实时动画
% 仅演示实时动画的调用格式为  					anim_zzy1(K)			
% 既演示实时动画又拍摄照片的调用格式为		f=anim_zzy1(K,ki)		
% K						红球运动的循环数（不小于1）
% ki				指定拍摄照片的瞬间，取 1 到 1034 间的任意整数。
% f						存储拍摄的照片数据，可用image(f.cdata)观察照片。
% 产生封闭的运动轨线
%function f=anim_zzy1(K,ki)

t1=(0:1000)/1000*10*pi;x1=cos(t1);y1=sin(t1);z1=-t1;
t2=(0:10)/10;x2=x1(end)*(1-t2);y2=y1(end)*(1-t2);z2=z1(end)*ones(size(x2));
t3=t2;z3=(1-t3)*z1(end);x3=zeros(size(z3));y3=x3;
t4=t2;x4=t4;y4=zeros(size(x4));z4=y4;
x=[x1 x2 x3 x4];y=[y1 y2 y3 y4];z=[z1 z2 z3 z4];
plot3(x,y,z,'b'),	axis off		% 绘制曲线
% 定义"线"色、"点"型（点）、点的大小（40）、擦除方式（xor)
h=line('Color',[1 0 0],'Marker','.','MarkerSize',40,'EraseMode','xor');
% 使小球运动
n=length(x);i=1;j=1;
speed=get(handles.v_slider,'Value');
k=str2num(get(handles.k_edit,'String'));
while 1													% 无穷循环
   set(h,'xdata',x(i),'ydata',y(i),'zdata',z(i));	 % 小球位置
   drawnow;												% 刷新屏幕				<21>
   pause(0.1*(1.1-speed))										% 控制球速				<22>
   i=i+1;
   if i>n 
      i=1;j=j+1;
      if j>k;break;end
   end
 
end 



% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close






function k_edit_Callback(hObject, eventdata, handles)
% hObject    handle to k_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of k_edit as text
%        str2double(get(hObject,'String')) returns contents of k_edit as a double




% --------------------------------------------------------------------
function start_menu_Callback(hObject, eventdata, handles)
% hObject    handle to start_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start_pushbutton_Callback(hObject, eventdata, handles)

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


