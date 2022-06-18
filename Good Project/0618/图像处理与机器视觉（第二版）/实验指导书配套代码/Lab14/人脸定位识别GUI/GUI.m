function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)


% ��ʾfigure���
flag = 1;
% ��ȡͼƬ���ļ��б�
    Img =getimage(handles.axes1);
    % ͼ��Ԥ����
    [Im1, rectValide] = GetValideImage(Img, 0);%�Զ���ĺ���
    % ��������λ
    [hsv,erzhi,bw1,BW2] = GetFaceAreaImg(Im1, 0);
        axes(handles.axes2); imshow(hsv, []); title('hsv�ռ�ͼ��');
          axes(handles.axes3); imshow(erzhi, []); title('��ֵ��ͼ��');
        axes(handles.axes4); imshow(bw1); title('��̬ѧ����ͼ��');
         axes(handles.axes5); imshow(BW2, []); title('����ɸѡ����ͼ��');
         
         %�������
         bwimage = BW2;
         [L,nm] = bwlabel(bwimage,8);%�ҳ�ͼ���еİ���ͨ������Ϊ�ַ���������
axes(handles.axes6);%%ʹ��ͼ�񣬲���������6
imshow( Img);%������axes6��ʾ
title('��λ');
for i =1:nm
%     stats = regionprops(L);
%     Ar = cat(1, stats.Area);
%     ind = find(Ar ==max(Ar));%�ҵ������ͨ����ı��
    [r,c] = find(L ==i);
    left= min(c);%��߽�
    right= max(c);%�ұ߽�
    top= min(r);%�ϱ߽�
    buttom= max(r);%�±߽�
    width=right - left + 1;%���
    height = buttom - top + 1;%�߶�
    rectangle('Position',[left,top,width,height],'EdgeColor','r');%����ͨ����б��
    cropimage = imcrop(Img,[left,top,width,height]);%ͼ��ü�
    cropgray =rgb2gray(cropimage);
    cropgray = imresize(cropgray,[110,90])
    imwrite(cropgray,'�����ָ�.bmp');
    pause(0.01);
end
       
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



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


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
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


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%��ͼ�����
[filename,pathname]=uigetfile({'*.*';'*.bmp';'*.jpg';'*.tif';'*.jpg'},'ѡ��ͼ��');
if isequal(filename,0)||isequal(pathname,0)
  errordlg('��ѡ��ͼƬ','��ʾ');%���û�����룬�򴴽�����Ի��� 
  return;
else
    global im;
    im=[pathname,filename];%�ϳ�·��+�ļ���
    image=imread(im);%��ȡͼ��
    global m n k;
    [m n k]=size(image);
    set(handles.axes1,'HandleVisibility','ON');%�����꣬�������
    axes(handles.axes1);%%ʹ��ͼ�񣬲���������1
    imshow(image);%������axes1��ʾԭͼ�� 
    title('ԭʼͼ��');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%��ȡPCA��������
global reference;%ȫ�ֱ���
global base;
global imgmean;
imgdata=[];%ѵ��ͼ�����
for i=1:5
  for j=1:5
    a=imread(strcat('.\train\s',num2str(i),'\',num2str(j),'.bmp'));
%     name = strcat('.train\0',num2str(i),'-',num2str(j),'m.jpg');
%     b=a(1:112*92); % b����ʸ�� 1��N������N��10304
    b=a(1:110*90); % b����ʸ�� 1��N������N��10304
    b=double(b);
    imgdata=[imgdata; b]; % imgdata ��һ��M * N ����imgdata��ÿһ������һ��ͼƬ��M��200
  end;
end;
imgdata=imgdata'; %ÿһ��Ϊһ��ͼƬ
imgmean=mean(imgdata,2); % ƽ��ͼƬ��Nά������
for i=1:25
  minus(:,i) = imgdata(:,i)-imgmean; % minus��һ��N*M������ѵ��ͼ��ƽ��ͼ֮��Ĳ�ֵ
end;

covx=minus'* minus; % M * M ��Э�������
[COEFF, latent,explained] = pcacov(covx'); %PCA����Э��������ת���������Լ�С������

%ѡ�񹹳�95%������������ֵ
i=1;
proportion=0;
while(proportion < 95)
  proportion=proportion+explained(i);
  i=i+1;
end;
p=i-1;

% ѵ���õ�����������ϵ
i=1;
while (i<=p && latent(i)>0)
  base(:,i) = latent(i)^(-1/2)*minus * COEFF(:,i); % base��N��p�׾�����������ͶӰ������latent(i)^(1/2)�Ƕ�����ͼ��ı�׼��
  i = i + 1;
end

% ��ѵ������������ϵ�Ͻ���ͶӰ,�õ�һ�� p*M �׾���Ϊ�ο�
reference = base'*minus;
msgbox('������ȡ���');


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%%����ʶ�������С���뷨
global reference;
global base;
global imgmean;
a=imread('�����ָ�.bmp');
b=a(1:9900);
b=double(b);
b=b';

object = base'*(b-imgmean);
distance=100000;

%��С���뷨��Ѱ�Һʹ�ʶ��ͼƬ��Ϊ�ӽ���ѵ��ͼƬ
for k=1:25
    temp= norm(object - reference(:,k));
    if (distance > temp)
        which = k;
        distance = temp;
    end;
end;
temp1 = which/5;
temp1 = ceil(temp1);
switch temp1
    case 1
        set(handles.edit3,'string','������');
          case 2
        set(handles.edit3,'string','����');
         case 3
        set(handles.edit3,'string','����');
              case 4
        set(handles.edit3,'string','�����Ȱ�');
              case 5
        set(handles.edit3,'string','���»�');
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
