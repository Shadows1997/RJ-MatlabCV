function varargout = gui_polyfit_12_5(varargin)
% GUI_POLYFIT_12_5 M-file for gui_polyfit_12_5.fig
%      GUI_POLYFIT_12_5, by itself, creates a new GUI_POLYFIT_12_5 or raises the existing
%      singleton*.
%
%      H = GUI_POLYFIT_12_5 returns the handle to a new GUI_POLYFIT_12_5 or the handle to
%      the existing singleton*.
%
%      GUI_POLYFIT_12_5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_POLYFIT_12_5.M with the given input arguments.
%
%      GUI_POLYFIT_12_5('Property','Value',...) creates a new GUI_POLYFIT_12_5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_polyfit_12_5_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_polyfit_12_5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_polyfit_12_5

% Last Modified by GUIDE v2.5 05-Sep-2007 16:38:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_polyfit_12_5_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_polyfit_12_5_OutputFcn, ...
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


% --- Executes just before gui_polyfit_12_5 is made visible.
function gui_polyfit_12_5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_polyfit_12_5 (see VARARGIN)
set(handles.x_edit,'String','0  0.1  0.2  0.3  0.4  0.5  0.6  0.7   0.8  0.9  1');
set(handles.y_edit,'String','0.46  1.99  3.27  6.16  7.08  7.34  7.56  9.66  9.45  9.34  11.4');
set(handles.n_edit,'String','3');

% Choose default command line output for gui_polyfit_12_5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_polyfit_12_5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_polyfit_12_5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;





% --- Executes on button press in polyfit_pushbutton.
function polyfit_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to polyfit_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=str2num(get(handles.x_edit,'String'));
y=str2num(get(handles.y_edit,'String'));
n=str2num(get(handles.n_edit,'String'));
plot(x,y,'k:','Marker','o');
hold on;
p=polyfit(x, y, n);
yy=polyval(p, x);
plot(x,yy,'r-');
set(handles.xishu_edit,'String',strcat('p = ',num2str(p)));

% --- Executes on button press in close_pushbutton.
function close_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to close_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function polyfit_menu_Callback(hObject, eventdata, handles)
% hObject    handle to polyfit_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
polyfit_pushbutton_Callback(hObject, eventdata, handles)

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



function y_edit_Callback(hObject, eventdata, handles)
% hObject    handle to y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of y_edit as text
%        str2double(get(hObject,'String')) returns contents of y_edit as a double


% --- Executes during object creation, after setting all properties.
function y_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to y_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xishu_edit_Callback(hObject, eventdata, handles)
% hObject    handle to xishu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xishu_edit as text
%        str2double(get(hObject,'String')) returns contents of xishu_edit as a double


% --- Executes during object creation, after setting all properties.
function xishu_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xishu_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


