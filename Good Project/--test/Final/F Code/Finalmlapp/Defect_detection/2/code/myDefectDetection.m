function varargout = myDefectDetection(varargin)
% MYDEFECTDETECTION MATLAB code for myDefectDetection.fig
%      MYDEFECTDETECTION, by itself, creates a new MYDEFECTDETECTION or raises the existing
%      singleton*.
%
%      H = MYDEFECTDETECTION returns the handle to a new MYDEFECTDETECTION or the handle to
%      the existing singleton*.
%
%      MYDEFECTDETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYDEFECTDETECTION.M with the given input arguments.
%
%      MYDEFECTDETECTION('Property','Value',...) creates a new MYDEFECTDETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myDefectDetection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myDefectDetection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myDefectDetection

% Last Modified by GUIDE v2.5 05-Jan-2019 11:00:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myDefectDetection_OpeningFcn, ...
                   'gui_OutputFcn',  @myDefectDetection_OutputFcn, ...
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


% --- Executes just before myDefectDetection is made visible.
function myDefectDetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myDefectDetection (see VARARGIN)
handles.input = 0;
handles.img = [];
handles.manual_flag = 1;
handles.detectResults = [];
handles.isolate_flag = 1;
handles.ignore_edge_flag = 1;
handles.gauss_segma = 3;
handles.disk_size = 2;
handles.seg_threshold = 4;

set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);

set(handles.radiobutton5,'value',1);
set(handles.radiobutton4,'value',0);

set(handles.radiobutton6,'value',1);
set(handles.radiobutton7,'value',0);

axes(handles.axes1);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

axes(handles.axes2);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

axes(handles.axes3);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

axes(handles.axes4);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

axes(handles.axes5);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

axes(handles.axes6);
set(gca,'xtick',[]);
set(gca,'ytick',[]);


% Choose default command line output for myDefectDetection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myDefectDetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myDefectDetection_OutputFcn(hObject, eventdata, handles) 
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
[FileName,PathName] = uigetfile({'*.jpg'; '*.png'; '*.bmp'}, 'Select the image for defect detection');
if isequal(FileName,0) || isequal(PathName,0) 
    input = 0;
    return; %若未选中jpg文件则重新打开[文件选择]窗口
else
    fpath = fullfile(PathName,FileName);
    input = 1;
    set(handles.text15,'String',fpath);
end
handles.input = input;
I = imread(fpath);
cla(handles.axes1);
axes(handles.axes1);
imshow(I, []);
guidata(hObject,handles);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
guidata(hObject,handles);
t = size(I);
if length(t) == 2
    handles.img = I;
    guidata(hObject,handles);
elseif length(t) == 3
    handles.img = rgb2gray(I);
    guidata(hObject,handles);
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'value',1);
set(handles.radiobutton2,'value',0);

% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton2,'value',1);
set(handles.radiobutton1,'value',0);


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


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text15.
function text15_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles = guidata(hObject)
I = handles.img;

t1 = clock;
% DFT transform
DFT = fftn(I);  
MAG = abs(DFT); %Get the magnitude only
PHASE = DFT./MAG; %Get the phase only

% Reconstruct image from phase
R1 = ifftn(MAG);
R2 = ifftn(PHASE);

t2 = clock;

% Display Images
cla(handles.axes3);
axes(handles.axes3);
imshow(uint8(R1));
guidata(hObject,handles);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

cla(handles.axes4);
axes(handles.axes4);
imshow(R2, []);
guidata(hObject,handles);
set(gca,'xtick',[]);
set(gca,'ytick',[]);
% figure,imshow(I); %original image
% figure,imshow(uint8(R1)); %reconstructed image from magnitude only
% figure,imshow(R2,[]); %reconstructed image from phase only

gauss_segma = get(handles.edit4, 'String');
if gauss_segma == '3'
    gauss_segma = 3;
else
    gauss_segma = str2num(gauss_segma);
end


t3 = clock;
% Thresholding using Mahallanobis distance
Y = imgaussfilt(R2, gauss_segma); %Gaussian filter with sigma = 
% figure,imshow(Y,[]);
t4 = clock;

cla(handles.axes5);
axes(handles.axes5);
imshow(Y, []);
guidata(hObject,handles);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

t5 = clock;
% Compute distance Euclidean
MEAN = mean2(Y);
[x,y,z]=size(I);
for i = 1:x
    for j=1:y
        D(i,j)=(Y(i,j)-MEAN).^2;
    end
end
% figure; imshow(D,[]);
t6 = clock;

cla(handles.axes6);
axes(handles.axes6);
imshow(D, []);
guidata(hObject,handles);
set(gca,'xtick',[]);
set(gca,'ytick',[]);

if get(handles.radiobutton1,'value')
    % manual_flag = 1;
    handles.manual_flag = 1;
end
guidata(hObject,handles);

if get(handles.radiobutton2,'value')
    % manual_flag = 0;
    handles.manual_flag = 0;
end
guidata(hObject,handles);

handles = guidata(hObject);
manual_flag = handles.manual_flag;

disk_size = get(handles.edit2, 'String');
if disk_size == '2'
    disk_size = 2;
else
    disk_size = str2num(disk_size);
end

seg_threshold = get(handles.edit1, 'String');
if seg_threshold == '4'
    seg_threshold = 4;
else
    seg_threshold = str2num(seg_threshold);
end

if manual_flag
    t7 = clock;
    % Detect the blob
    O = (uint8(255*mat2gray(D)));
    % figure; imshow(O);
    BW = O;
    if seg_threshold > max(max(BW))
        seg_threshold = max(max(BW));
        errordlg('The [Seg Threshold] is too large. And the results may not be correct.');
    end
    BW(find(BW > seg_threshold)) = 100;
    se = strel('disk', disk_size);
    BW_1 = BW;
    BW_1 = imerode(BW_1, se);
    BW_1 = imdilate(BW_1, se);
    t8 = clock;
else
    t7 = clock;
    % Detect the blob
    O = (uint8(255*mat2gray(D)));
    level = graythresh(O);
    BW_1 = imbinarize(O, level);
    t8 = clock;
end
t_consumed = (t2 - t1) + (t4 - t3) + (t6 - t5) + (t8 - t7);
t_consumed = 365*24*60*60*t_consumed(1) + 30*24*60*60*t_consumed(2) + 24*60*60*t_consumed(3) + 60*60*t_consumed(4) + 60*t_consumed(5) + t_consumed(6);

set(handles.text21,'String',[num2str(t_consumed), 's']);

%%
if get(handles.radiobutton6,'value')
    % manual_flag = 1;
    handles.ignore_edge_flag = 1;
end
guidata(hObject,handles);

if get(handles.radiobutton7,'value')
    % manual_flag = 0;
    handles.ignore_edge_flag = 0;
end
guidata(hObject,handles);

handles = guidata(hObject);
ignore_edge_flag = handles.ignore_edge_flag;

if ignore_edge_flag
    ign_wid = get(handles.edit3, 'String');
    if ign_wid == '5'
        ign_wid = 5;
    else
        ign_wid = str2num(ign_wid);
    end
    mask = zeros(size(BW_1));
    mask((1 + ign_wid):(size(BW_1, 1) - ign_wid), (1 + ign_wid):(size(BW_1, 2) - ign_wid)) = 1;
    BW_1 = mask .* double(BW_1);
end

%%
if get(handles.radiobutton5,'value')
    % manual_flag = 1;
    handles.isolate_flag = 1;
end
guidata(hObject,handles);

if get(handles.radiobutton4,'value')
    % manual_flag = 0;
    handles.isolate_flag = 0;
end
guidata(hObject,handles);

handles = guidata(hObject);
isolate_flag = handles.isolate_flag;

if isolate_flag
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(BW_1, []);
    guidata(hObject,handles);
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    guidata(hObject,handles);
    handles.detectResults = BW_1;
    guidata(hObject,handles);
else
    original_img = I;
    orig_img_g = original_img; 
    orig_img_b = original_img;
    mask_img = BW_1;
    mask_img_g = zeros(size(mask_img));
    mask_ing_b = zeros(size(mask_img));
    g1 = cat(3, mask_img, mask_img_g, mask_ing_b);
    g2 = cat(3, original_img, orig_img_g, orig_img_b);
    g3 = imadd(30 * uint8(g1), g2);
    cla(handles.axes2);
    axes(handles.axes2);
    imshow(g3);
    guidata(hObject,handles);
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    guidata(hObject,handles);
    handles.detectResults = g3;
    guidata(hObject,handles);
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f, p]=uiputfile({'*.jpg'},'Save Weight Image');
if isequal(f, 0) || isequal(p, 0) 
    return;
else
    fpath=fullfile(p, f);
end
% pix = getframe(handles.axes2);  % 如此提取图片分辨率较低
% imwrite(pix.cdata, fpath, 'jpg'); % 如此提取图片分辨率较低
handles = guidata(hObject);
detectResults = handles.detectResults;
imwrite(detectResults, fpath, 'jpg');

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton4,'value',1);
set(handles.radiobutton5,'value',0);

% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5
set(handles.radiobutton5,'value',1);
set(handles.radiobutton4,'value',0);

% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton6
set(handles.radiobutton6,'value',1);
set(handles.radiobutton7,'value',0);

% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7
set(handles.radiobutton7,'value',1);
set(handles.radiobutton6,'value',0);


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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text27.
function text27_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit4,'String','3');
set(handles.edit2,'String','2');
set(handles.edit1,'String','4');
set(handles.edit3,'String','5');
