function varargout = Turbo(varargin)
%                                                                        set(handles.pushbutton25,'String',round(10*pos)/10);
%TURBO M-file for Turbo.fig
%      TURBO, by itself, creates a new TURBO or raises the existing
%      singleton*.
%
%      H = TURBO returns the handle to a new TURBO or the handle to
%      the existing singleton*.
%
%      TURBO('Property','Value',...) creates a new TURBO using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Turbo_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      TURBO('CALLBACK') and TURBO('CALLBACK',hObject,...) call the
%      local function named CALLBACK in TURBO.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text_set to modify the response to help Turbo

% Last Modified by GUIDE v2.5 16-Oct-2016 15:33:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Turbo_OpeningFcn, ...
                   'gui_OutputFcn',  @Turbo_OutputFcn, ...
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


% --- Executes just before Turbo is made visible.
function Turbo_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Turbo
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Turbo wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Turbo_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles)
% hObject    handle to open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName,FilterIndex]=uigetfile({'*.jpg';'*.bmp';'*.png';'*.gif'},'请选择文件');
if FilterIndex==1
    data=imread([PathName,FileName]);
    [widch,height,dim] = size(data);
    set(handles.open_path,'string',[PathName,FileName]);
    set(handles.pic_size,'UserData',[widch,height,dim]);
    set(handles.pic_size_tem,'UserData',[widch,height,dim]);
    set(handles.pic_size_backup,'UserData',[widch,height,dim]);
    set(hObject,'UserData',data);
    set(handles.Reset,'UserData',data);
    
    str_jpg = dir([PathName '\*.jpg']);  % 自动读取上一张图片、下一张图片
    str_bmp = dir([PathName '\*.bmp']);
    str_png = dir([PathName '\*.png']);
    str_gif = dir([PathName '\*.gif']);
    pic_str =[str_jpg;str_bmp;str_png;str_gif];
    pic_cell = struct2cell(pic_str);
    pic_name = pic_cell(1,:);
    [~,pic_index] = ismember('lena.jpg',pic_name);
    
    set(handles.pic_pre,'UserData',pic_name);
    set(handles.pic_next,'UserData',pic_index);
    set(handles.Help,'UserData',PathName);
    
    imshow(data);
else
    
end


function open_path_Callback(hObject, eventdata, handles)
% hObject    handle to open_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of open_path as text_set
%        str2double(get(hObject,'String')) returns contents of open_path as a double


% --- Executes during object creation, after setting all properties.
function open_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to open_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data=get(handles.open,'UserData');
[FileName,PathName,FilterIndex]=uiputfile({'*.jpg';'*.bmp';'*.png';},'保存文件','new_figure');
if FilterIndex ==1
    set(handles.save_path,'string',[PathName,FileName]);
    imwrite(data,[PathName,FileName]);
else

end


function save_path_Callback(hObject, eventdata, handles)
% hObject    handle to save_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of save_path as text_set
%        str2double(get(hObject,'String')) returns contents of save_path as a double


% --- Executes during object creation, after setting all properties.
function save_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to save_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Help.
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
help_path = get(handles.Help,'UserData');
help_pdf = 'Turbo软件使用说明.pdf';

open([help_path,help_pdf]);

% --- Executes on button press in pic_pre.
function pic_pre_Callback(hObject, eventdata, handles)
% hObject    handle to pic_pre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  pic_path = get(handles.Help,'UserData');
  pic_name =  get(hObject,'UserData');
  pic_index  = get(handles.pic_next,'UserData');
  
  if pic_index == 1
      msgbox('第一张')
  else
    pic_index = pic_index - 1;
    set(handles.pic_next,'UserData',pic_index);
    
    data=imread([pic_path,pic_name{1,pic_index}]);
    [widch,height,dim] = size(data);
    set(handles.open_path,'string',[pic_path,pic_name{1,pic_index}]);
    set(handles.pic_size,'UserData',[widch,height,dim]);
    set(handles.pic_size_tem,'UserData',[widch,height,dim]);
    set(handles.pic_size_backup,'UserData',[widch,height,dim]);
    set(handles.open,'UserData',data);
    set(handles.Reset,'UserData',data);
    imshow(data);
  end
% --- Executes on button press in pic_next.
function pic_next_Callback(hObject, eventdata, handles)
% hObject    handle to pic_next (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  pic_path = get(handles.Help,'UserData');
  pic_name =  get(handles.pic_pre,'UserData');
  pic_index  = get(hObject,'UserData');
  
  if pic_index == length(pic_name)
      msgbox('最后一张')
  else
    pic_index = pic_index + 1;
    set(hObject,'UserData',pic_index);
    
    data=imread([pic_path,pic_name{1,pic_index}]);
    [widch,height,dim] = size(data);
    set(handles.open_path,'string',[pic_path,pic_name{1,pic_index}]);
    set(handles.pic_size,'UserData',[widch,height,dim]);
    set(handles.pic_size_tem,'UserData',[widch,height,dim]);
    set(handles.pic_size_backup,'UserData',[widch,height,dim]);
    set(handles.open,'UserData',data);
    set(handles.Reset,'UserData',data);
    imshow(data);
  end

% --- Executes on button press in Reset.
function Reset_Callback(hObject, eventdata, handles)
% hObject    handle to Reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(hObject,'UserData');
pic_size = get(handles.pic_size_backup,'UserData');

set(handles.open,'UserData',data);
set(handles.pic_size,'UserData',pic_size);
set(handles.pic_size_tem,'UserData',pic_size);

set(handles.G_intensity,'value',0);
set(handles.G_contrast,'value',3.5);
set(handles.G_hue,'value',1.5);
set(handles.G_fuzzy_sharp,'value',0);
set(handles.L_intensity,'value',0);
set(handles.L_contrast,'value',3.5);
set(handles.L_hue,'value',1.5);
set(handles.L_fuzzy_sharp,'value',0);

imshow(data);

% --- Executes on slider movement.
function G_intensity_Callback(hObject, eventdata, handles)
% hObject    handle to G_intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
pos =get(hObject,'Value');

if pic_dim == 3 % 3通道 RGB 图像
    hsi = rgb2hsi(data);
    I = hsi(:,:,3);
    new_I = I + pos*0.5;
    hsi(:,:,3) = new_I;
    new_data = im2uint8(hsi2rgb(hsi));
else % 单通道 Gray 图像
    new_data = im2uint8(data + pos*128);
end
set(hObject,'UserData',new_data);
imshow(new_data);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function G_intensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in G_intensity_ok.
function G_intensity_ok_Callback(hObject, eventdata, handles)
% hObject    handle to G_intensity_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.G_intensity,'UserData');
set(handles.open,'UserData',data);
set(handles.G_intensity,'Value',0);

% --- Executes on slider movement.
function G_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to G_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pos =get(hObject,'Value');

new_data = imadjust(data,[],[],5/pos - 0.4);

set(hObject,'UserData',new_data);
imshow(new_data);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function G_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in G_contrast_ok.
function G_contrast_ok_Callback(hObject, eventdata, handles)
% hObject    handle to G_contrast_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.G_contrast,'UserData');
set(handles.open,'UserData',data);
set(handles.G_contrast,'Value',3.5);

% --- Executes on slider movement.
function G_hue_Callback(hObject, eventdata, handles)
% hObject    handle to G_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
pos =get(hObject,'Value');

if pic_dim == 3 % 3通道 RGB 图像
    hsi = rgb2hsi(data);
    s = hsi(:,:,1);
    new_s = imadjust(s,[],[],max(pos-0.5,0));
    hsi(:,:,1) = new_s;
    new_data = im2uint8(hsi2rgb(hsi));
else
    new_data = data;
end
set(hObject,'UserData',new_data);
imshow(new_data);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function G_hue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in G_hue_ok.
function G_hue_ok_Callback(hObject, eventdata, handles)
% hObject    handle to G_hue_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.G_hue,'UserData');
set(handles.open,'UserData',data);
set(handles.G_hue,'Value',1.5);

% --- Executes on slider movement.
function G_fuzzy_sharp_Callback(hObject, eventdata, handles)
% hObject    handle to G_fuzzy_sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pos = round(get(hObject,'Value'));

switch(pos)
    case -3
        H = fspecial('average',[7,7]);
        new_data = imfilter(data,H);
    case -2
        H = fspecial('average',[5,5]);
        new_data = imfilter(data,H);
    case -1
        H = fspecial('average',[3,3]);
        new_data = imfilter(data,H);
    case 0
        H = 1;
        new_data = data;
    case 1
        H = fspecial('log',[3,3]);
        new_data = imadd(data,imfilter(data,H));
    case 2
         H = fspecial('log',[5,5]);
        new_data = imadd(data,imfilter(data,H));
    case 3
         H = fspecial('log',[7,7]);
        new_data = imadd(data,imfilter(data,H));
end

set(hObject,'UserData',new_data);
imshow(new_data);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function G_fuzzy_sharp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_fuzzy_sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in G_fuzzy_sharp_ok.
function G_fuzzy_sharp_ok_Callback(hObject, eventdata, handles)
% hObject    handle to G_fuzzy_sharp_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.G_fuzzy_sharp,'UserData');
set(handles.open,'UserData',data);
set(handles.G_fuzzy_sharp,'Value',0);

% --- Executes on button press in roi.
function roi_Callback(hObject, eventdata, handles)
% hObject    handle to roi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=roipoly;
set(hObject,'UserData',bw);

% --- Executes on slider movement.
function L_intensity_Callback(hObject, eventdata, handles)
% hObject    handle to L_intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
pos =get(hObject,'Value');
roi_tem = get(handles.roi,'UserData');
if isempty(roi_tem)
    msgbox('请先点击【局部选择】，选择一个预处理的区域','提示')
else
if pic_dim == 3
    roi(:,:,1) = roi_tem;
    roi(:,:,2) = roi_tem;
    roi(:,:,3) = roi_tem;
else
    roi = roi_tem;
end

if pic_dim == 3 % 3通道 RGB 图像
    hsi = rgb2hsi(data);
    I = hsi(:,:,3);
    new_I = I + pos*0.5;
    hsi(:,:,3) = new_I;
    new_data = im2uint8(hsi2rgb(hsi));
else % 单通道 Gray 图像
    new_data = im2uint8(data + pos*128);
end

data_front = immultiply(new_data,roi);
data_back = immultiply(data,~roi);
new_data = imadd(data_front,data_back);

set(hObject,'UserData',new_data);
imshow(new_data);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function L_intensity_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_intensity (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in L_intensity_ok.
function L_intensity_ok_Callback(hObject, eventdata, handles)
% hObject    handle to L_intensity_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.L_intensity,'UserData');
set(handles.open,'UserData',data);
set(handles.L_intensity,'Value',0);

% --- Executes on slider movement.
function L_contrast_Callback(hObject, eventdata, handles)
% hObject    handle to L_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
pos =get(hObject,'Value');
roi_tem = get(handles.roi,'UserData');
if isempty(roi_tem)
    msgbox('请先点击【局部选择】，选择一个预处理的区域','提示')
else
if pic_dim == 3
    roi(:,:,1) = roi_tem;
    roi(:,:,2) = roi_tem;
    roi(:,:,3) = roi_tem;
else
    roi = roi_tem;
end

new_data = imadjust(data,[],[],5/pos - 0.4);

data_front = immultiply(new_data,roi);
data_back = immultiply(data,~roi);
new_data = imadd(data_front,data_back);

set(hObject,'UserData',new_data);
imshow(new_data);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function L_contrast_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_contrast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in L_contrast_ok.
function L_contrast_ok_Callback(hObject, eventdata, handles)
% hObject    handle to L_contrast_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.L_contrast,'UserData');
set(handles.open,'UserData',data);
set(handles.L_contrast,'Value',3.5);

% --- Executes on slider movement.
function L_hue_Callback(hObject, eventdata, handles)
% hObject    handle to L_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
pos =get(hObject,'Value');
roi_tem = get(handles.roi,'UserData');
if isempty(roi_tem)
    msgbox('请先点击【局部选择】，选择一个预处理的区域','提示')
else
if pic_dim == 3
    roi(:,:,1) = roi_tem;
    roi(:,:,2) = roi_tem;
    roi(:,:,3) = roi_tem;
else
    roi = roi_tem;
end

if pic_dim == 3 % 3通道 RGB 图像
    hsi = rgb2hsi(data);
    s = hsi(:,:,1);
    new_s = imadjust(s,[],[],max(pos-0.5,0));
    hsi(:,:,1) = new_s;
    new_data = im2uint8(hsi2rgb(hsi));
else
    new_data = data;
end

data_front = immultiply(new_data,roi);
data_back = immultiply(data,~roi);
new_data = imadd(data_front,data_back);

set(hObject,'UserData',new_data);
imshow(new_data);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function L_hue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_hue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in L_hue_ok.
function L_hue_ok_Callback(hObject, eventdata, handles)
% hObject    handle to L_hue_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.L_hue,'UserData');
set(handles.open,'UserData',data);
set(handles.L_hue,'Value',1.5);

% --- Executes on slider movement.
function L_fuzzy_sharp_Callback(hObject, eventdata, handles)
% hObject    handle to L_fuzzy_sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pos = round(get(hObject,'Value'));
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
roi_tem = get(handles.roi,'UserData');
if isempty(roi_tem)
    msgbox('请先点击【局部选择】，选择一个预处理的区域','提示')
else
if pic_dim == 3
    roi(:,:,1) = roi_tem;
    roi(:,:,2) = roi_tem;
    roi(:,:,3) = roi_tem;
else
    roi = roi_tem;
end

switch(pos)
    case -3
        H = fspecial('average',[7,7]);
        new_data = imfilter(data,H);
    case -2
        H = fspecial('average',[5,5]);
        new_data = imfilter(data,H);
    case -1
        H = fspecial('average',[3,3]);
        new_data = imfilter(data,H);
    case 0
        H = 1;
        new_data = data;
    case 1
        H = fspecial('log',[3,3]);
        new_data = imadd(data,imfilter(data,H));
    case 2
         H = fspecial('log',[5,5]);
        new_data = imadd(data,imfilter(data,H));
    case 3
         H = fspecial('log',[7,7]);
        new_data = imadd(data,imfilter(data,H));
end

data_front = immultiply(new_data,roi);
data_back = immultiply(data,~roi);
new_data = imadd(data_front,data_back);

set(hObject,'UserData',new_data);
imshow(new_data);
end
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function L_fuzzy_sharp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to L_fuzzy_sharp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in L_fuzzy_sharp_ok.
function L_fuzzy_sharp_ok_Callback(hObject, eventdata, handles)
% hObject    handle to L_fuzzy_sharp_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.L_fuzzy_sharp,'UserData');
set(handles.open,'UserData',data);
set(handles.L_fuzzy_sharp,'Value',0);

% --- Executes on button press in background_fuzzy.
function background_fuzzy_Callback(hObject, eventdata, handles)
% hObject    handle to background_fuzzy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
roi_tem = get(handles.roi,'UserData');
if isempty(roi_tem)
    msgbox('请先点击【局部选择】，选择一个预处理的区域','提示')
else
if pic_dim == 3
    roi(:,:,1) = roi_tem;
    roi(:,:,2) = roi_tem;
    roi(:,:,3) = roi_tem;
else
    roi = roi_tem;
end

 H = fspecial('average',[7,7]);
data_fuzzy = imfilter(data,H);

data_front = immultiply(data,roi);
data_back = immultiply(data_fuzzy,~roi);
new_data = imadd(data_front,data_back);

set(handles.open,'UserData',new_data);
imshow(new_data);
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in G_styel.
function G_styel_Callback(hObject, eventdata, handles)
% hObject    handle to G_styel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%[widch,height,dim] = get(handles.pic_size,'UserData');

data = get(handles.open,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
style = get(hObject,'Value');

if pic_dim == 3 % 三通道 RGB 图片
switch(style)
    case 1
        new_data = data;
    case 2
        pic_size(3) = 1;
        new_data = rgb2gray(data);
        set(handles.pic_size_tem,'UserData',pic_size);
    case 3
        pic_size(3) = 3;
        new_data = uint8(zeros(pic_size));
        new_data(:,:,1) = data(:,:,1);
        new_data(:,:,2) = data(:,:,2);
        set(handles.pic_size_tem,'UserData',pic_size);
end
else % 单通道 Gray 图片(未考虑其它情况)
    switch(style)
        case 1
             new_data = data;
        case 2
            new_data = data;
        case 3
            pic_size(3) = 3;
            new_data = uint8(zeros(pic_size));
            new_data(:,:,1) = data(:,:);
            new_data(:,:,2) = data(:,:);
            set(handles.pic_size_tem,'UserData',pic_size);
    end
end
set(hObject,'UserData',new_data);
imshow(new_data);

% Hints: contents = cellstr(get(hObject,'String')) returns G_styel contents as cell array
%        contents{get(hObject,'Value')} returns selected item from G_styel


% --- Executes during object creation, after setting all properties.
function G_styel_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_styel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in G_styel_ok.
function G_styel_ok_Callback(hObject, eventdata, handles)
% hObject    handle to G_styel_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.G_styel,'UserData');
pic_size = get(handles.pic_size_tem,'UserData');

set(handles.open,'UserData',data);
set(handles.pic_size,'UserData',pic_size);


% --- Executes on button press in scrawl_clear.
function scrawl_clear_Callback(hObject, eventdata, handles)
% hObject    handle to scrawl_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% set(handles.figure1,'Pointer','')
set(handles.figure1,'Pointer','arrow');
set(handles.scrawl_start,'UserData',0);
delete(findobj('type','line','parent',handles.axes));
% --- Executes on button press in scrawl_ok.


function scrawl_ok_Callback(hObject, eventdata, handles)
% hObject    handle to scrawl_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

data_tem = getframe(gca);
data = frame2im(data_tem);
data_size = size(data);

set(handles.open,'UserData',data);
set(handles.pic_size,'UserData',data_size);
set(handles.pic_size_tem,'UserData',data_size);
set(handles.pic_size_backup,'UserData',data_size);

set(handles.scrawl_start,'UserData',0);
set(handles.figure1,'Pointer','arrow');



% --- Executes on button press in scrawl_start.
function scrawl_start_Callback(hObject, eventdata, handles)
% hObject    handle to scrawl_start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(hObject,'UserData',1);
set(handles.figure1,'Pointer','hand');

% --- Executes on button press in pushbutton24.
function pushbutton24_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in mosaic_size.


% --- Executes on button press in pic_text.
function pic_text_Callback(hObject, eventdata, handles)
% hObject    handle to pic_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = inputdlg('请输入文字','提示');
font = get(handles.text_font,'UserData');
color = get(handles.text_color,'UserData');

if isempty(str)
    
else
    if  isempty(font) && isempty(color)
        gtext(str{1,1});
    elseif  isempty(font)
        gtext(str{1,1},'Color',color);
    elseif  isempty(color)
        gtext(str{1,1},'FontSize',font);
    else
        gtext(str{1,1},'Color',color,'FontSize',font);
    end
end

% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in modify_ok.
function modify_ok_Callback(hObject, eventdata, handles)
% hObject    handle to modify_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data_tem = getframe(gca);
data = frame2im(data_tem);
data_size = size(data);

set(handles.open,'UserData',data);
set(handles.pic_size,'UserData',data_size);
set(handles.pic_size_tem,'UserData',data_size);
set(handles.pic_size_backup,'UserData',data_size);

% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)
% hObject    handle to crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imcrop;


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scrawl_start = get(handles.scrawl_start,'UserData');
if scrawl_start == 1
    if strcmp(get(gcf,'SelectionType'),'alt')
        col = uisetcolor('选择画笔颜色');
        set(handles.axes,'colororder',col);
    else
        set(handles.scrawl,'UserData',1);
        pos = get(handles.axes,'CurrentPoint');
        set(handles.figure1,'UserData',pos(1,[1 2]));
    end
else
    
end


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

scrawl_start = get(handles.scrawl_start,'UserData');
scrawl = get(handles.scrawl,'UserData');
pos = get(handles.axes,'CurrentPoint');

if scrawl_start == 1
    if scrawl == 1
    	pos1 = get(handles.figure1,'UserData');
        line([pos1(1);pos(1,1)],[pos1(2);pos(1,2)],'Linewidth',4);
        set(handles.figure1,'UserData',pos(1,[1 2]));
    end
else
    
end


% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scrawl_start = get(handles.scrawl_start,'UserData');
if scrawl_start == 1
    set(handles.scrawl,'UserData',0);
end


% --------------------------------------------------------------------
function text_font_Callback(hObject, eventdata, handles)
% hObject    handle to text_font (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
font = inputdlg('请输入字体大小','字体设置');

if isempty(font)
    font = 10;
else
font = round(str2num(font{1,1}));
end
set(hObject,'UserData',font);
% --------------------------------------------------------------------
function text_color_Callback(hObject, eventdata, handles)
% hObject    handle to text_color (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
color = uisetcolor('请选择文字颜色');
set(hObject,'UserData',color);

% --------------------------------------------------------------------
function text_set_Callback(hObject, eventdata, handles)
% hObject    handle to text_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function mosaic_set_Callback(hObject, eventdata, handles)
% hObject    handle to mosaic_set (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in mosaic.
function mosaic_Callback(hObject, eventdata, handles)
% hObject    handle to mosaic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = get(handles.open,'UserData');
delta = get(hObject,'UserData');
pic_size = get(handles.pic_size,'UserData');
pic_dim = pic_size(3);
bw = roipoly;

if pic_dim == 3
    roi(:,:,1) = bw;
    roi(:,:,2) = bw;
    roi(:,:,3) = bw;
else
    roi = bw;
end

if isempty(delta)
    roi_data = immosaic(data,10);
else
    roi_data = immosaic(data,delta);
end

roi_data = immultiply(roi_data,roi); 
back_data =  immultiply(data,~roi); 

new_data = imadd(roi_data,back_data);

set(handles.open,'UserData',new_data);
imshow(new_data);


% --------------------------------------------------------------------
function mosaic_size_Callback(hObject, eventdata, handles)
% hObject    handle to mosaic_size (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
m_s = inputdlg('请输入马赛克大小，建议值：10','提示');
if isempty(m_s)
    
else
    m_s = str2num(m_s{1,1});
    set(handles.mosaic,'UserData',m_s);
end

% 下面是子程序
function [ new_data ] = immosaic(data,delta)
% [ new_data ] = immosaic(data,delta) 为图片添加马赛克
% delta为马赛克大小，data为输入图像，new_data为输出图像

[heigth,width,dim] = size(data);

y_o = 1; % 设置马赛克原点
x_o = 1;

for y = 1:heigth
        x_o = 1;  % 这一步要谨慎，被坑了好久！
    for x = 1:width
       if abs(x-x_o) > delta
            x_o = min(x_o + delta,width);
        end
        if abs(y-y_o) > delta
            y_o = min(y_o + delta,heigth);
        end
           new_data(y,x,:) = data(y_o,x_o,:);
    end
end

function rgb = hsi2rgb(hsi)
%HSI2RGB Converts an HSI image to RGB.
%   RGB = HSI2RGB(HSI) converts an HSI image to RGB, where HSI is
%   assumed to be of class double with:   
%     hsi(:, :, 1) = hue image, assumed to be in the range
%                    [0, 1] by having been divided by 2*pi.
%     hsi(:, :, 2) = saturation image, in the range [0, 1].
%     hsi(:, :, 3) = intensity image, in the range [0, 1].
%
%   The components of the output image are:
%     rgb(:, :, 1) = red.
%     rgb(:, :, 2) = green.
%     rgb(:, :, 3) = blue.
%   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
%   Digital Image Processing Using MATLAB, Prentice-Hall, 2004
%   $Revision: 1.5 $  $Date: 2003/10/13 01:01:06 $
% Extract the individual HSI component images.

H = hsi(:, :, 1) * 2 * pi;
S = hsi(:, :, 2);
I = hsi(:, :, 3);

% Implement the conversion equations.
R = zeros(size(hsi, 1), size(hsi, 2));
G = zeros(size(hsi, 1), size(hsi, 2));
B = zeros(size(hsi, 1), size(hsi, 2));

% RG sector (0 <= H < 2*pi/3).
idx = find( (0 <= H) & (H < 2*pi/3));
B(idx) = I(idx) .* (1 - S(idx));
R(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx)) ./cos(pi/3 - H(idx)));
G(idx) = 3*I(idx) - (R(idx) + B(idx));

% BG sector (2*pi/3 <= H < 4*pi/3).
idx = find( (2*pi/3 <= H) & (H < 4*pi/3) );
R(idx) = I(idx) .* (1 - S(idx));
G(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 2*pi/3) ./cos(pi - H(idx)));
B(idx) = 3*I(idx) - (R(idx) + G(idx));

% BR sector.
idx = find( (4*pi/3 <= H) & (H <= 2*pi));
G(idx) = I(idx) .* (1 - S(idx));
B(idx) = I(idx) .* (1 + S(idx) .* cos(H(idx) - 4*pi/3) ./cos(5*pi/3 - H(idx)));
R(idx) = 3*I(idx) - (G(idx) + B(idx));

% Combine all three results into an RGB image.  Clip to [0, 1] to
% compensate for floating-point arithmetic rounding effects.
rgb = cat(3, R, G, B);
rgb = im2uint8(rgb);
% rgb = max(min(rgb, 1), 0);

function hsi = rgb2hsi(rgb)
%RGB2HSI Converts an RGB image to HSI.
%   HSI = RGB2HSI(RGB) converts an RGB image to HSI. The input image
%   is assumed to be of size M-by-N-by-3, where the third dimension
%   accounts for three image planes: red, green, and blue, in that
%   order. If all RGB component images are equal, the HSI conversion
%   is undefined. The input image can be of class double (with values
%   in the range [0, 1]), uint8, or uint16.  
%
%   The output image, HSI, is of class double, where:
%     hsi(:, :, 1) = hue image normalized to the range [0, 1] by
%                    dividing all angle values by 2*pi.  
%     hsi(:, :, 2) = saturation image, in the range [0, 1].
%     hsi(:, :, 3) = intensity image, in the range [0, 1].
%   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
%   Digital Image Processing Using MATLAB, Prentice-Hall, 2004
%   $Revision: 1.4 $  $Date: 2003/09/29 15:21:54 $
% Extract the individual component immages.

rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% Implement the conversion equations.
num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));
H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
S = 1 - 3.* num./(den + eps);

I = (r + g + b)/3;

% Combine all three results into an hsi image.
hsi = cat(3, H, S, I);
