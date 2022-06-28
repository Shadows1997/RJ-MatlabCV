%---------------------------------------------%
%					      %
%          工作室提供代做matlab仿真	      %
%					      %
%  详情请访问：http://cn.mikecrm.com/5k6v1DP  %
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
wavplay(wavread('欢迎来到汽车识别系统.wav'),44100);
% Get default command line output from handles structure
varargout{1} = handles.output;
% 选择图片
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavplay(wavread('选择图片.wav'),44100);
[fn,pn,fi]=uigetfile('*.jpg','选择图片');
I=imread([pn fn]);
axes(handles.axes1);
imshow(I);title('原始图像');%显示原始图像
handles.VARdata=I;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来
% 提取车牌
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
wavplay(wavread('提取车牌.wav'),44100);
I=handles.VARdata;
[PY2,PY1,PX2,PX1]=caitu_fenge(I);
I_bai=I;%用HSI模型识别蓝色，用rgb模型识别白色
%车牌区域根据面积二次修正
[PY2,PY1,PX2,PX1,threshold]=SEC_xiuzheng(PY2,PY1,PX2,PX1);
%更新图片
Plate=I_bai(PY1:PY2,PX1:PX2,:);%使用caitu_tiqu
%考虑用腐蚀解决蓝色车问题
axes(handles.axes8);
bw=Plate;imshow(bw);title('车牌图像');%hsv彩图提取图像
handles.VARdata11=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来
handles.VARdata1=threshold;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

% 灰度处理
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%这里要根据图像的倾斜度进行选择这里选择的图片20090425686.jpg
wavplay(wavread('灰度处理.wav'),44100);
bw=handles.VARdata11;
axes(handles.axes9);
bw=rgb2gray(bw);imshow(bw);title('灰度图像');
handles.VARdata12=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

% 倾斜校正
function pushbutton8_Callback(hObject, eventdata, handles)
wavplay(wavread('倾斜校正.wav'),44100);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%倾斜校正
bw=handles.VARdata12;
qingxiejiao=rando_bianhuan(bw);
axes(handles.axes10);
bw=imrotate(bw,qingxiejiao,'bilinear','crop');imshow(bw);title('倾斜校正');%取值为负值向右旋转
handles.VARdata13=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来
handles.VARdata2=qingxiejiao;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

%擦除
function pushbutton9_Callback(hObject, eventdata, handles)
wavplay(wavread('擦除.wav'),44100);
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata13;
bw=im2bw(bw,graythresh(bw));%figure,imshow(bw);
bw=bwmorph(bw,'hbreak',inf);%figure,imshow(bw);
bw=bwmorph(bw,'spur',inf);%figure,imshow(bw);title('擦除之前');
bw=bwmorph(bw,'open',5);%figure,imshow(bw);title('闭合运算');
threshold1=handles.VARdata1;
bw=bwareaopen(bw, threshold1);
axes(handles.axes11);
imshow(bw);title('擦除');
handles.VARdata14=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来
handles.VARdata1=threshold1;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

% 擦除反射
function pushbutton10_Callback(hObject, eventdata, handles)
wavplay(wavread('擦除发射.wav'),44100);
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata14;
axes(handles.axes12);
bw=~bw;imshow(bw);title('擦除反色'); 
handles.VARdata15=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

% Y方向处理
function pushbutton11_Callback(hObject, eventdata, handles)
wavplay(wavread('Y方向处理.wav'),44100);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata15;
axes(handles.axes13);
bw=touying(bw);imshow(bw);title('Y方向处理');
handles.VARdata16=bw;%将I存放到handles的VARdata字段中去
guidata(hObject,handles);%将新的handles值存储起来

% 显示车牌
function pushbutton12_Callback(hObject, eventdata, handles)
wavplay(wavread('显示车牌.wav'),44100);
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bw=handles.VARdata16;
threshold=handles.VARdata1;
bw=~bw;
bw = bwareaopen(bw, threshold);
bw=~bw;%figure,imshow(bw);title('二次擦除');
[y,x]=size(bw);%对长宽重新赋值
%文字分割
qingxiejiao=handles.VARdata2;
fenge=shuzifenge(bw,qingxiejiao)
[m,k]=size(fenge);
%显示分割图像结果
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
%给七张图片定位
han_zi  =bw( 1:y,fenge(1):fenge(2));
zi_mu   =bw( 1:y,fenge(3):fenge(4));
zm_sz_1 =bw( 1:y,fenge(5):fenge(6));
zm_sz_2 =bw( 1:y,fenge(7):fenge(8));  
shuzi_1 =bw( 1:y,fenge(9):fenge(10)); 
shuzi_2 =bw( 1:y,fenge(11):fenge(12)); 
shuzi_3 =bw( 1:y,fenge(13):fenge(14)); 
%把修正数据读入
xiuzhenghanzi =   imresize(han_zi, [110 55],'bilinear');
xiuzhengzimu  =   imresize(zi_mu,  [110 55],'bilinear');
xiuzhengzm_sz_1=  imresize(zm_sz_1,[110 55],'bilinear');
xiuzhengzm_sz_2 = imresize(zm_sz_2,[110 55],'bilinear');
xiuzhengshuzi_1 = imresize(shuzi_1,[110 55],'bilinear');
xiuzhengshuzi_2 = imresize(shuzi_2,[110 55],'bilinear');
xiuzhengshuzi_3 = imresize(shuzi_3,[110 55],'bilinear');
%把0-9 , A-Z以及省份简称的数据存储方便访问
hanzishengfen=duquhanzi(imread('cpgui.bmp'),imread('cpguizhou.bmp'),imread('cpjing.bmp'),imread('cpsu.bmp'),imread('cpyue.bmp'),imread('cpe.bmp'));
%因数字和字母比例不同。这里要修改
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
%识别结果
i=1;%shibiezm_sz该函数识别数字有问题
jieguohanzi  = shibiehanzi(hanzishengfen,xiuzhenghanzi);shibiejieguo(1,i) =jieguohanzi;  i=i+1;
jieguozimu   = shibiezimu(zimu,xiuzhengzimu);           shibiejieguo(1,i) =jieguozimu;   i=i+1;
jieguozm_sz_1= shibiezm_sz(shuzizimu,xiuzhengzm_sz_1);  shibiejieguo(1,i) =jieguozm_sz_1;i=i+1;
jieguozm_sz_2= shibiezm_sz(shuzizimu,xiuzhengzm_sz_2);  shibiejieguo(1,i) =jieguozm_sz_2;i=i+1;
jieguoshuzi_1= shibieshuzi(shuzi,xiuzhengshuzi_1);      shibiejieguo(1,i) =jieguoshuzi_1;i=i+1;
jieguoshuzi_2= shibieshuzi(shuzi,xiuzhengshuzi_2);      shibiejieguo(1,i) =jieguoshuzi_2;i=i+1;
jieguoshuzi_3= shibieshuzi(shuzi,xiuzhengshuzi_3);      shibiejieguo(1,i) =jieguoshuzi_3;i=i+1;
%对话框显示显示
shibiejieguo
msgbox(shibiejieguo,'识别结果');
%导出文本
fid=fopen('F:\课设\Data.xls','a+');
fprintf(fid,'%s\r\n',shibiejieguo,datestr(now));
fclose(fid);
%读出声音
duchushengyin(shibiejieguo);
varargout;

% 修改背景图片
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha=axes('units','normalized','position',[0 0 1 1]);
uistack(ha,'down')
II=imread('E:\图\t019e717655cbf74d49.jpg');
image(II)
colormap gray
set(ha,'handlevisibility','off','visible','off');

%退出
function pushbutton13_Callback(hObject, eventdata, handles)
wavplay(wavread('欢迎再次使用.wav'),44100);
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.figure1);%关闭Tag为figure1的figure 


