function varargout = MainForm(varargin)
% MAINFORM MATLAB code for MainForm.fig
%      MAINFORM, by itself, creates a new MAINFORM or raises the existing
%      singleton*.
%
%      H = MAINFORM returns the handle to a new MAINFORM or the handle to
%      the existing singleton*.
%
%      MAINFORM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFORM.M with the given input arguments.
%
%      MAINFORM('Property','Value',...) creates a new MAINFORM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MainForm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MainForm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MainForm

% Last Modified by GUIDE v2.5 28-Jun-2013 10:42:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @MainForm_OpeningFcn, ...
    'gui_OutputFcn',  @MainForm_OutputFcn, ...
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


% --- Executes just before MainForm is made visible.
function MainForm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MainForm (see VARARGIN)

% Choose default command line output for MainForm
handles.output = hObject;
clc;
set(handles.axes1, 'Box', 'on', 'Color', 'c', 'XTickLabel', '', 'YTickLabel', '');
set(handles.axes2, 'Box', 'on', 'Color', 'c', 'XTickLabel', '', 'YTickLabel', '');
axes(handles.axes3)    
set(gca,'xtick',[]);
set(gca,'ytick',[]);
set(gca,'color','c');
ii = imread('background.png');
imshow(ii);
set(handles.text4, 'String', '');
handles.fileurl = 0;
handles.Img = 0;
handles.Imgbw = 0;
handles.Ti = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MainForm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MainForm_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function varargout = pushbutton1_CreateFcn(hObject, eventdata, handles)

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ????????
file = fullfile(pwd, 'test/????.jpg');
[Filename, Pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*','All Files' }, '??????????????',...
    file);
if isequal(Filename, 0) || isequal(Pathname, 0)
    return;
end
% ????????
axes(handles.axes1); cla reset;
axes(handles.axes2); cla reset;
set(handles.axes1, 'Box', 'on', 'Color', 'c', 'XTickLabel', '', 'YTickLabel', '');
set(handles.axes2, 'Box', 'on', 'Color', 'c', 'XTickLabel', '', 'YTickLabel', '');
set(handles.text4, 'String', '');
% ????
fileurl = fullfile(Pathname,Filename);
Img = imread(fileurl);
imshow(Img, [], 'Parent', handles.axes1);
set(handles.text2, 'String', '??????????');
handles.fileurl = fileurl;
handles.Img = Img;
guidata(hObject, handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Img, 0)
    return;
end
Img = handles.Img;
% ????????????
hsv = rgb2hsv(Img);
h = hsv(:, :, 1);
s = hsv(:, :, 2);
v = hsv(:, :, 3);
% ??????????
bw1 = h > 0.16 & h < 0.30;
bw2 = s > 0.65 & s < 0.80;
bw = bw1 & bw2;
% ??????????
Imgr = Img(:, :, 1);
Imgg = Img(:, :, 2);
Imgb = Img(:, :, 3);
Imgr(bw) = 255;
Imgg(bw) = 255;
Imgb(bw) = 255;
% ????????
Imgbw = cat(3, Imgr, Imgg, Imgb);
imshow(Imgbw, [], 'Parent', handles.axes2);
set(handles.text3, 'String', '??????????????');
handles.Imgbw = Imgbw;
guidata(hObject, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Imgbw, 0)
    return;
end
Imgbw = handles.Imgbw;
% ??????
Ig = rgb2gray(Imgbw);
% ??????
Ibw = im2bw(Ig, 0.8);

% ????????
sz = size(Ibw);
cs = sum(Ibw, 1);
mincs = min(cs);
maxcs = max(cs);
masksize = 16;

% ??????
S1 = []; E1 = [];
% 1??????????2????????
flag = 1;
s1 = 1;
tol = maxcs;

while s1 < sz(2)
    for i = s1 : sz(2)
        % ????????
        s2 = i;
        if cs(s2) < tol && flag == 1
            % ????????????
            flag = 2;
            S1 = [S1 s2-1];
            break;
        elseif cs(s2) >= tol && flag == 2
            % ????????????
            flag = 1;
            E1 = [E1 s2];
            break;
        end
    end
    s1 = s2 + 1;
end
% ????????
Ibw = ~Ibw;
% ????????
Ibw = bwmorph(Ibw, 'thin', inf);
for i = 1 : length(S1)
    % ????????
    Ibwi = Ibw(:, S1(i):E1(i));
    % ????????
    [L, num] = bwlabel(Ibwi);
    stats = regionprops(L);
    Ar = cat(1, stats.Area);
    [maxAr, ind_maxAr] = max(Ar);
    recti = stats(ind_maxAr).BoundingBox;
    recti(1) = recti(1) + S1(i) - 1;
    recti(2) = recti(2);
    recti(3) = recti(3);
    recti(4) = recti(4);
    Rect{i} = recti;
    % ????????
    Ibwi = imcrop(Ibw, recti);
    rate = masksize/max(size(Ibwi));
    Ibwi = imresize(Ibwi, rate, 'bilinear');
    ti = zeros(masksize, masksize);
    rsti = round((size(ti, 1)-size(Ibwi, 1))/2);
    csti = round((size(ti, 2)-size(Ibwi, 2))/2);
    ti(rsti+1:rsti+size(Ibwi,1), csti+1:csti+size(Ibwi,2))=Ibwi;
    % ????
    Ti{i} = ti;
end
imshow(Ibw, [], 'Parent', handles.axes2); hold on;
for i = 1 : length(Rect)
    rectangle('Position', Rect{i}, 'EdgeColor', 'r', 'LineWidth', 2);
end
hold off;
set(handles.text3, 'String', '??????????????');
handles.Ti = Ti;
guidata(hObject, handles);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Ti, 0)
    return;
end
% ????????????
Ti = handles.Ti;
It = [];
spcr = ones(size(Ti{1}, 1), 3)*255;
spcg = ones(size(Ti{1}, 1), 3)*0;
spcb = ones(size(Ti{1}, 1), 3)*0;
spc = cat(3, spcr, spcg, spcb);
% ??????????
It = [It spc];
for i = 1 : length(Ti)
    ti = Ti{i};
    ti = cat(3, ti, ti, ti);
    ti = im2uint8(mat2gray(ti));
    It = [It ti spc];
end
imshow(It, [], 'Parent', handles.axes2); hold on;
set(handles.text3, 'String', '????????????');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.Ti, 0)
    return;
end
Ti = handles.Ti;
% ????????
fileList = GetAllFiles(fullfile(pwd, 'Databse'));
Tj = [];
for i = 1 : length(fileList)
    filenamei = fileList{i};
    [pathstr, name, ext] = fileparts(filenamei);
    if isequal(ext, '.jpg')
        ti = imread(filenamei);
        ti = im2bw(ti, 0.5);
        ti = double(ti);
        % ??????????????????
        phii = invmoments(ti);
        % ????????
        OTj = [];
        for j = 1 : length(Ti)
            tij = double(Ti{j});
            phij = invmoments(tij);
            ad = norm(phii-phij);
            otij.filename = filenamei;
            otij.ad = ad;
            OTj = [OTj otij];
        end
        Tj = [Tj; OTj];
    end
end
% ????????
r = [];
for i = 1 : size(Tj, 2)
    ti = Tj(:, i);
    adi = cat(1, ti.ad);
    [minadi, ind] = min(adi);
    filenamei = ti(ind).filename;
    [pathstr, name, ext] = fileparts(filenamei);
    name = name(1);
    r = [r name];
end
set(handles.text4, 'String', r);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ??????????????????????
choice = questdlg('?????????????????????????????????????????????????????????', ...
    '????', ...
    '????','????','????');
switch choice
    case '????'
        prompt={'??????????????????:'};
        name='????????';
        numlines=1;
        defaultanswer={''};
        answer=inputdlg(prompt,name,numlines,defaultanswer);
        if isempty(answer)
            return;
        end
        if isequal(handles.fileurl, 0)
            return;
        end
        % ????
        fileurl = handles.fileurl;
        answer = answer{1};
        fileout = fullfile(pwd, sprintf('images/%s.jpg', answer));
        flag = 1;
        while 1
            if exist(fileout, 'file')
                fileout = fullfile(pwd, sprintf('images/%s_%d.jpg', answer, flag));
                flag = flag + 1;
            else
                copyfile(fileurl,fileout);
                msgbox(sprintf('????????????????????????????????%s', fileout), '????????', 'modal');
                break;
            end
        end
    case '????'
        return;
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% ????????
choice = questdlg('???????????????', ...
    '????', ...
    '????','????','????');
switch choice
    case '????'
        close;
    case '????'
        return;
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
GetDatabase();



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


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] =  uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
    '*.*','All Files' },'Save Image',...
    fullfile(pwd, 'screen.jpg'));
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
f = getframe(gcf);
f = frame2im(f);
imwrite(f, fullfile(PathName, FileName));
msgbox('??????????', '????????', 'modal');
