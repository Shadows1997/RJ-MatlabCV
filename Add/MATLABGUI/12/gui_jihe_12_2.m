function varargout = gui_jihe_12_2(varargin)
% GUI_JIHE_12_2 M-file for gui_jihe_12_2.fig
%      GUI_JIHE_12_2, by itself, creates a new GUI_JIHE_12_2 or raises the existing
%      singleton*.
%
%      H = GUI_JIHE_12_2 returns the handle to a new GUI_JIHE_12_2 or the handle to
%      the existing singleton*.
%
%      GUI_JIHE_12_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_JIHE_12_2.M with the given input arguments.
%
%      GUI_JIHE_12_2('Property','Value',...) creates a new GUI_JIHE_12_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_jihe_12_2_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_jihe_12_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_jihe_12_2

% Last Modified by GUIDE v2.5 04-Sep-2007 16:40:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_jihe_12_2_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_jihe_12_2_OutputFcn, ...
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


% --- Executes just before gui_jihe_12_2 is made visible.
function gui_jihe_12_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_jihe_12_2 (see VARARGIN)

% Choose default command line output for gui_jihe_12_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_jihe_12_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_jihe_12_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plot_button.
function plot_button_Callback(hObject, eventdata, handles)
% hObject    handle to plot_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
str={'a1,b1,c1,d1,N1','a2,b2,c2,d2,N2','a3,b3,c3,d3,N3','a4,b4,c4,d4,N4'};
strdef={'6,4,3,1,50','6i,4,3,1,30','6i,4i,3,1,30','6i,4i,3i,1,30'};
DataInput=InputDlg(str,' ‰»Îa b c d Nµƒ÷µ',1,strdef);
set(handles.text1,'String',strcat('[a b c d N]=[',DataInput{1,1},']'));
set(handles.text2,'String',strcat('[a b c d N]=[',DataInput{2,1},']'));
set(handles.text3,'String',strcat('[a b c d N]=[',DataInput{3,1},']'));
set(handles.text4,'String',strcat('[a b c d N]=[',DataInput{4,1},']'));
for m=1:4
    Data=str2num(DataInput{m,1});
    a(m)=Data(1,1); b(m)=Data(1,2); c(m)=Data(1,3); d(m)=Data(1,4); N(m)=Data(1,5);
    xgrid=linspace(-abs(a(m)),abs(a(m)),N(m));
    ygrid=linspace(-abs(b(m)),abs(b(m)),N(m));
    [x,y]=meshgrid(xgrid,ygrid);
    z=c(m)*sqrt(d(m)-y.*y/b(m)/b(m)-x.*x/a(m)/a(m));u=1;
    z1=real(z);
    for k=2:N(m)-1
      for j=2:N(m)-1
            if imag(z(k,j))~=0 z1(k,j)=0;end
            if all(imag(z([k-1,k+1],[j-1,j+1])))~=0 z1(k,j)=NaN;end
      end
    end
    if m==1 
        axes(handles.axes1);
    elseif m==2
        axes(handles.axes2);
    elseif m==3
        axes(handles.axes3);   
     elseif m==4
        axes(handles.axes4);         
    end
    
    surf(x,y,z1),hold
    if u==1 z2=-z1;surf(x,y,z2);
         axis([-abs(a(m)),abs(a(m)),-abs(b(m)),abs(b(m)),-abs(c(m)),abs(c(m))]);
    end
    xlabel('x'),ylabel('y'),zlabel('z');
    hold off
end



% --- Executes on button press in close_button.
function close_button_Callback(hObject, eventdata, handles)
% hObject    handle to close_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close



% --------------------------------------------------------------------
function plot_menu_Callback(hObject, eventdata, handles)
% hObject    handle to plot_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
plot_button_Callback(hObject, eventdata, handles)

% --------------------------------------------------------------------
function file_menu_Callback(hObject, eventdata, handles)
% hObject    handle to file_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function close_menu_Callback(hObject, eventdata, handles)
% hObject    handle to close_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close

