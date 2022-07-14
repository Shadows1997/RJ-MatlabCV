function varargout = gui_dwn_14_2(varargin)
% GUI_DWN_14_2 M-file for gui_dwn_14_2.fig
%      GUI_DWN_14_2, by itself, creates a new GUI_DWN_14_2 or raises the existing
%      singleton*.
%
%      H = GUI_DWN_14_2 returns the handle to a new GUI_DWN_14_2 or the handle to
%      the existing singleton*.
%
%      GUI_DWN_14_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_DWN_14_2.M with the given input arguments.
%
%      GUI_DWN_14_2('Property','Value',...) creates a new GUI_DWN_14_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_dwn_14_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_dwn_14_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_dwn_14_2

% Last Modified by GUIDE v2.5 10-Sep-2007 09:24:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_dwn_14_2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_dwn_14_2_OutputFcn, ...
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


% --- Executes just before gui_dwn_14_2 is made visible.
function gui_dwn_14_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_dwn_14_2 (see VARARGIN)

% Choose default command line output for gui_dwn_14_2

%R1=2; R2=2; R3=4; k1=2; k2=4;Us=6;

set(handles.canshu_edit,'String','[2,3,5,2,5,6]')
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_dwn_14_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_dwn_14_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in dwn_pushbutton.
function dwn_pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to dwn_pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%get(handles.canshu_edit,'String')%'[2,2,4,2,4,6]'
%R1=2; R2=2; R3=4; k1=2; k2=4;
canshu=str2num(get(handles.canshu_edit,'String'));
R1=canshu(1); R2=canshu(2); R3=canshu(3); k1=canshu(4); k2=canshu(5); 
A=[1/R1, -1/R3, -k1/R3;-1/R3, 1/R1+1/R2+1/R3, k1/R3-k2;0,1/R1,1];
B=[0,1;1/R1,0;1/R1,0];
%Us=6;
Us=canshu(6);
Is=0;
X1=A\B*[Us,Is]';Uoc=X1(1);
Us2=0;Is2=1;
X2=A\B*[Us2,Is2]';Req=X2(1);
RL=Req;Pmax=Uoc^2/(4*Req);
set(handles.RL_text,'String',RL)
set(handles.Pmax_text,'String',Pmax)
RL=0:0.1:12;P=Uoc^2*RL./((Req+RL).*(Req+RL));
plot(RL,P)
xlabel('RL')
ylabel('P')
title('功率随负载变化曲线');
grid



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





function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --------------------------------------------------------------------
function dwn_menu_Callback(hObject, eventdata, handles)
% hObject    handle to dwn_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dwn_pushbutton_Callback(hObject, eventdata, handles)

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


