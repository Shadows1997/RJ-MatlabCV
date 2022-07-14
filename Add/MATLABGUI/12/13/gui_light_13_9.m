function varargout = gui_light_13_9(varargin)
% GUI_LIGHT_13_9 M-file for gui_light_13_9.fig
%      GUI_LIGHT_13_9, by itself, creates a new GUI_LIGHT_13_9 or raises the existing
%      singleton*.
%
%      H = GUI_LIGHT_13_9 returns the handle to a new GUI_LIGHT_13_9 or the handle to
%      the existing singleton*.
%
%      GUI_LIGHT_13_9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_LIGHT_13_9.M with the given input arguments.
%
%      GUI_LIGHT_13_9('Property','Value',...) creates a new GUI_LIGHT_13_9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_light_13_9_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_light_13_9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_light_13_9

% Last Modified by GUIDE v2.5 08-Sep-2007 17:51:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_light_13_9_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_light_13_9_OutputFcn, ...
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


% --- Executes just before gui_light_13_9 is made visible.
function gui_light_13_9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_light_13_9 (see VARARGIN)

% Choose default command line output for gui_light_13_9
set(handles.lambda_edit,'String',0.0000006);
set(handles.d_edit,'String',0.0015);
set(handles.z_edit,'String',2);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_light_13_9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_light_13_9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in light_pushbutton.
function light_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to light_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Lambda=str2num(get(handles.lambda_edit,'String'));
d=str2num(get(handles.d_edit,'String'));
z=str2num(get(handles.z_edit,'String'));
yMax=5*Lambda*z/d;xs=yMax;
Ny=101;ys=linspace(-yMax,yMax,Ny);
for i=1:Ny
    L1=sqrt((ys(i)-d/2).^2+z.^2);
    L2=sqrt((ys(i)+d/2).^2+z.^2);
    Phi=2*pi*(L2-L1)/Lambda;
    B(i,:)=4*cos(Phi/2).^2;
end
NCL=255;%确定所用灰度等级为255级
Br=(B/4.0)*NCL;%定标，使最大光强(4.0)定为最大灰度级(白色)
axes(handles.axes1)
image(xs,ys,Br);
colormap(gray(NCL));
xlabel('双缝干涉条纹')
axes(handles.axes2)
plot(B(:),ys);
xlabel('双缝干涉光强分布')
% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close


function lambda_edit_Callback(hObject, eventdata, handles)
% hObject    handle to lambda_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lambda_edit as text
%        str2double(get(hObject,'String')) returns contents of lambda_edit as a double


% --- Executes during object creation, after setting all properties.
function lambda_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lambda_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_edit_Callback(hObject, eventdata, handles)
% hObject    handle to d_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_edit as text
%        str2double(get(hObject,'String')) returns contents of d_edit as a double


% --- Executes during object creation, after setting all properties.
function d_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function z_edit_Callback(hObject, eventdata, handles)
% hObject    handle to z_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of z_edit as text
%        str2double(get(hObject,'String')) returns contents of z_edit as a double


% --- Executes during object creation, after setting all properties.
function z_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to z_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function light_menu_Callback(hObject, eventdata, handles)
% hObject    handle to light_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
light_pushbutton_Callback(hObject, eventdata, handles)

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


