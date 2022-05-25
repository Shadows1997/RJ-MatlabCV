function varargout = DIP(varargin)
% DIP MATLAB code for DIP.fig
%      DIP, by itself, creates a new DIP or raises the existing
%      singleton*.
%
%      H = DIP returns the handle to a new DIP or the handle to
%      the existing singleton*.
%
%      DIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DIP.M with the given input arguments.
%
%      DIP('Property','Value',...) creates a new DIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DIP_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DIP_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DIP

% Last Modified by GUIDE v2.5 10-Jul-2020 13:47:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DIP_OpeningFcn, ...
                   'gui_OutputFcn',  @DIP_OutputFcn, ...
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


% --- Executes just before DIP is made visible.
function DIP_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DIP (see VARARGIN)

% Choose default command line output for DIP
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DIP wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DIP_OutputFcn(hObject, eventdata, handles) 

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(hObject, eventdata, handles) %open�ص�
global I sz
try
[fileName, pathName] = uigetfile({'*.bmp';'*jpg';'*.tif';'*.png'});%��ȡ���ȡͼƬ��·��
I = imread([pathName fileName]);   %��ȡͼƬ
sz = length(size(I));                      
handles.ori_img = I;
axes(handles.axes1);
imshow(handles.ori_img,'InitialMagnification','fit'),title('ԭͼ');
handles.output=hObject;
guidata(hObject,handles);
catch
    errordlg('something wrong!!','Error');
end



function pushbutton2_Callback(hObject, eventdata, handles)  %save�ص�
[f,p]=uiputfile({'.jpg'},'����ͼƬ');
str=strcat(p,f);
pic=getframe(handles.axes2);    %��ȡĿǰaxes2����ͼ��
imwrite(pic.cdata,str,'jpg');

function pushbutton3_Callback(hObject, eventdata, handles)  %ͼ�����Ź��ܻص�
global chazhifangfa suofangbeishu I sz
axes(handles.axes2);%��ʾ�ڵڶ���ͼ��
if sz == 2
    if chazhifangfa==1
        X=imresize(I,suofangbeishu,'nearest');
        imshow(X,[],'InitialMagnification','fit');title(['����ڲ�ֵ����ͼ������',num2str(suofangbeishu),'��'])
    elseif chazhifangfa==2
        X=imresize(I,suofangbeishu,'bilinear');
        imshow(X,[],'InitialMagnification','fit');title(['˫���Բ�ֵ��ʵ��ͼ������',num2str(suofangbeishu),'��'])
    else
        X=imresize(I,suofangbeishu,'bicubic');
        imshow(X,[],'InitialMagnification','fit');title(['˫������ֵ��ʵ��ͼ������',num2str(suofangbeishu),'��'])
    end
else
    if chazhifangfa==1
        X1=imresize(I(:,:,1),suofangbeishu,'nearest');
        X2=imresize(I(:,:,2),suofangbeishu,'nearest');
        X3=imresize(I(:,:,3),suofangbeishu,'nearest');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['����ڲ�ֵ����ͼ������',num2str(suofangbeishu),'��'])
    elseif chazhifangfa==2
        X1=imresize(I(:,:,1),suofangbeishu,'bilinear');
        X2=imresize(I(:,:,2),suofangbeishu,'bilinear');
        X3=imresize(I(:,:,3),suofangbeishu,'bilinear');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['˫���Բ�ֵ��ʵ��ͼ������',num2str(suofangbeishu),'��'])
    else
        X1=imresize(I(:,:,1),suofangbeishu,'bicubic');
        X2=imresize(I(:,:,2),suofangbeishu,'bicubic');
        X3=imresize(I(:,:,3),suofangbeishu,'bicubic');
        imshow(cat(3,X1,X2,X3),[],'InitialMagnification','fit');title(['˫������ֵ��ʵ��ͼ������',num2str(suofangbeishu),'��'])
    end
end

function edit1_Callback(hObject, eventdata, handles)    %��ȡ���ű����Ļص�
global suofangbeishu
suofangbeishu = str2double(get(handles.edit1,'string'));    %��ȡ���ű���

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ѡ������ʹ�õĲ�ֵ�㷨
% 1.ѡ������ڲ�ֵ��
function checkbox1_Callback(hObject, eventdata, handles)
global chazhifangfa;
if(get(hObject,'Value'))
   chazhifangfa=1;
end

% 2.ѡ��˫���Բ�ֵ��
function checkbox2_Callback(hObject, eventdata, handles)
global chazhifangfa
if(get(hObject,'Value'))
    chazhifangfa=2;
end

% 1.ѡ��˫������ֵ��
function checkbox3_Callback(hObject, eventdata, handles)
global chazhifangfa
if(get(hObject,'Value'))
    chazhifangfa=3;
end

function pushbutton4_Callback(hObject, eventdata, handles)  %��ת�ص�
global I
global xuanzhuanjiaodu
axes(handles.axes2);
J=imrotate(I,xuanzhuanjiaodu, 'bilinear');
imshow(J,'InitialMagnification','fit');title(['��ʱ����ת',num2str(xuanzhuanjiaodu),'��ͼ��'])

function edit3_Callback(hObject, eventdata, handles)    

%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global xuanzhuanjiaodu
xuanzhuanjiaodu = str2double(get(handles.edit3,'string'));  %��ȡ��ת�Ƕ�

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)  
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)   %�ü��ص�
global I
msgbox('��ѡ��Ҫ�ü������򣬲�˫��ѡ����������ʾ','��ʾ��Ϣ');
waitforbuttonpress;
clf;
I2=imcrop(I);
close
axes(handles.axes2)
imshow(I2,'InitialMagnification','fit'),title('�ü����ͼ��')


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)  %ͼ�����ط�ת�ص�
global I sz
if sz == 3
    errordlg('��ɫͼ�޷����Է�ת','Error');
else
    img=double(I);
    img=-img+255;   %ͼ��ת���Ա任
    H=uint8(img);
    axes(handles.axes2)
    imshow(H,'InitialMagnification','fit'),title('�Ҷȷ�ת���Ա任')
end

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)  %ֱ��ͼ����ص�
global I sz
if sz == 2
    equa=histeq(I); %ֱ��ͼ����
    figure,
    subplot(121),imhist(I),title('ֱ��ͼ����ǰ')
    subplot(122),imhist(equa),title('ֱ��ͼ�����')
    axes(handles.axes2)
    imshow(equa,'InitialMagnification','fit'),title('ֱ��ͼ�����ͼ')
else
    equa1 = histeq(I(:,:,1));
    equa2 = histeq(I(:,:,2));
    equa3 = histeq(I(:,:,3));
    figure,
    subplot(231),imhist(I(:,:,1)),title('R����ֱ��ͼ����ǰ');
    subplot(232),imhist(I(:,:,2)),title('G����ֱ��ͼ����ǰ');
    subplot(233),imhist(I(:,:,3)),title('B����ֱ��ͼ����ǰ');
    subplot(234),imhist(equa1),title('R����ֱ��ͼ����ǰ');
    subplot(235),imhist(equa2),title('G����ֱ��ͼ����ǰ');
    subplot(236),imhist(equa3),title('B����ֱ��ͼ����ǰ');
    axes(handles.axes2)
    imshow(cat(3,equa1,equa2,equa3),'InitialMagnification','fit'),title('ֱ��ͼ�����ͼ')
end

% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)      %��ֵ���ص�
global I erzhihuayuzhi sz
if sz == 2
    bw=imbinarize(I,erzhihuayuzhi);
    axes(handles.axes2)
    imshow(uint8(255*bw),[],'InitialMagnification','fit'),title(['��',num2str(erzhihuayuzhi),'Ϊ��ֵ�ָ�Ķ�ֵͼ'])
else
    i = rgb2gray(I);
    bw=imbinarize(i,erzhihuayuzhi);
    axes(handles.axes2)
    imshow(uint8(255*bw,'InitialMagnification','fit'),[]),title(['ת��Ϊ�Ҷ�ͼ����',num2str(erzhihuayuzhi),'Ϊ��ֵ�ָ�Ķ�ֵͼ'])
end

function edit4_Callback(hObject, eventdata, handles)    

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global erzhihuayuzhi;
erzhihuayuzhi=str2double(get(handles.edit4,'string'));  %��ֵ����ֵ��ȡ

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
global filterType I sz D0 D1
[m,n,~]=size(I);
Dcut=100;
% disp(D0)
% if D0 == ' '
%     D0=150;
% if D1 == ' '
%     D1=250;
% end
% end
D0_use = str2double(D0);
D1_use = str2double(D1);
disp(D0_use)
disp(D1_use)
%�������ֵ�ͨ�˲���
for u=1:m
    for v=1:n
        D(u,v)=sqrt(u^2+v^2);
        BUTTER_LOW(u,v)=1/(1+(sqrt(2)-1)*(D(u,v)/Dcut)^2);  %������˹��ͨ�˲���
        EXPOT_LOW(u,v)=exp(log(1/sqrt(2))*(D(u,v)/Dcut)^2); %ָ����ͨ�˲���
        if D(u,v)<D0_use
            TRAPE_LOW(u,v)=1;                               %���ε�ͨ�˲���
        else if D(u,v)<=D1_use
                TRAPE_LOW(u,v)=(D(u,v)-D1_use)/(D0_use-D1_use);
            else TRAPE_LOW(u,v)=0;
            end
        end
    end
end
%�������ָ�ͨ�˲���
for u=1:m
    for v=1:n
        D(u,v)=sqrt(u^2+v^2);
        BUTTER_HIGH(u,v)=1/(1+(sqrt(2)-1)*(Dcut/D(u,v))^2);     %������˹��ͨ�˲���
        EXPOTH_HIGH(u,v)=exp(log(1/sqrt(2))*(Dcut/D(u,v))^2);   %ָ����ͨ�˲���
        if D(u,v)<D1_use
            THPF_HIGH(u,v)=0;                                   %���θ�ͨ�˲���
        else if D(u,v)<=D0_use
                THPF_HIGH(u,v)=(D(u,v)-D1_use)/(D0_use-D1_use);
            else THPF_HIGH(u,v)=1;
            end
        end
    end
end
if sz == 2
    F=fft2(I);  %fft�任
    fftshift(F);
    axes(handles.axes2)
    switch filterType
        case 1
            BUTTERG_LOW=BUTTER_LOW.*F;  %ͨ���˲���
            BUTTERfiltered_LOW=ifft2(BUTTERG_LOW);
            figure,plot(BUTTER_LOW),title('������˹��ͨ�˲���');
            axes(handles.axes2)
            imshow(BUTTERfiltered_LOW,[],'InitialMagnification','fit'),title('����������˹��ͨ�˲������ͼ��');
        case 2
            EXPOTG_LOW=EXPOT_LOW.*F;
            EXPOTfiltered_LOW=ifft2(EXPOTG_LOW);
            figure,plot(EXPOT_LOW),title('ָ����ͨ�˲���');
            axes(handles.axes2)
            imshow(EXPOTfiltered_LOW,[],'InitialMagnification','fit'),title('����ָ����ͨ�˲������ͼ��');
        case 3
            TRAPEG_LOW=TRAPE_LOW.*F;
            TRAPEfiltered_LOW=ifft2(TRAPEG_LOW);
            figure,plot(TRAPE_LOW),title('���ε�ͨ�˲���');
            axes(handles.axes2)
            imshow(TRAPEfiltered_LOW,[],'InitialMagnification','fit'),title('�������ε�ͨ�˲������ͼ��');
        case 4    
            BUTTERG_HIGH=BUTTER_HIGH.*F;
            BUTTERfiltered_HIGH=ifft2(BUTTERG_HIGH);
            figure,plot(BUTTER_HIGH),title('������˹��ͨ�˲���');
            axes(handles.axes2)
            imshow(BUTTERfiltered_HIGH,[],'InitialMagnification','fit'),title('����������˹��ͨ�˲������ͼ��');
        case 5 
            EXPOTG_HIGH=EXPOTH_HIGH.*F;
            EXPOTfiltered_HIGH=ifft2(EXPOTG_HIGH);
            figure,plot(EXPOT_HIGH),title('ָ����ͨ�˲���');
            axes(handles.axes2)
            imshow(EXPOTfiltered_HIGH,[],'InitialMagnification','fit'),title('����ָ����ͨ�˲������ͼ��');
        case 6
            TRAPEG_HIGH=TRAPE_HIGH.*F;
            TRAPEfiltered_HIGH=ifft2(TRAPEG_HIGH);
            figure,plot(TRAPE_HIGH),title('���θ�ͨ�˲���');
            axes(handles.axes2)
            imshow(TRAPEfiltered_HIGH,[],'InitialMagnification','fit'),title('�������θ�ͨ�˲������ͼ��');
    end
else
    F1=fft2(I(:,:,1));
    F2=fft2(I(:,:,2));
    F3=fft2(I(:,:,3));
    fftshift(F1);
    fftshift(F2);
    fftshift(F3);
    axes(handles.axes2)
    switch filterType
        case 1
            BUTTERG_LOW1=BUTTER_LOW.*F1;
            BUTTERfiltered_LOW1=ifft2(BUTTERG_LOW1);
            BUTTERG_LOW2=BUTTER_LOW.*F2;
            BUTTERfiltered_LOW2=ifft2(BUTTERG_LOW2);
            BUTTERG_LOW3=BUTTER_LOW.*F3;
            BUTTERfiltered_LOW3=ifft2(BUTTERG_LOW3);        %rgb�������������˲���
            figure,plot(BUTTER_LOW),title('������˹��ͨ�˲���');
            figure
            subplot(221),imshow(BUTTERfiltered_LOW1,[]),title('R����')
            subplot(222),imshow(BUTTERfiltered_LOW2,[]),title('G����')
            subplot(223),imshow(BUTTERfiltered_LOW3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,BUTTERfiltered_LOW1,BUTTERfiltered_LOW2,BUTTERfiltered_LOW3);    %rgb�����ϳ�Ϊ��ɫͼ
            imshow(uint8(ca),'InitialMagnification','fit'),title('����������˹��ͨ�˲������ͼ��');
        case 2
            EXPOTG_LOW1=EXPOT_LOW.*F1;
            EXPOTfiltered_LOW1=ifft2(EXPOTG_LOW1);
            EXPOTG_LOW2=EXPOT_LOW.*F2;
            EXPOTfiltered_LOW2=ifft2(EXPOTG_LOW2);
            EXPOTG_LOW3=EXPOT_LOW.*F3;
            EXPOTfiltered_LOW3=ifft2(EXPOTG_LOW3);
            figure,plot(EXPOT_LOW),title('ָ����ͨ�˲���');
            figure
            subplot(221),imshow(EXPOTfiltered_LOW1,[]),title('R����')
            subplot(222),imshow(EXPOTfiltered_LOW2,[]),title('G����')
            subplot(223),imshow(EXPOTfiltered_LOW3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,EXPOTfiltered_LOW1,EXPOTfiltered_LOW2,EXPOTfiltered_LOW3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('����ָ����ͨ�˲������ͼ��');
        case 3
            TRAPEG_LOW1=TRAPE_LOW.*F1;
            TRAPEfiltered_LOW1=ifft2(TRAPEG_LOW1);
            TRAPEG_LOW2=TRAPE_LOW.*F2;
            TRAPEfiltered_LOW2=ifft2(TRAPEG_LOW2);
            TRAPEG_LOW3=TRAPE_LOW.*F3;
            TRAPEfiltered_LOW3=ifft2(TRAPEG_LOW3);
            figure,plot(TRAPE_LOW),title('���ε�ͨ�˲���');
            figure
            subplot(221),imshow(TRAPEfiltered_LOW1,[]),title('R����')
            subplot(222),imshow(TRAPEfiltered_LOW2,[]),title('G����')
            subplot(223),imshow(TRAPEfiltered_LOW3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,TRAPEfiltered_LOW1,TRAPEfiltered_LOW2,TRAPEfiltered_LOW3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('�������ε�ͨ�˲������ͼ��');
        case 4    
            BUTTERG_HIGH1=BUTTER_HIGH.*F1;
            BUTTERfiltered_HIGH1=ifft2(BUTTERG_HIGH1);
            BUTTERG_HIGH2=BUTTER_HIGH.*F2;
            BUTTERfiltered_HIGH2=ifft2(BUTTERG_HIGH2);
            BUTTERG_HIGH3=BUTTER_HIGH.*F3;
            BUTTERfiltered_HIGH3=ifft2(BUTTERG_HIGH3);
            figure,plot(BUTTER_HIGH),title('������˹��ͨ�˲���');
            figure
            subplot(221),imshow(BUTTERfiltered_HIGH1,[]),title('R����')
            subplot(222),imshow(BUTTERfiltered_HIGH2,[]),title('G����')
            subplot(223),imshow(BUTTERfiltered_HIGH3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,BUTTERfiltered_HIGH1,BUTTERfiltered_HIGH2,BUTTERfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('����������˹��ͨ�˲������ͼ��');
        case 5 
            EXPOTG_HIGH1=EXPOTH_HIGH.*F1;
            EXPOTfiltered_HIGH1=ifft2(EXPOTG_HIGH1);
            EXPOTG_HIGH2=EXPOTH_HIGH.*F2;
            EXPOTfiltered_HIGH2=ifft2(EXPOTG_HIGH2);
            EXPOTG_HIGH3=EXPOTH_HIGH.*F3;
            EXPOTfiltered_HIGH3=ifft2(EXPOTG_HIGH3);
            figure,plot(EXPOT_HIGH),title('ָ����ͨ�˲���');
            figure
            subplot(221),imshow(EXPOTfiltered_HIGH1,[]),title('R����')
            subplot(222),imshow(EXPOTfiltered_HIGH2,[]),title('G����')
            subplot(223),imshow(EXPOTfiltered_HIGH3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,EXPOTfiltered_HIGH1,EXPOTfiltered_HIGH2,EXPOTfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('����ָ����ͨ�˲������ͼ��');
        case 6
            TRAPEG_HIGH1=THPF_HIGH.*F1;
            TRAPEfiltered_HIGH1=ifft2(TRAPEG_HIGH1);
            TRAPEG_HIGH2=THPF_HIGH.*F2;
            TRAPEfiltered_HIGH2=ifft2(TRAPEG_HIGH2);
            TRAPEG_HIGH3=THPF_HIGH.*F3;
            TRAPEfiltered_HIGH3=ifft2(TRAPEG_HIGH3);
            figure,plot(THPF_HIGH),title('���θ�ͨ�˲���');
            figure
            subplot(221),imshow(TRAPEfiltered_HIGH1,[]),title('R����')
            subplot(222),imshow(TRAPEfiltered_HIGH2,[]),title('G����')
            subplot(223),imshow(TRAPEfiltered_HIGH3,[]),title('B����')
            axes(handles.axes2)
            ca = cat(3,TRAPEfiltered_HIGH1,TRAPEfiltered_HIGH2,TRAPEfiltered_HIGH3);
            imshow(uint8(ca),'InitialMagnification','fit'),title('�������θ�ͨ�˲������ͼ��');
    end
end

function edit5_Callback(hObject, eventdata, handles)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global D0
D0 = get(handles.edit5,'string');   %��ȡ�˲�������

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global D1
D1 = get(handles.edit6,'string');    %��ȡ�˲�������

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

%% ѡ���˲�������
% 1.ѡ�������˹��ͨ�˲�
function radiobutton1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global filterType       
if(get(hObject,'value'))
    filterType=1;
end

% 2.ѡ��ָ����ͨ�˲���
function radiobutton3_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global filterType
if(get(hObject,'value'))
    filterType=2;
end

% 3.ѡ�����ε�ͨ�˲���
function radiobutton4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton4
global filterType
if(get(hObject,'value'))
    filterType=3;
end

% 4.ѡ�������˹��ͨ�˲�
function radiobutton5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton5
global filterType
if(get(hObject,'value'))
    filterType=4;
end

% 5.ѡ��ָ����ͨ�˲���
function radiobutton6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton6
global filterType
if(get(hObject,'value'))
    filterType=5;
end

% 6.ѡ�����θ�ͨ�˲���
function radiobutton7_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton7
global filterType
if(get(hObject,'value'))
    filterType=6;
end

%% �������
function pushbutton11_Callback(hObject, eventdata, handles) %�������ص�
global I
global choose_gau
global choose_salt
global choose_spe
global choose_rom
str='ͼƬ�������:';
str1='��˹����';
str2='��������';
str3='��������';
str4='�������';
img=I;
if choose_gau==1
    img=imnoise(img,'gaussian',0,0.02);     %�����˹����
    str=strcat([str,' ',str1]);
end
if choose_salt==1
    img=imnoise(img,'salt & pepper', 0.02); %���뽷������
    str=strcat([str,' ',str2]);
end
if choose_spe==1
    img=imnoise(img,'speckle',0.06);        %�����������
    str=strcat([str,' ',str3]);
end
if choose_rom==1
    noise_rom=0.1*randn(size(img));         %�����������
    img=imadd(img,im2uint8(noise_rom));     %���������
    str=strcat([str,' ',str4]);
end

axes(handles.axes2)
imshow(img,'InitialMagnification','fit'),title(str)

%% ѡ�������������
% 1.ѡ���˹����
function checkbox4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox4
global choose_gau
if(get(hObject,'Value'))
    choose_gau=1;
else
    choose_gau=0;
end

% 2.ѡ��������
function checkbox5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox5
global choose_salt
if(get(hObject,'Value'))
    choose_salt=1;
else
    choose_salt=0;
end

% 3.ѡ���������
function checkbox6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox6
global choose_spe
if(get(hObject,'Value'))
    choose_spe=1;
else
    choose_spe=0;
end

% 4.ѡ���������
function checkbox7_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of checkbox7
global choose_rom
if(get(hObject,'Value'))
    choose_rom=1;
else
    choose_rom=0;
end



function pushbutton13_Callback(hObject, eventdata, handles)
global I sz

if sz == 3
    img = gamma_light(I);   %����gamma��ʽ���ղ��������㷨
    axes(handles.axes2)
    imshow(img,'InitialMagnification','fit'),title('����gamma����ȥ�������ȹ���')
else
    img = light_use(I);     %ʹ���˲���ȥ������������ղ���
    axes(handles.axes2)
    imshow(img,'InitialMagnification','fit'),title('�˲�ȥ����ȥ�������ȹ���')
end

function pushbutton14_Callback(hObject, eventdata, handles)
set(findobj('style','edit'),'string','')    %���ò���