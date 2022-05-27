function varargout = zcimage(varargin)
%ZCIMAGE MATLAB code file for zcimage.fig
%      ZCIMAGE, by itself, creates a new ZCIMAGE or raises the existing
%      singleton*.
%
%      H = ZCIMAGE returns the handle to a new ZCIMAGE or the handle to
%      the existing singleton*.
%
%      ZCIMAGE('Property','Value',...) creates a new ZCIMAGE using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to zcimage_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ZCIMAGE('CALLBACK') and ZCIMAGE('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ZCIMAGE.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zcimage

% Last Modified by GUIDE v2.5 23-Oct-2018 17:30:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zcimage_OpeningFcn, ...
                   'gui_OutputFcn',  @zcimage_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before zcimage is made visible.
function zcimage_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)
setappdata(handles.figure_zcimage, 'imag_src', 0);         %��ʼ��ȫ�ֲ���imag_src
set(handles.m_image, 'Enable', 'off');           %ͼƬδ��ǰ������ͼ����˵�������
setappdata(handles.figure_zcimage, 'bSave', false);
setappdata(handles.figure_zcimage, 'bChanged', false);     %����������־��һ��ͼƬ�Ƿ񱻴�����ˣ�
                                                           %����ͼƬ�Ƿ񱻱�����
setappdata(handles.figure_zcimage, 'fstSave', true);        %��¼�Ƿ��һ�α���
setappdata(handles.figure_zcimage, 'fstPath', 0);           %��¼��һ�α����·��


% Choose default command line output for zcimage
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zcimage wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zcimage_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_image_Callback(hObject, eventdata, handles)
% hObject    handle to m_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_image_2bw_Callback(hObject, eventdata, handles)
% hObject    handle to m_image_2bw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = im2bw_args;
setappdata(handles.figure_zcimage, 'bChanged', true); 


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile(...
    {'*.bmp;*.jpg;*.png;*.jpeg', 'Imag Files(*.bmp;*.jpg;*.png;*.jpeg)'; ...
    '*.*',  'All Files(*.*)'}, ...
   'pick an image');
if isequal(filename,0)|| isequal(pathname,0)
    return;              %�������ȡ��
end
fpath = [pathname filename];  %���ļ�����Ŀ¼���ϳ�һ��������·��
imag_src = imread(fpath);      %��imread����ͼƬ
axes(handles.axes_src);        %��axes�����趨��ǰ��������������axes_src
imshow(imag_src);              %����imshow��axes_src����ʾͼƬ
setappdata(handles.figure_zcimage, 'imag_src', imag_src);    %��open�ļ�����save�ļ���Ҫ���õı���imag_src
set(handles.m_image, 'Enable', 'on');       %ͼƬ�򿪺�����ͼ����˵�����


% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp';'BMP files';'*.jpg';'JPG files'},'pick an image'); 
if isequal(filename,0)|| isequal(pathname,0)
    return;              %�������ȡ��
else 
    fpath = fullfile(pathname, filename);  %���ȫ·������һ�ַ���
end
imag_src = getappdata(handles.figure_zcimage, 'imag_src');  %ȡ�ô�ͼƬ������
imwrite(imag_src, fpath);                 %����ͼƬ


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bChanged = getappdata(handles.figure_zcimage, 'bChanged');   %����Ƿ����
bSave = getappdata(handles.figure_zcimage, 'bSave');   %����Ƿ񱣴�
if bChanged == true && bSave == false       %�����ˣ���û�б���ʱ
    btnName = questdlg('���Ѹ�����ͼƬ����û�б��棬��Ҫ������', '��ʾ', '����', '������','����');
                                              %�����ʶԻ���
    switch btnName
        case '����'           %ִ��axes_dst_menu_save_Callback����
            feval(@axes_dst_menu_save_Callback, handles.axe_dst_menu_save, eventdata, handles);
        case '������'
    end
end
h = findobj('Tag', 'figure_im2bw'); %�����Ƿ������ͼ���ֵ����������
if ~isempty(h)
    close(h);
end
close(findobj('Tag', 'figure_zcimage')); %�ر�������


% --------------------------------------------------------------------
function axes_dst_menu_save_Callback(hObject, eventdata, handles)
% hObject    handle to axes_dst_menu_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp';'BMP files';'*.jpg';'JPG files'},'pick an image'); 
if isequal(filename,0)|| isequal(pathname,0)
    return;              %�������ȡ��
else 
    fpath = fullfile(pathname, filename);  %���ȫ·������һ�ַ���
end
imag_dst = getimage(handles.axes_dst);    %ȡ�ô�����ͼƬ������
imwrite(imag_dst, fpath);                 %����ͼƬ
setappdata(handles.figure_zcimage, 'bSave', true);




% --------------------------------------------------------------------
function axe_dst_menu_Callback(hObject, eventdata, handles)
% hObject    handle to axe_dst_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function tb1_open_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to tb1_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
feval(@m_file_open_Callback, handles.m_file_open, eventdata, handles);

% --------------------------------------------------------------------
function tb1_save_ClickedCallback(hObject, eventdata, handles)
% hObject    handle to tb1_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fstSave = getappdata(handles.figure_zcimage, 'fstSave');
if (fstSave == true)
    [filename, pathname] = uiputfile({'*.bmp';'BMP files';'*.jpg';'JPG files'},'pick an image'); 
    if isequal(filename, 0) || isequal(pathname, 0)
        return;
    else
        fpath = fullfile(pathname, filename);
    end
    imag_dst = getimage(handles.axes_dst);
    imwrite(imag_dst, fpath);
    setappdata(handles.figure_zcimage, 'fstPath',fpath );
    setappdata(handles.figure_zcimage, 'bSave',true );
    setappdata(handles.figure_zcimage, 'fstSave',false );
else
    imag_dst = getimage(handles.axes_dst);
    fpath = getappdata(handles.figure_zcimage, 'fstPath');
    imwrite(imag_dst, fpath);
end

    
    
