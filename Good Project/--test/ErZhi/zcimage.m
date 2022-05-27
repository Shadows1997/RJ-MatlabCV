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
setappdata(handles.figure_zcimage, 'imag_src', 0);         %初始化全局参量imag_src
set(handles.m_image, 'Enable', 'off');           %图片未打开前，设置图像处理菜单不可用
setappdata(handles.figure_zcimage, 'bSave', false);
setappdata(handles.figure_zcimage, 'bChanged', false);     %设置两个标志：一是图片是否被处理过了，
                                                           %二是图片是否被保存了
setappdata(handles.figure_zcimage, 'fstSave', true);        %记录是否第一次保存
setappdata(handles.figure_zcimage, 'fstPath', 0);           %记录第一次保存的路径


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
    return;              %如果点了取消
end
fpath = [pathname filename];  %将文件名和目录名合成一个完整的路径
imag_src = imread(fpath);      %用imread读入图片
axes(handles.axes_src);        %用axes命令设定当前操作的坐标轴是axes_src
imshow(imag_src);              %并用imshow在axes_src上显示图片
setappdata(handles.figure_zcimage, 'imag_src', imag_src);    %在open文件设置save文件需要调用的变量imag_src
set(handles.m_image, 'Enable', 'on');       %图片打开后，设置图像处理菜单可用


% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp';'BMP files';'*.jpg';'JPG files'},'pick an image'); 
if isequal(filename,0)|| isequal(pathname,0)
    return;              %如果点了取消
else 
    fpath = fullfile(pathname, filename);  %获得全路径的另一种方法
end
imag_src = getappdata(handles.figure_zcimage, 'imag_src');  %取得打开图片的数据
imwrite(imag_src, fpath);                 %保存图片


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bChanged = getappdata(handles.figure_zcimage, 'bChanged');   %获得是否更改
bSave = getappdata(handles.figure_zcimage, 'bSave');   %获得是否保存
if bChanged == true && bSave == false       %更改了，而没有保存时
    btnName = questdlg('您已更改了图片，但没有保存，需要保存吗？', '提示', '保存', '不保存','保存');
                                              %用提问对话框
    switch btnName
        case '保存'           %执行axes_dst_menu_save_Callback功能
            feval(@axes_dst_menu_save_Callback, handles.axe_dst_menu_save, eventdata, handles);
        case '不保存'
    end
end
h = findobj('Tag', 'figure_im2bw'); %查找是否打开设置图像二值化参数窗口
if ~isempty(h)
    close(h);
end
close(findobj('Tag', 'figure_zcimage')); %关闭主窗口


% --------------------------------------------------------------------
function axes_dst_menu_save_Callback(hObject, eventdata, handles)
% hObject    handle to axes_dst_menu_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile({'*.bmp';'BMP files';'*.jpg';'JPG files'},'pick an image'); 
if isequal(filename,0)|| isequal(pathname,0)
    return;              %如果点了取消
else 
    fpath = fullfile(pathname, filename);  %获得全路径的另一种方法
end
imag_dst = getimage(handles.axes_dst);    %取得处理后的图片的数据
imwrite(imag_dst, fpath);                 %保存图片
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

    
    
