%---------------------------------------------%
%					      %
%          �������ṩ����matlab����	      %
%					      %
%  ��������ʣ�http://cn.mikecrm.com/5k6v1DP  %
%					      %
%---------------------------------------------%


function varargout = untitled(varargin)
% UNTITLED M-file for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 09-Jan-2017 15:29:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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

% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)
% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavplay(wavread('��ӭ��������ʶ��ϵͳ.wav'),44100);
% Get default command line output from handles structure
varargout{1} = handles.output;
% ѡ��ͼƬ
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavplay(wavread('ѡ��ͼƬ.wav'),44100);
[fn,pn,fi]=uigetfile('*.jpg','ѡ��ͼƬ');
I=imread([pn fn]);
axes(handles.axes1);
imshow(I);title('ԭʼͼ��');%��ʾԭʼͼ��
handles.VARdata=I;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����
% ��ȡ����
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavplay(wavread('��ȡ����.wav'),44100);
I=handles.VARdata;
[PY2,PY1,PX2,PX1]=caitu_fenge(I);
I_bai=I;%��HSIģ��ʶ����ɫ����rgbģ��ʶ���ɫ
%����������������������
[PY2,PY1,PX2,PX1,threshold]=SEC_xiuzheng(PY2,PY1,PX2,PX1);
%����ͼƬ
Plate=I_bai(PY1:PY2,PX1:PX2,:);%ʹ��caitu_tiqu
%�����ø�ʴ�����ɫ������
axes(handles.axes8);
bw=Plate;imshow(bw);title('����ͼ��');%hsv��ͼ��ȡͼ��
handles.VARdata11=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����
handles.VARdata1=threshold;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

% �Ҷȴ���
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����Ҫ����ͼ�����б�Ƚ���ѡ������ѡ���ͼƬ20090425686.jpg
wavplay(wavread('�Ҷȴ���.wav'),44100);
bw=handles.VARdata11;
axes(handles.axes9);
bw=rgb2gray(bw);imshow(bw);title('�Ҷ�ͼ��');
handles.VARdata12=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

% ��бУ��
function pushbutton8_Callback(hObject, eventdata, handles)
wavplay(wavread('��бУ��.wav'),44100);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%��бУ��
bw=handles.VARdata12;
qingxiejiao=rando_bianhuan(bw);
axes(handles.axes10);
bw=imrotate(bw,qingxiejiao,'bilinear','crop');imshow(bw);title('��бУ��');%ȡֵΪ��ֵ������ת
handles.VARdata13=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����
handles.VARdata2=qingxiejiao;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

%����
function pushbutton9_Callback(hObject, eventdata, handles)
wavplay(wavread('����.wav'),44100);
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata13;
bw=im2bw(bw,graythresh(bw));%figure,imshow(bw);
bw=bwmorph(bw,'hbreak',inf);%figure,imshow(bw);
bw=bwmorph(bw,'spur',inf);%figure,imshow(bw);title('����֮ǰ');
bw=bwmorph(bw,'open',5);%figure,imshow(bw);title('�պ�����');
threshold1=handles.VARdata1;
bw=bwareaopen(bw, threshold1);
axes(handles.axes11);
imshow(bw);title('����');
handles.VARdata14=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����
handles.VARdata1=threshold1;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

% ��������
function pushbutton10_Callback(hObject, eventdata, handles)
wavplay(wavread('��������.wav'),44100);
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata14;
axes(handles.axes12);
bw=~bw;imshow(bw);title('������ɫ'); 
handles.VARdata15=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

% Y������
function pushbutton11_Callback(hObject, eventdata, handles)
wavplay(wavread('Y������.wav'),44100);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata15;
axes(handles.axes13);
bw=touying(bw);imshow(bw);title('Y������');
handles.VARdata16=bw;%��I��ŵ�handles��VARdata�ֶ���ȥ
guidata(hObject,handles);%���µ�handlesֵ�洢����

% ��ʾ����
function pushbutton12_Callback(hObject, eventdata, handles)
wavplay(wavread('��ʾ����.wav'),44100);
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata16;
threshold=handles.VARdata1;
bw=~bw;
bw = bwareaopen(bw, threshold);
bw=~bw;%figure,imshow(bw);title('���β���');
[y,x]=size(bw);%�Գ������¸�ֵ
%���ַָ�
qingxiejiao=handles.VARdata2;
fenge=shuzifenge(bw,qingxiejiao)
[m,k]=size(fenge);
%��ʾ�ָ�ͼ����
axes(handles.axes15);
imshow(bw(1:y,fenge(1):fenge(1+1)));
axes(handles.axes16);
imshow(bw(1:y,fenge(3):fenge(3+1)));
axes(handles.axes17);
imshow(bw(1:y,fenge(5):fenge(5+1)));
axes(handles.axes18);
imshow(bw(1:y,fenge(7):fenge(7+1)));
axes(handles.axes19);
imshow(bw(1:y,fenge(9):fenge(9+1)));
axes(handles.axes20);
imshow(bw(1:y,fenge(11):fenge(11+1)));
axes(handles.axes21);
imshow(bw(1:y,fenge(13):fenge(13+1)));
%������ͼƬ��λ
han_zi  =bw( 1:y,fenge(1):fenge(2));
zi_mu   =bw( 1:y,fenge(3):fenge(4));
zm_sz_1 =bw( 1:y,fenge(5):fenge(6));
zm_sz_2 =bw( 1:y,fenge(7):fenge(8));  
shuzi_1 =bw( 1:y,fenge(9):fenge(10)); 
shuzi_2 =bw( 1:y,fenge(11):fenge(12)); 
shuzi_3 =bw( 1:y,fenge(13):fenge(14)); 
%���������ݶ���
xiuzhenghanzi =   imresize(han_zi, [110 55],'bilinear');
xiuzhengzimu  =   imresize(zi_mu,  [110 55],'bilinear');
xiuzhengzm_sz_1=  imresize(zm_sz_1,[110 55],'bilinear');
xiuzhengzm_sz_2 = imresize(zm_sz_2,[110 55],'bilinear');
xiuzhengshuzi_1 = imresize(shuzi_1,[110 55],'bilinear');
xiuzhengshuzi_2 = imresize(shuzi_2,[110 55],'bilinear');
xiuzhengshuzi_3 = imresize(shuzi_3,[110 55],'bilinear');
%��0-9 , A-Z�Լ�ʡ�ݼ�Ƶ����ݴ洢�������
hanzishengfen=duquhanzi(imread('cpgui.bmp'),imread('cpguizhou.bmp'),imread('cpjing.bmp'),imread('cpsu.bmp'),imread('cpyue.bmp'),imread('cpe.bmp'));
%�����ֺ���ĸ������ͬ������Ҫ�޸�
shuzizimu=duquszzm(imread('0.bmp'),imread('1.bmp'),imread('2.bmp'),imread('3.bmp'),imread('4.bmp'),...
                   imread('5.bmp'),imread('6.bmp'),imread('7.bmp'),imread('8.bmp'),imread('9.bmp'),...
                   imread('10.bmp'),imread('11.bmp'),imread('12.bmp'),imread('13.bmp'),imread('14.bmp'),...
                   imread('15.bmp'),imread('16.bmp'),imread('17.bmp'),imread('18.bmp'),imread('19.bmp'),...
                   imread('20.bmp'),imread('21.bmp'),imread('22.bmp'),imread('23.bmp'),imread('24.bmp'),...
                   imread('25.bmp'),imread('26.bmp'),imread('27.bmp'),imread('28.bmp'),imread('29.bmp'),...
                   imread('30.bmp'),imread('31.bmp'),imread('32.bmp'),imread('33.bmp'));
zimu  = duquzimu(imread('10.bmp'),imread('11.bmp'),imread('12.bmp'),imread('13.bmp'),imread('14.bmp'),...
                 imread('15.bmp'),imread('16.bmp'),imread('17.bmp'),imread('18.bmp'),imread('19.bmp'),...
                 imread('20.bmp'),imread('21.bmp'),imread('22.bmp'),imread('23.bmp'),imread('24.bmp'),...
                 imread('25.bmp'),imread('26.bmp'),imread('27.bmp'),imread('28.bmp'),imread('29.bmp'),...
                 imread('30.bmp'),imread('31.bmp'),imread('32.bmp'),imread('33.bmp'));
shuzi = duqushuzi(imread('0.bmp'),imread('1.bmp'),imread('2.bmp'),imread('3.bmp'),imread('4.bmp'),...
                 imread('5.bmp'),imread('6.bmp'),imread('7.bmp'),imread('8.bmp'),imread('9.bmp')); 
%ʶ����
i=1;%shibiezm_sz�ú���ʶ������������
jieguohanzi  = shibiehanzi(hanzishengfen,xiuzhenghanzi);shibiejieguo(1,i) =jieguohanzi;  i=i+1;
jieguozimu   = shibiezimu(zimu,xiuzhengzimu);           shibiejieguo(1,i) =jieguozimu;   i=i+1;
jieguozm_sz_1= shibiezm_sz(shuzizimu,xiuzhengzm_sz_1);  shibiejieguo(1,i) =jieguozm_sz_1;i=i+1;
jieguozm_sz_2= shibiezm_sz(shuzizimu,xiuzhengzm_sz_2);  shibiejieguo(1,i) =jieguozm_sz_2;i=i+1;
jieguoshuzi_1= shibieshuzi(shuzi,xiuzhengshuzi_1);      shibiejieguo(1,i) =jieguoshuzi_1;i=i+1;
jieguoshuzi_2= shibieshuzi(shuzi,xiuzhengshuzi_2);      shibiejieguo(1,i) =jieguoshuzi_2;i=i+1;
jieguoshuzi_3= shibieshuzi(shuzi,xiuzhengshuzi_3);      shibiejieguo(1,i) =jieguoshuzi_3;i=i+1;
%�Ի�����ʾ��ʾ
shibiejieguo
msgbox(shibiejieguo,'ʶ����');
%�����ı�
fid=fopen('F:\����\Data.xls','a+');
fprintf(fid,'%s\r\n',shibiejieguo,datestr(now));
fclose(fid);
%��������
duchushengyin(shibiejieguo);
varargout;

% �޸ı���ͼƬ
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('E:\ͼ\t019e717655cbf74d49.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');

%�˳�
function pushbutton13_Callback(hObject, eventdata, handles)
wavplay(wavread('��ӭ�ٴ�ʹ��.wav'),44100);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);%�ر�TagΪfigure1��figure 


