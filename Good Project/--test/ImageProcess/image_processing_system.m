function varargout = image_processing_system(varargin)
% IMAGE_PROCESSING_SYSTEM MATLAB code for image_processing_system.fig
%      IMAGE_PROCESSING_SYSTEM, by itself, creates a new IMAGE_PROCESSING_SYSTEM or raises the existing
%      singleton*.
%
%      H = IMAGE_PROCESSING_SYSTEM returns the handle to a new IMAGE_PROCESSING_SYSTEM or the handle to
%      the existing singleton*.
%
%      IMAGE_PROCESSING_SYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMAGE_PROCESSING_SYSTEM.M with the given input arguments.
%
%      IMAGE_PROCESSING_SYSTEM('Property','Value',...) creates a new IMAGE_PROCESSING_SYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before image_processing_system_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to image_processing_system_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help image_processing_system

% Last Modified by GUIDE v2.5 31-Mar-2021 17:08:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @image_processing_system_OpeningFcn, ...
                   'gui_OutputFcn',  @image_processing_system_OutputFcn, ...
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


% --- Executes just before image_processing_system is made visible.
function image_processing_system_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to image_processing_system (see VARARGIN)

% Choose default command line output for image_processing_system
  handles.output = hObject;
tu_biao1=importdata('����.jpg');%��33.jpg�ĳ���Ҫ���ӵ�ͼ�������
set(handles.pushbutton1,'CDATA',tu_biao1); 
tu_biao2=importdata('��.jpg');%��33.jpg�ĳ���Ҫ���ӵ�ͼ�������
set(handles.pushbutton3,'CDATA',tu_biao2); 





  guidata(hObject, handles);






% UIWAIT makes image_processing_system wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = image_processing_system_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ͼƬ
global im;
axes(handles.axes1);  
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},...
                'Pick an image',...
                'D:\matlab\bin\matlab work');  
str=[pathname filename];  
if isequal(filename,0)||isequal(pathname,0)  
    warndlg('Please select a picture first!','Warning');  
    return;  
else  
    im = imread(str); 
    imshow(im);    
end
axes(handles.axes1);%��axes�����趨��ǰ��������������axes1
fpath=[pathname filename];%���ļ�����Ŀ¼����ϳ�һ��������·��
imshow(imread(fpath));

% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)%����ͼƬ
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
if FileName==0  
    return;  
else  
    h=getframe(handles.axes2);   
    imwrite(h.cdata,[PathName,FileName]);  
end


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת�Ҷ�ͼ(�Զ���)
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
imrgb=im;
addition1=inputdlg('Rֵ����(0-1)��','��ɫ����');
addition2=cell2mat(addition1);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
a=addition3(1,1);%����ֵ
addition4=inputdlg('Gֵ����(0-1)��','��ɫ����');
addition5=cell2mat(addition4);%addition��ֵΪԪ����ת��Ϊ����
addition6=str2num(addition5);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition6(1,1);%����ֵ
[m,n,t]=size(imrgb);
for i=1:m
    for j=1:n
        for k=1:t
          imgray(i,j,k)=a*imrgb(i,j,1)+b*imrgb(i,j,2)+(1-a-b)*imrgb(i,j,3);%��Ȩʵ�ִ���ʵ��ҶȵĽ�άת��
         end
    end
end
imshow(imgray);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת����ͼ
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
addition=inputdlg('��ɫ���ࣺ','��ɫ����');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
[X1,map1]=rgb2ind(im,b);%��RGBͼ��ת��Ϊ����ͼ����ɫ����N����64��
imshow(X1);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת��ֵͼ
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
addition=inputdlg('��ֵ��0-1����','RGBͼת��ֵͼ');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
BW=im2bw(im,b);
imshow(BW);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���ԻҶȱ任
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
addition=inputdlg('���Զ�ȡֵ��','���Զ�ȡֵ');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
gamma=b;                            %�趨�������Զ�ȡֵ
I=im;                   			  %����Ҫ������ͼ�񣬲���ֵ��I
R=I;                                  %��ͼ�����ݸ�ֵ��R
R (:,:,2)=0;                          %��ԭͼ���ɵ�ɫͼ�񣬱�����ɫ
R(:,:,3)=0;
R1=imadjust(R,[0.5 0.8],[0 1],gamma); %���ú���imadjust����R�ĻҶȣ��������R1
G=I;								  %��ͼ�����ݸ�ֵ��G
G(:,:,1)=0;							  %��ԭͼ���ɵ�ɫͼ�񣬱�����ɫ
G(:,:,3)=0;
G1=imadjust(G,[0 0.3],[0 1],gamma);	  %���ú���imadjust����G�ĻҶȣ��������G1
B=I;								  %��ͼ�����ݸ�ֵ��B
B(:,:,1)=0;							  %��ԭͼ���ɵ�ɫͼ�񣬱�����ɫ
B(:,:,2)=0;
B1=imadjust(B,[0 0.3],[0 1],gamma);	  %���ú���imadjust����B�ĻҶȣ��������B1
I1=R1+G1+B1;                          %��任���RGBͼ��  
imshow(I1);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�ֶ����ԻҶȱ任
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
R=im;                   %����ԭͼ�񣬸�ֵ��R
J=rgb2gray(R);          %����ɫͼ������Rת��Ϊ�Ҷ�ͼ������J
[M,N]=size(J);          %��ûҶ�ͼ������J��������M��N
x=1;y=1;                %��������������x������������y    
for x=1:M
    for y=1:N
        if (J(x,y)<=35);     %�ԻҶ�ͼ��J���зֶδ�����������Ľ�����ظ�����H
            H(x,y)=J(x,y)*10;
        elseif(J(x,y)>35&J(x,y)<=75);
            H(x,y)=(10/7)*[J(x,y)-5]+50;
        else(J(x,y)>75);
            H(x,y)=(105/180)*[J(x,y)-75]+150;
        end
    end
end
set(0,'defaultFigurePosition',[100,100,1000,500]);%�޸�ͼ��ͼ��λ�õ�Ĭ������
set(0,'defaultFigureColor',[1 1 1])%�޸�ͼ�α�����ɫ������
imshow(H);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_18_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����ԻҶȱ任
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
R=im;                                       %����ͼ�񣬸�ֵ��R
G=rgb2gray(R);                              %ת�ɻҶ�ͼ��
J=double(G);                                %��������ת����˫����
H=(log(J+1))/10;                             %���л��ڳ��ö����ķ����ԻҶȱ任
set(0,'defaultFigurePosition',[100,100,1000,500]);%�޸�ͼ��ͼ��λ�õ�Ĭ������
set(0,'defaultFigureColor',[1 1 1])%�޸�ͼ�α�����ɫ������
imshow(H);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_19_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�ӷ�
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('������','�ӷ�');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
J=imadd(im,b);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_20_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('������','����');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
J=imsubtract(im,b);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�˷�
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('������','�˷�');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
J=immultiply(im,b);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_22_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('������','����');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
J=imdivide(im,b);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_23_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��������� (ͼ����ֵ�ֱ�Ϊ0.2��0.4������)
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('��ֵ��0-1����','ͼ��1');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
I1=im2bw(im,b);
addition=inputdlg('��ֵ��0-1����','ͼ��1');
addition4=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition5=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
c=addition5(1,1);%����ֵ
I2=im2bw(im,c);
I3=I1&I2;
imshow(I3);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_24_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��������� (ͼ����ֵ�ֱ�Ϊ0.2��0.4������)
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I1=im2bw(im,0.2);
I2=im2bw(im,0.4);
I3=I1|I2;
imshow(I3);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_25_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��������� 
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I1=im2bw(im);
I2=~I1;
imshow(I2);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_26_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_27_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ƽ��ͼ��
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=im; %����ͼ��
addition=inputdlg('�����꣺','������');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
a=addition3(1,1);%����ֵ������
addition=inputdlg('�����꣺','������');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ������
J1=move(I,a,b);%�ƶ�ԭͼ��
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);

function J=move(I,a,b) 
% ����һ����������move��I��ʾ����ͼ��a��b����Iͼ������x���y���ƶ��ľ���
% ������ƽ���Ժ�ͼ�����������Ҳ�����Ӧ��ĵط�����ֵΪ1
[M,N,G]=size(I);%��ȡ����ͼ��I�Ĵ�С
I=im2double(I); %��ͼ����������ת����˫����
J=ones(M,N,G);  %��ʼ����ͼ�����ȫΪ1����С������ͼ����ͬ
for i=1:M
    for j=1:N
        if((i+a)>=1&&(i+a<=M)&&(j+b>=1)&&(j+b<=N));%�ж�ƽ���Ժ����������Ƿ񳬳���Χ
            J(i+a,j+b,:)=I(i,j,:);%����ͼ��ƽ��
        end
    end
end

% --------------------------------------------------------------------
function Untitled_28_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����ͼ����С��ͼ��ʧһ����ԭͼ��Ϣ���Ŵ���ʹ��ͼ�����������
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
addition=inputdlg('���Ŵ�С��','������');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ������
J1=imresize(im,b);
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_30_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ת��ͼ��
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
J1=transp(im);
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);


function J=transp(I)
%I��ʾ�����ԭʼͼ��
%J��ʾ����ת���Ժ��ͼ��
[M,N,G]=size(I);%��ȡ����ͼ��I�Ĵ�С
I=im2double(I); %��ͼ����������ת����˫����
J=ones(N,M,G);  %��ʼ����ͼ�����ȫΪ1����С������ͼ����ͬ
for i=1:M
    for j=1:N
      J(j,i,:)=I(i,j,:);%����ͼ��ת��    
    end
end

% --------------------------------------------------------------------
function Untitled_31_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ת
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('��ת�Ƕȣ�','��ת');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
J=imrotate(im,b);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_32_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ˮƽ����
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
J1=mirror(im,1);
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);




function OutImage=mirror(InImage,n)
%mirror����ʵ��ͼ����任����
%����nΪ1ʱ��ʵ��ˮƽ����任
%����nΪ2ʱ��ʵ�ִ�ֱ����任
%����nΪ3ʱ��ʵ��ˮƽ��ֱ����任
I=InImage;
[M,N,G]=size(I);%��ȡ����ͼ��I�Ĵ�С
J=I;  %��ʼ����ͼ�����ȫΪ1����С������ͼ����
if (n==1)
    for i=1:M
        for j=1:N
            J(i,j,:)=I(M-i+1,j,:);%n=1,ˮƽ����
        end
    end;
elseif (n==2)
     for i=1:M
        for j=1:N
            J(i,j,:)=I(i,N-j+1,:);%n=2,��ֱ����
        end
     end    
elseif (n==3)
     for i=1:M
        for j=1:N
            J(i,j,:)=I(M-i+1,N-j+1,:);%n=3,ˮƽ��ֱ����
        end
     end
else
    error('����n���벻��ȷ��nȡֵ1��2��3')%n�������ʱ��ʾ
end
    OutImage=J;

    

% --------------------------------------------------------------------
function Untitled_33_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ֱ����
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
J1=mirror(im,2);
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_34_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ˮƽ��ֱ����
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
J1=mirror(im,3);
imshow(J1);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_35_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_36_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_37_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_38_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_43_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_43 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��˹��ͨ�˲���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);%�˲�������
N=2*size(I,2);%�˲�������
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
addition=inputdlg('��ֵͨ��','��ͨ�˲���');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
D0=addition3(1,1);%�����
D0=80;%��ͨ��ֹƵ��Ϊ80
H=double(D<=D0);%�����ͨ�˲���
J=fftshift(fft2(I,size(H,1),size(H,2)));%ʱ��ͼ��ת����Ƶ��
K=J.*H;%�˲�����
L=ifft2(ifftshift(K));%����Ҷ���任
L=L(1:size(I,1),1:size(I,2));
imshow(L);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_44_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_44 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%������˹��ͨ�˲���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);%�˲�������
N=2*size(I,2);%�˲�������
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u,v);
D=sqrt(U.^2+V.^2);
addition=inputdlg('��ֵͨ��','��ͨ�˲���');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
D0=addition3(1,1);%����ֵ
D0=50;%��ֹƵ��Ϊ50
n=6;%������˹�˲����Ľ���
H=1./(1+(D0./D).^(2*n));%����˲���
J=fftshift(fft2(I,size(H,1),size(H,2)));%ʱ��ͼ��ת��ΪƵ��
K=J.*H;%�˲�
L=ifft2(ifftshift(K));%Ƶ��ͼ��ת��Ϊʱ��
L=L(1:size(I,1),1:size(I,2));%������С
imshow(L);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_45_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_45 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����˲���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=im2double(im);
M=2*size(I,1);
N=2*size(I,2);
u=-M/2:(M/2-1);
v=-N/2:(N/2-1);
[U,V]=meshgrid(u, v);
D=sqrt(U.^2+V.^2);
D0=50;
W=30;
H=double(or(D<(D0-W/2), D>D0+W/2));
J=fftshift(fft2(I, size(H, 1), size(H, 2))); 
K=J.*H;
L=ifft2(ifftshift(K));
L=L(1:size(I,1), 1:size(I, 2));
imshow(L);
toc
time=toc;
set(handles.edit10,'string',time);




% --------------------------------------------------------------------
function Untitled_41_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_42_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_42 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_39_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�Ҷȱ任��ǿͼ��
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
M=stretchlim(I);%��ȡ�������
J=imadjust(I,M,[]);%�����Ҷȷ�Χ
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);



% --------------------------------------------------------------------
function Untitled_40_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ֱ��ͼ��ǿ��ֱ��ͼ�涨����
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
hgram=ones(1,256);
J=histeq(I,hgram);
imshow(uint8(J));
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_47_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_47 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����˲���Ĭ�ϣ�ƽ���˲�����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=im;
h=fspecial('average',3);%����3*3ƽ��ģ��
I2=imfilter(I,h,'corr','replicate');%ƽ���˲�
imshow(I2);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_48_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_48 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ֵ�˲���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
R=medfilt2(im(:,:,1));%%�죬��ֵ�˲�����ģ���С3*3
G=medfilt2(im(:,:,2));%%�̣���ֵ�˲�����ģ���С3*3
B=medfilt2(im(:,:,3));%%������ֵ�˲�����ģ���С3*3
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_49_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_49 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%������
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
R=ordfilt2(im(:,:,1),1,true(3));
G=ordfilt2(im(:,:,2),1,true(3));
B=ordfilt2(im(:,:,3),1,true(3));
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit10,'string',time);






% --------------------------------------------------------------------
function Untitled_50_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����Ӧ�˲�-ά���˲�
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
[R,noise1]=wiener2(im(:,:,1));%%�죬ά���˲�����3*3������ֵnoiseΪ����������
[G,noise2]=wiener2(im(:,:,2));%%�̣�ά���˲�����3*3������ֵnoiseΪ����������
[B,noise3]=wiener2(im(:,:,3));%%����ά���˲�����3*3������ֵnoiseΪ����������
W(:,:,1)=R;
W(:,:,2)=G;
W(:,:,3)=B;
imshow(W);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_51_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_51 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_63_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_63 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_71_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_71 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_77_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_77 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_82_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_82 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_83_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_83 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��λ��������
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I = im;
[a,b,c]=size(I);
for i=1:a
    for j=1:b        
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R>(G.*2)
           I(i,j)=I(i,j);
       else
        I(i,j,1)=255;
        I(i,j,2)=255;
        I(i,j,3)=255;
       end
    end
end
bw1=im2bw(I);
bw2=~bw1;
[L num] = bwlabel(bw2);
for i=1:num
   if numel(find(L==i)) < 1000
       bw2(L==i) =0;
   end
end 
bw3=~bw2;
[L1 num1] = bwlabel(bw3);
for j=1:num1
   if numel(find(L1==j)) <3000
       bw3(L1==j) =0;
   end
end 
[height,width]=size(bw3);
for i=1:height %%ѭ���н��з�ɫ
for j=1:width
    if bw3(i,j)==1
        bw3(i,j)=0;
    else bw3(i,j)=1;
    end 
end
end
[L,num]=bwlabel(bw3,8);
plot_x=zeros(1,num);%%���ڼ�¼����λ�õ�����
plot_y=zeros(1,num);
for k=1:num  %%num����������ͳ������λ��
    sum_x=0;sum_y=0;area=0;
    for i=1:height
    for j=1:width
       if L(i,j)==k
        sum_x=sum_x+i;
        sum_y=sum_y+j;
        area=area+1;   
       end
    end
    end
    plot_x(k)=fix(sum_x/area);
    plot_y(k)=fix(sum_y/area);
end
for i=1:num
    imshow(bw3);
hold on
plot(plot_y(i) ,plot_x(i), '*');
end
 hold off
y=plot_x;
x=plot_y;
str=[ '�����꣺',num2str(x),'�����꣺' num2str(y)];
helpdlg(str,'ʶ��Բ��');
toc
time=toc;
data=strcat({'�����꣺'},{num2str(x)},{'�����꣺'},{num2str(y)});
set(handles.edit10,'string',time);
set(handles.edit4,'string',data);
text={'������',x,'������',y};
% setappdata(handles.edit4,'avg',text); 
xlswrite('Բ������.xlsx',text,'A1');
% avg=[x y];
% setappdata(handles.edit4,'avg',text); 










% --------------------------------------------------------------------
function Untitled_84_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_84 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --------------------------------------------------------------------
function Untitled_86_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_86 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Բ��ʶ��
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
circleParaXYR=[];  
I = im;  
[m,n,l] = size(I);  
if l>1  
 I = rgb2gray(I);  
end  
BW = edge(I,'sobel');    
step_r = 1;  
step_angle = 0.1;  
minr=3; 
maxr=30;  
thresh=0.51;  
[hough_space,hough_circle,para] = hough_circlefu(BW,step_r,step_angle,minr,maxr,thresh);     
circleParaXYR=para;      
%���  
fprintf(1,'\n---------------Բͳ��----------------\n');  
[r,c]=size(circleParaXYR);%r=size(circleParaXYR,1);  
fprintf(1,'  ����%d��Բ\n',r);%Բ�ĸ���  
fprintf(1,'  Բ��     �뾶\n');%Բ�ĸ���  
for n=1:r  
fprintf(1,'%d ��%d��%d��  %d\n',n,floor(circleParaXYR(n,1)),floor(circleParaXYR(n,2)),floor(circleParaXYR(n,3)));  
end     
%���Բ  
imshow(I); 
hold on;  
plot(circleParaXYR(:,2), circleParaXYR(:,1), 'r+');  
for k = 1 : size(circleParaXYR, 1)  
t=0:0.01*pi:2*pi;  
x=cos(t).*circleParaXYR(k,3)+circleParaXYR(k,2);y=sin(t).*circleParaXYR(k,3)+circleParaXYR(k,1);  
plot(x,y,'r-');  
end       
R_max=maxr;  
acu=zeros(R_max);  
stor =[];  
for j=1:R_max  
  for n=1:r  
   if  j == floor(circleParaXYR(n,3))  
           acu(j)= acu(j)+1;  
    end  
  end  
stor=[stor;j,acu(j)];  
end  
    for j=1:R_max  
      if acu(j) > 0  
       fprintf(1,'%4d %8d\n',stor(j,1),stor(j,2));  
      end  
    end  
      
    fprintf(1,'----------------------------------------\n');  
hold off;
str=[ 'Բ��Ŀ����Ŀ��',num2str(n)];
helpdlg(str,'Բ��ʶ��');
% datas=para;
% set(handles.table1,datas);
toc
time=toc;
set(handles.edit10,'string',time);



data=strcat({'Բ��Ŀ����Ŀ��'},{num2str(n)});
set(handles.edit4,'string',data);
text1={'Բ��Ŀ����Ŀ��',n};
% xlswrite('Բ��Ŀ����Ŀ.xlsx',text1,'A1');









% --------------------------------------------------------------------
function Untitled_87_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_87 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ʶ����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
tu=im;
tu1=caijian(tu);%����������������
[y,x]=size(tu1);  
num=round((y*x)/150);  %ȡ�����������1/150��ֵ
tu2=qiege(tu1);   %�����������и�һ�£���ȥ���������Ҷ���ĵط����Ա���һ������
[word1, tu3]=fenli_left(tu2);  %�ü�����ߵ�һ���ַ��������ַ���
% subplot(2,2,4);imshow(tu3);
tu4=medfilt2(tu3,[3 3]);     %��ֵ�˲�
tu5=bwareaopen(tu4,num,8);   %ȥ���������1/150��������Ĳ���ͨ���򣨹��˵�����ڶ�λ�����λ�ַ��м�ĵ��Լ������ӵ㣩
tu6=medfilt2(tu5,[3 3]);     %�ٴ��˲�����ʡ�ԣ�
[word2,word3,word4,word5,word6,word7]=fenli(tu6); %��ʣ�µĳ���������вü��������ʣ�������ַ�����
str=shibie_cnn(word1,word2,word3,word4,word5,word6,word7); %���߸��ü��������ַ��������������ʶ�𣬵ó����
helpdlg(str,'���ƺ�');
hold off;
toc
time=toc;
set(handles.edit10,'string',time);
data=strcat({'���ƺţ�'},{str});
set(handles.edit10,'string',time);
set(handles.edit4,'string',data);
text={'���ƺţ�',str};
% xlswrite('����ʶ��.xlsx',text,'A1');





% --------------------------------------------------------------------
function Untitled_88_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_88 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_78_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_78 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���Ͳ���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('���ͽṹԪ��ֵ��','����');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
se=strel('disk',b);%�ṹԪ��ΪԲ�Σ���СΪ2
bw2=imdilate(BW,se);%���Ͳ���
imshow(bw2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_79_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_79 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ʴ����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('��ʴ�ṹԪ��ֵ��','��ʴ');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
se=strel('disk',b);%�ṹԪ��ΪԲ�Σ���СΪ2
bw2=imerode(BW,se);%���Ͳ���
imshow(bw2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_80_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_80 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%������
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',2);%�ṹԪ��ΪԲ�Σ���СΪ2
J=imopen(BW,se);%���Ͳ���
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_81_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_81 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�ղ���
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
se=strel('disk',2);%�ṹԪ��ΪԲ�Σ���СΪ2
J=imclose(BW,se);%���Ͳ���
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);



% --------------------------------------------------------------------
function Untitled_64_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_64 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_65_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_65 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����Ҷͼ��任
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
J=fft2(im);
K=abs(J/256);
imshow(uint8(K))
toc
time=toc;
set(handles.edit10,'string',time);




% --------------------------------------------------------------------
function Untitled_68_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_68 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Houghͼ��任
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=rgb2gray(im);
I=im2double(I);
BW=edge(I, 'canny');
[H, Theta, Rho]=hough(BW, 'RhoResolution', 0.5, 'ThetaResolution', 0.5);
set(0,'defaultFigurePosition',[100,100,1000,500]);
set(0,'defaultFigureColor',[1 1 1])
imshow(imadjust(mat2gray(H)));
axis normal;
colormap hot;
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_52_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_52 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_53_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_53 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_54_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_54 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_61_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_61 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_62_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_62 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ˮ��ָ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=im2bw(im);
J=watershed(I,4);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_58_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_58 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ȫ����ֵ�ָ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
% K=I*0;
[width, height]=size(I);
for i=1:width
    for j=1:height
        if (I(i, j)>50)
            K(i, j)=1;
        else 
            K(i, j)=0;
        end
    end
end
imshow(K);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_59_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_59 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Otsu��ֵ�ָ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
T=graythresh(im);
J=im2bw(im,T);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_60_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_60 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����ʽ��ֵ�ָ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=im2double(im);
T0=0.01;
T1=(min(I(:))+max(I(:)))/2;
r1=find(I>T1);
r2=find(I<=T1);
T2=(mean(I(r1))+mean(I(r2)))/2;
while abs(T2-T1)<T0
    T1=T2;
    r1=find(I>T1);
    r2=find(I<=T1);
    T2=(mean(I(r1))+mean(I(r2)))/2;
end
J=im2bw(I, T2);
imshow(J);
toc
time=toc;
set(handles.edit10,'string',time);








% --------------------------------------------------------------------
function Untitled_55_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_55 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_56_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_56 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%canny����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'canny');
imshow(BW2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_57_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_57 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Laplacian��Gauss����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'log');
imshow(BW2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_89_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_89 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Roberts����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'roberts');
imshow(BW2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_90_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%prewitt����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'prewitt');
imshow(BW2);
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_91_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_91 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Sobel����
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
BW2=edge(BW,'sobel');
imshow(BW2);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_92_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_92 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Radon���任
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('������Ƕȣ�','Radon�任');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
b=0:10:180;
[R,xp]=radon(BW,b);
imagesc(b,xp,R);
toc
time=toc;
set(handles.edit10,'string',time);

% --% imshow(J);------------------------------------------------------------------
function Untitled_93_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_93 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Radon���任
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
BW=im2bw(im);
addition=inputdlg('������Ƕȣ�','Radon�任');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
[R,xp]=iradon(BW,b);
imagesc(b,xp,R);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_94_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_94 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�Ҷ�ֱ��ͼ
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
I=rgb2gray(im);
imhist(I);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_95_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_95 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%٤��任
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
addition=inputdlg('٤��ֵ��','٤��ֵ');
addition2=cell2mat(addition);%addition��ֵΪԪ����ת��Ϊ����
addition3=str2num(addition2);%addition2��ֵΪ���֣�ת��Ϊ��ֵ
b=addition3(1,1);%����ֵ
R=imadjust(im(:,:,1),[],[],b);
G=imadjust(im(:,:,2),[],[],b);
B=imadjust(im(:,:,3),[],[],b);
K1(:,:,1)=R;
K1(:,:,2)=G;
K1(:,:,3)=B;
imshow(K1);
toc
time=toc;
set(handles.edit10,'string',time);
% --------------------------------------------------------------------
function Untitled_85_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_85 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��С��Ӿ��Σ����ձ߳����㣩
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
RGB =im;
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);
% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');
ed=edge(bw);
imshow(ed)
%������ͼ���ֵ�� ����������ֵ��ͼ��
L = bwlabel(bw);
L1 = bwlabel(ed);
Ar=zeros(1,max(L(:)));
perimeter=zeros(1,max(L1(:)));
metric=zeros(1,max(L1(:)));
Pwl=zeros(1,max(L1(:)));
Pr=zeros(1,max(L1(:)));
for i=1:max(L(:))
Ar(i)=sum(bw(L==i));
perimeter(i)=sum(ed(L==i));
metric(i) = 4*pi*Ar(i)/perimeter(i)^2;
[r,c]=find(L==i);
% 'a'�ǰ���������С���Σ�������߳���'p'
[rectx,recty,area,perimeter] = minboundrect(c,r,'p'); 
hold on
line(rectx,recty);
end
hold off
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_96_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_96 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Ŀ���������(��������Ϊ��)
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
g=im;
SE=strel('disk',4);  % ��̬�ṹԪ��
X1=imerode(g,SE);  % ��ֵͼ��ʴ
I=imdilate(X1,SE); % ��ֵͼ������
BG=imopen(I,strel('disk',10));
I2=imsubtract(I,BG);    % �������� ��һ��ͼ���м�ȥ��һ��ͼ����ͼ���м�ȥ����
level=graythresh(I2);   % �ҹ� ����otsu������ȫ��ͼ����ֵ
bw2=imbinarize(I2,level);  % ������ֵ��ͼ��ת��Ϊ��ֵͼ��
[labeled,numObjects]=bwlabel(bw2,8);
max(max(labeled))
f=bw2;
[L,n]= bwlabel(f);  
[r,c]=find(L==3);   % Ȼ������r��C��Ϊ�����mean����������ö�������ġ�
rbar = mean(r);
cbar = mean(c);   
    % ����ʹ��һ��ѭ�����������ʾͼ����ȫ����������ġ�
    % Ϊ��ʹ���ĵ�����ͼ����ʱ�ɿ��������ģ����ǽ�ʹ������Ϊ��ɫ��*�����ŵĺ�ɫԲ�������ʾ��������ʾ��
imshow(f);
hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkeRFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
       end
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % ��ע���
    end
    hold on    % So later plotting commands plot on top of the image.
    for k = 1:n
        [r,c]= find(L == k);
        rbar = mean(r);
        cbar = mean(c);
        plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
        plot(cbar,rbar,'Marker','*','MarkerEdgeColor','w');     % ��ע*
        text(cbar,rbar,num2str(k),'Color','red','FontSize',14); % ��ע���
    end
    hold off;
toc
time=toc;
set(handles.edit10,'string',time);
str=['Ŀ��������Ŀ��' num2str(n)];
helpdlg(str,'�������');
data=strcat({'Ŀ��������Ŀ��'},{num2str(n)});
set(handles.edit4,'string',data);
text1={'Ŀ��������Ŀ��',n};
% xlswrite('Ŀ��������Ŀ.xlsx',text1,'A1');






% data=strcat({'Ŀ��������Ŀ��'},n);
% set(handles.edit10,'string',time);
% set(handles.edit4,'string',data);
% text={'Ŀ��������Ŀ��',str};
% xlswrite('Ŀ��������Ŀ.xlsx',text,'A1');









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


% --- Executes when entered data in editable cell(s) in table1.
function table1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_97_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_97 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_98_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_98 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% % --------------------------------------------------------------------
function Untitled_99_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_99 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%���������
% warning off       %ȡ������
% feature jit off   %����ͨ��
% global im
% tic
% axes(handles.axes2);
% %����豸��Ϣ
% global obj
% % load ans.mat��
% % load obj.mat��
% imaqhwinfo
% % obj=imaq.VideoDevice('winvideo',1,'YUY2_640x480');
% global obj
% obj = videoinput('winvideo');
% set(obj, 'FramesPerTrigger', 1);
% set(obj, 'TriggerRepeat', Inf);
% %����һ����ؽ���
% hf = figure('Units', 'Normalized', 'Menubar', 'None','NumberTitle', 'off', 'Name', 'ʵʱ����ϵͳ');
% ha = axes('Parent', hf, 'Units', 'Normalized', 'Position', [0.05 0.2 0.85 0.7]);
% axis off
% %����������ť�ؼ�
% hb1 = uicontrol('Parent', hf, 'Units', 'Normalized','Position', [0.25 0.05 0.2 0.1], 'String', 'Ԥ��', 'Callback', ['objRes = get(obj, ''VideoResolution'');' ...
%      'nBands = get(obj, ''NumberOfBands'');' ...
%      'hImage = image(zeros(objRes(2), objRes(1), nBands));' ...
%      'preview(obj, hImage);']);
% hb2 = uicontrol('Parent', hf, 'Units', 'Normalized','Position', [0.55 0.05 0.2 0.1], 'String', '����', 'Callback', 'imwrite(getsnapshot(obj), ''im.jpg'')');
Camera_GUI







% % --------------------------------------------------------------------
% function Untitled_100_Callback(hObject, eventdata, handles)
% % hObject    handle to Untitled_100 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% %����׷��
% warning off       %ȡ������
% feature jit off   %����ͨ��
% global im
% tic
% axes(handles.axes2);
% vid=imaq.VideoDevice('winvideo',1,'YUY2_640x480');
% set(vid,'ReturnedColorSpace','rgb');
% boxInserter=vision.ShapeInserter('BorderColor','Custom','CustomBorderColor',[255 255 0]);
% videoPlayer=vision.VideoPlayer();
% faceDetector=vision.CascadeObjectDetector();
% 
% 
% 
% for i=1:3000000
%     videoFrame=step(vid);
%     bbox=step(faceDetector,videoFrame);
%     videoFrame=insertShape(videoFrame,'Rectangle',bbox);
%     videoOut=step(boxInserter,videoFrame,bbox);
%     step(videoPlayer,videoOut);
% end
% button=questdlg('��ȷ���˳���','�˳�����','Yes','No','Yes');%���ݣ����⣬ѡ�Ĭ��ѡ��
% if strcmp(button,'Yes')
% %       delete(hObject);
% clc;
% clear;
% 
%  end


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: delete(hObject) closes the figure
% delete(hObject);
button=questdlg('��ȷ���˳���','�˳�����','Yes','No','Yes');%���ݣ����⣬ѡ�Ĭ��ѡ��
if strcmp(button,'Yes')
      delete(hObject);
      clc;
      clear;
end


% --------------------------------------------------------------------
function Untitled_101_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_101 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%%  ��������
data=getappdata(handles.edit4,'avg');%�����ֵ����
data = num2str(data);%����ת���ַ���
[FileName PathName]=uiputfile({
    '*.txt','Txt Files(*.txt)';'*.*','All Files(*.*)'},'choose a File');%pathname��ȡ��������·����filename��ȡ������������
str= [PathName FileName]
% set(handles.edit10,'string',str);
% m=get(handles.displayArea,'String')
fid = fopen(char(str), 'w');
fwrite(fid, '', 'integer*4')
% strRec = ['data',','];
fprintf(fid,'%s',data);
% fprintf(fid,'%s',data);
fclose(fid)






% --------------------------------------------------------------------
function Untitled_102_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_102 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_103_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_103 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת��ֵͼ��Ĭ�ϣ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
BW=im2bw(im);
imshow(BW);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_104_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_104 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_105_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_105 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת����ͼ��Ĭ�ϣ�
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
[X1,map1]=rgb2ind(im,64);%��RGBͼ��ת��Ϊ����ͼ����ɫ����N����64��
imshow(X1);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_107_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_107 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_108_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_108 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%RGBͼת�Ҷ�ͼ
warning off       %ȡ������
feature jit off   %����ͨ��
tic
global im
axes(handles.axes2);
I=rgb2gray(im);
imshow(I);
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_109_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_109 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_111_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_111 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_110_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_110 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��С��Ӿ��Σ�����������㣩
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
RGB =im;
I = rgb2gray(RGB);
threshold = graythresh(I);
bw = im2bw(I,threshold);
% remove all object containing fewer than 30 pixels
bw = bwareaopen(bw,30);
% fill a gap in the pen's cap
se = strel('disk',2);
bw = imclose(bw,se);
% fill any holes, so that regionprops can be used to estimate
% the area enclosed by each of the boundaries
bw = imfill(bw,'holes');
ed=edge(bw);
imshow(ed)
%������ͼ���ֵ�� ����������ֵ��ͼ��
L = bwlabel(bw);
L1 = bwlabel(ed);
Ar=zeros(1,max(L(:)));
perimeter=zeros(1,max(L1(:)));
metric=zeros(1,max(L1(:)));
Pwl=zeros(1,max(L1(:)));
Pr=zeros(1,max(L1(:)));
for i=1:max(L(:))
Ar(i)=sum(bw(L==i));
perimeter(i)=sum(ed(L==i));
metric(i) = 4*pi*Ar(i)/perimeter(i)^2;
[r,c]=find(L==i);
% 'a'�ǰ���������С���Σ�������߳���'p'
[rectx,recty,area,perimeter] = minboundrect(c,r,'a'); 
hold on
line(rectx,recty);
end
hold off
toc
time=toc;
set(handles.edit10,'string',time);



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_112_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_112 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record_video


% --- Executes during object creation, after setting all properties.
function axes5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes5

% function untitled1_OpeningFcn(hObject,eventdata,handles,varargin)
% handles.output=hObject;
% tu_biao=importdata('����.png');%��33.jpg�ĳ���Ҫ���ӵ�ͼ�������
% set(handles.pushbutton1,'CDATA',tu_biao);
% guidata(hObject,handles)




% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% tu_biao=importdata('����.png');%��33.jpg�ĳ���Ҫ���ӵ�ͼ�������
% set(handles.pushbutton1,'CDATA',tu_biao);
[FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
                                 '*.bmp','Bitmap(*.bmp)';...  
                                 '*.gif','GIF(*.gif)';...  
                                 '*.*',  'All Files (*.*)'},...  
                                 'Save Picture','Untitled');  
if FileName==0  
    return;  
else  
    h=getframe(handles.axes2);   
    imwrite(h.cdata,[PathName,FileName]);  
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��ͼƬ
global im;
axes(handles.axes1);  
[filename,pathname]=uigetfile({'*.bmp;*.jpg;*.png;*.jpeg;*.tif'},...
                'Pick an image',...
                'D:\matlab\bin\matlab work');  
str=[pathname filename];  
if isequal(filename,0)||isequal(pathname,0)  
    warndlg('Please select a picture first!','Warning');  
    return;  
else  
    im = imread(str); 
    imshow(im);    
end
axes(handles.axes1);%��axes�����趨��ǰ��������������axes1
fpath=[pathname filename];%���ļ�����Ŀ¼����ϳ�һ��������·��
imshow(imread(fpath));


% --------------------------------------------------------------------
function Untitled_113_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_113 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ROI����ѡȡ
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
% [x,y,c]=ginput(2);
% if c==1
% BB=imcrop(im,[min(x(1),x(2)),min(y(1),y(2)),abs(x(2)-x(1)),abs(y(2)-y(1))]);
im1=imcrop();
axes(handles.axes2);
imshow(im1)
% axes(handles.axes2); %��Ľ�ͼ����GUI�е�axes2��
% end
% imshow(BB)
toc
time=toc;
set(handles.edit10,'string',time);

% --------------------------------------------------------------------
function Untitled_114_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_114 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
% img = imread('11.jpg');
p=size(im,3);
if p==3
r=im(:,:,1);
g=im(:,:,2);
b=im(:,:,3);
I1=rgb2gray(im);
else
    I1=im;
end
hold on
[x,y,c]=ginput(1);
m(1)=x;
n(1)=y;
plot(x,y,'r');
k=2;
while(c==1)
    [x1,y1,c1]=ginput(1);
    if c1==1
    m(k)=x1;
    n(k)=y1;
    plot(x,y,'r');
    line([m(k-1) m(k)],[n(k-1) n(k)]);
    k=k+1;
    c=c1;
    else
        break
    end
end
line([m(k-1) m(1)],[n(k-1) n(1)]);
BW = roipoly(I1,m,n); 
if p==3
    r1=double(r).*double(BW);
    g1=double(g).*double(BW);
    b1=double(b).*double(BW);
    i1=cat(3,r1,g1,b1);
%     figure
%     imshow(mat2gray(i1));
% else 
%     i2=double(I1).*double(BW);
% %     figure
%     imshow(mat2gray(i2));
end
% im1=imcrop();

axes(handles.axes2);
imshow(mat2gray(i1))
hold off
toc
time=toc;
set(handles.edit10,'string',time);


% --------------------------------------------------------------------
function Untitled_115_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_115 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off       %ȡ������
feature jit off   %����ͨ��
global im
tic
axes(handles.axes2);
ii = 1;
% Add path
addpath(genpath('Image\'));
addpath(genpath('C:\Users\Administrator\Desktop\ͼ����ϵͳAPP����\��������lbf\Multi_LBF solver\'));
% save result path
SaveFilePath = 'Results\';

% Read Image
c0 = 2;
imgID = 6;

Img = im;
Temp = Img;

if ndims(Img) == 3
    Img = rgb2gray(Img);
end
Img = double(Img);
% Initial phi is the level set function
switch imgID
    case 1
        phi= ones(size(Img(:,:,1))).*c0;
        a=43;b=51;c=20;d=28;
        phi(a:b,c:d) = -c0;
        figure;
        imshow(Temp);colormap;
        hold on;
        [c,h] = contour(phi, 0, 'r');
        hold off;
    case 2
        [m,n] = size(Img(:,:,1));
        a=m/2; b=n/2; r=min(m,n)/4;%set the radius
        phi= ones(m,n).*c0;
        phi(a-r:a+r,b-r:b+r) = -c0;
        imshow(Temp);colormap;
        hold on;
        [c,h] = contour(phi, 0, 'r');
        hold off;
    case 3
        figure;
        imshow(Temp);colormap;
        text(6,6,'Left click to get points, right click to get end point','FontSize',12,'Color', 'g');
        BW=roipoly;     %BW is mask
        phi=c0*2*(0.5-BW);
        hold on;
        [c,h] = contour(phi,[0 0],'r');
        hold off;
    case 4
        figure;
        imshow(Temp);colormap;
        rNum = 1;% the cicle number in a row
        cNum = 1;% the cicle number in a colcumn
        [m,n] = size(Img);
        phi= ones(m,n).*c0;
        r = min(m/(2*rNum),n/(2*cNum))/2;
        for i = 1:rNum
            for j = 1:cNum
                px = (2*i-1)*(m/(2*rNum));
                py = (2*j-1)*(n/(2*cNum));%(px,py) is the centre of the initial zero level set cicle
                phi(max(1,px - r):min(size(Img,1),px + r),max(1,py-r):min(size(Img,2),py+r)) = -c0; 
            end%for j
        end%for i
        hold on;
        [c,h] = contour(phi,[0 0],'r');
        hold off;
    case 5
        % �������λ��
        figure;
%         imshow(Temp);
        colormap;
        rand('seed',0);
        boardsize = 20; %����߽��λ��
        
        r = 10; %����Բ��ʱΪ�뾶����������ʱΪ(1/2)*�߳�
        if r > boardsize
            r = boardsize;
        end
        possiblex = (boardsize + 1): (size(Img,1) - boardsize);
        possibley = (boardsize + 1): (size(Img,2) - boardsize);
        labelx = randperm(length(possiblex));
        labely = randperm(length(possibley));
        centrex = possiblex(labelx(1));
        centrey = possibley(labely(1));
        [m,n] = size(Img);
        phi= -ones(m,n).*c0;  
        phi(max(1,centrey-r):min(size(Img,1),centrey+r),max(1,centrex - r):min(size(Img,2),centrex + r)) = c0;
        hold on;
        [c,h] = contour(phi,[0 0],'r');
        hold off;
    case 6
        % ������ȡ����λ��
%         figure;
%         imshow(Temp);
        colormap;
%         [centrex,centrey] = ginput; % ���Ҽ�����
%         centrex = uint8(centrex(1));
%         centrey = uint8(centrey(1));
        centrex = 52; 
        centrey = 40; 
        boardsize = 20; %����߽��λ��
        iscircle = 1; % ����Բ��,�����������
        r = 10; %����Բ��ʱΪ�뾶����������ʱΪ(1/2)*�߳�
        if r > boardsize
            r = boardsize;
        end
        [m,n] = size(Img);
        phi= ones(m,n).*c0;
        phi(max(1,centrey-r):min(size(Img,1),centrey+r),max(1,centrex - r):min(size(Img,2),centrex + r)) = -c0;
        hold on;
        [c,h] = contour(phi,[0 0],'r');
        hold off;
end%switch imgID

iterNum = 300; % the total number of the iteration
lambda1 = 1;   % the weight parameter of the globe term which is inside the level set
lambda2 = 1;   % the weight parameter of the globe term which is ouside the level set
mu = 0.002*255*255; % the weight parameter of the length term
nu = 0; % the weight parameter of the area term
pu = 1.0; %the weight parameter of the penalizing term
timestep = 0.1; % the time step of the level set function evolution
epsilon = 1.0; % the parameter of the Heaviside function and the Dirac delta function


%this part code is for the Multi_LBF model
N = 3;
sigmaStep = 2;
KMlbf = cell(1,N);
KMIG = KMlbf;
KMONE = KMlbf;
for n = 1:N
    sigmaG = 3.0 + (n -1)*sigmaStep;
    KMlbf{n} = fspecial('gaussian',round(2*sigmaG)*2+1,sigmaG);
    KMIG{n} = conv2(Img,KMlbf{n},'same');
    KMONE{n} = conv2(ones(size(Img)),KMlbf{n},'same');
end %for n


% all model's initial level set is same
phi_Multi_LBF = phi;
phi_star = phi;
%
% figure;
% imshow(Temp); colormap;

%start the level set evolution

% MULTI_LBF
time = cputime;
for iter = 1:100
    numIter=1;
    phi_Multi_LBF = EVOL_LBF_Multi(phi_Multi_LBF,Img,KMlbf,KMIG,KMONE,1*mu,timestep,pu,lambda1,lambda2,epsilon,N,numIter);
    %level set evolution.
    if mod(iter,10) == 0
        pause(0.001);
        imagesc(Img, [0, 255]);colormap(gray);hold on; axis off;
        contour(phi_Multi_LBF,[0,0],'c');
    end
    if mod(iter,10) == 0 
        phi_Multi_LBF10 = phi_Multi_LBF; 
    end
    if mod(iter,60) == 0
        phi_Multi_LBF60 = phi_Multi_LBF; 
    end 
end %for
totaltime_Multi_LBF = cputime - time;





% Display Results
% figure;
% imshow(Temp);
hold on;
contour(phi_star,[0,0],'r','linewidth',1);
title('Initial Level set');


% figure;
% imshow(Temp);
hold on;
contour(phi_Multi_LBF,[0,0],'r','linewidth',1);
title('Results of Multi-LBF model');

% figure;
% imshow(Temp);
hold on;
contour(phi_Multi_LBF10,[0,0],'r','linewidth',1);
title('iter = 10 Results of Multi-LBF model');
% figure;
% imshow(Temp);
hold on;
contour(phi_Multi_LBF60,[0,0],'r','linewidth',1);
title('iter = 60 Results of Multi-LBF model');

MultiLBFFilePath = [SaveFilePath,'Multi_LBF\Demo',num2str(ii),'.bmp'];

SaveMultiLBF = phi_Multi_LBF >= 0;
imshow(SaveMultiLBF)
hold off
toc
time=toc;
set(handles.edit10,'string',time);


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --------------------------------------------------------------------
function Untitled_116_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_116 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
haishenshibie


% --------------------------------------------------------------------
function Untitled_117_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_117 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)