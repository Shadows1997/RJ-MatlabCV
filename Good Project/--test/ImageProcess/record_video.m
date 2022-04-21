function varargout = record_video(varargin)
% RECORD_VIDEO MATLAB code for record_video.fig
%      RECORD_VIDEO, by itself, creates a new RECORD_VIDEO or raises the existing
%      singleton*.
%
%      H = RECORD_VIDEO returns the handle to a new RECORD_VIDEO or the handle to
%      the existing singleton*.
%
%      RECORD_VIDEO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECORD_VIDEO.M with the given input arguments.
%
%      RECORD_VIDEO('Property','Value',...) creates a new RECORD_VIDEO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before record_video_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to record_video_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help record_video

% Last Modified by GUIDE v2.5 19-Jan-2021 11:07:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @record_video_OpeningFcn, ...
                   'gui_OutputFcn',  @record_video_OutputFcn, ...
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


% --- Executes just before record_video is made visible.
function record_video_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to record_video (see VARARGIN)

% Choose default command line output for record_video
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes record_video wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = record_video_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vid = videoinput('winvideo');%����IDΪ1������ͷ����Ƶ������Ƶ��ʽ�� YUY2_640x480�����ʾ��Ƶ�ķֱ���Ϊ640x480��
set(vid,'ReturnedColorSpace','rgb');
filename = 'film';       %������Ƶ������
addition=inputdlg('��Ƶ��֡����','��Ƶ��֡��');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
nframe = b;            %��Ƶ��֡��
addition4=inputdlg('ÿ���֡����','ÿ���֡��');
addition5=cell2mat(addition4);%addition��ֵΪԪ����ת��Ϊ����
addition6=str2num(addition5);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
c=addition6(1,1);%����ֵ
nrate = c;              %ÿ���֡��
preview(vid);            
writerObj = VideoWriter( [filename '.avi'] );
writerObj.FrameRate = nrate;  
open(writerObj);
for ii = 1: nframe
    frame = getsnapshot(vid);
    imshow(frame);
    f.cdata = frame;
    f.colormap = colormap([]) ;
    writeVideo(writerObj,f);
end
close(writerObj);
closepreview



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
