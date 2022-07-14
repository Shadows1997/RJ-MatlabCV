function varargout = gui_eped_13_6(varargin)
% GUI_EPED_13_6 M-file for gui_eped_13_6.fig
%      GUI_EPED_13_6, by itself, creates a new GUI_EPED_13_6 or raises the existing
%      singleton*.
%
%      H = GUI_EPED_13_6 returns the handle to a new GUI_EPED_13_6 or the handle to
%      the existing singleton*.
%
%      GUI_EPED_13_6('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_EPED_13_6.M with the given input arguments.
%
%      GUI_EPED_13_6('Property','Value',...) creates a new GUI_EPED_13_6 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_eped_13_6_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_eped_13_6_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_eped_13_6

% Last Modified by GUIDE v2.5 08-Sep-2007 09:54:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_eped_13_6_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_eped_13_6_OutputFcn, ...
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


% --- Executes just before gui_eped_13_6 is made visible.
function gui_eped_13_6_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_eped_13_6 (see VARARGIN)

% Choose default command line output for gui_eped_13_6

set(handles.a_edit,'String',2);
set(handles.b_edit,'String',2);

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_eped_13_6 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_eped_13_6_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function a_edit_Callback(hObject, eventdata, handles)
% hObject    handle to a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a_edit as text
%        str2double(get(hObject,'String')) returns contents of a_edit as a double


% --- Executes during object creation, after setting all properties.
function a_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function b_edit_Callback(hObject, eventdata, handles)
% hObject    handle to b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of b_edit as text
%        str2double(get(hObject,'String')) returns contents of b_edit as a double


% --- Executes during object creation, after setting all properties.
function b_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to b_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in eped_pushbutton.
function eped_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to eped_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=str2num(get(handles.a_edit,'String'));
b=str2num(get(handles.b_edit,'String'));
x=-6:0.6:6;
y=x;
q=2e-6;
k=9e9;
[X,Y]=meshgrid(x,y);
rp=sqrt((X-a).^2+(Y-b).^2);
rm=sqrt((X+a).^2+(Y+b).^2);
V=q*k*(1./rp-1./rm);
[Ex,Ey]=gradient(-V);
AE=sqrt(Ex.^2+Ey.^2);
Ex=Ex./AE;Ey=Ey./AE;
cv=linspace(min(min(V)),max(max(V)),49);
contourf(X,Y,V,cv,'k-')
%axis('square')	
title('\fontsize{14}偶极子的电势和电场强度'),hold on
quiver(X,Y,Ex,Ey,0.7)
plot(a,b,'wo',a,b,'w+')
plot(-a,-b,'wo',-a,-b,'w-')
xlabel('x');ylabel('y'),hold off  


% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function eped_menu_Callback(hObject, eventdata, handles)
% hObject    handle to eped_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

eped_pushbutton_Callback(hObject, eventdata, handles)
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


