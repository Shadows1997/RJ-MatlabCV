function varargout = gui_polyder_12_6(varargin)
% GUI_POLYDER_12_6 M-file for gui_polyder_12_6.fig
%      GUI_POLYDER_12_6, by itself, creates a new GUI_POLYDER_12_6 or raises the existing
%      singleton*.
%
%      H = GUI_POLYDER_12_6 returns the handle to a new GUI_POLYDER_12_6 or the handle to
%      the existing singleton*.
%
%      GUI_POLYDER_12_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_POLYDER_12_6.M with the given input arguments.
%
%      GUI_POLYDER_12_6('Property','Value',...) creates a new GUI_POLYDER_12_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_polyder_12_6_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_polyder_12_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_polyder_12_6

% Last Modified by GUIDE v2.5 05-Sep-2007 20:29:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_polyder_12_6_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_polyder_12_6_OutputFcn, ...
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


% --- Executes just before gui_polyder_12_6 is made visible.
function gui_polyder_12_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_polyder_12_6 (see VARARGIN)

% Choose default command line output for gui_polyder_12_6
set(handles.n_edit,'String','5');
set(handles.x_edit,'String','3.3');
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_polyder_12_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_polyder_12_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in polyder_pushbutton.
function polyder_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to polyder_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

x= 0:0.1:8; 
y= cos(x).*log(3+ x.^2+ exp(x.^2));
n=str2num(get(handles.n_edit,'String'));
p= polyfit(x,y,n);
%disp('显示拟合 4 次的多项式：')
set(handles.poly2str_text,'String', strcat(num2str(n),'阶拟合多项式为：',poly2str(p,'x')));


p1= polyder(p);
p2= polyder(p1);
X=str2num(get(handles.x_edit,'String'));
x0= polyval(p,X);
x1= polyval(p1,X);
x2= polyval(p2,X);
%disp(['x= 2',blanks(2),'函数值',blanks(2),'一阶导',blanks(2),'二阶导'])
%[x0,x1,x2]
set(handles.label_text,'String',[strcat('X=',num2str(X),'处的'),blanks(10),'函数值',blanks(8),'一阶导',blanks(8),'二阶导']);
set(handles.polyder_text,'String',num2str([x0,x1,x2]));
y1= polyval(p,x);
plot(x,y,'r:',x,y1,'b-');
legend('f(x)','拟合曲线',0);
title('cos(x).*log(3+ x.^2+ exp(x.^2))','Fontsize',12,'FontWeight','bold');


% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


function x_edit_Callback(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of x_edit as text
%        str2double(get(hObject,'String')) returns contents of x_edit as a double


% --- Executes during object creation, after setting all properties.
function x_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to x_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function n_edit_Callback(hObject, eventdata, handles)
% hObject    handle to n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of n_edit as text
%        str2double(get(hObject,'String')) returns contents of n_edit as a double


% --- Executes during object creation, after setting all properties.
function n_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to n_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function polyder_menu_Callback(hObject, eventdata, handles)
% hObject    handle to polyder_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
polyder_pushbutton_Callback(hObject, eventdata, handles)

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


