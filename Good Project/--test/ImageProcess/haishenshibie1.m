function varargout = haishenshibie1(varargin)
% HAISHENSHIBIE1 MATLAB code for haishenshibie1.fig
%      HAISHENSHIBIE1, by itself, creates a new HAISHENSHIBIE1 or raises the existing
%      singleton*.
%
%      H = HAISHENSHIBIE1 returns the handle to a new HAISHENSHIBIE1 or the handle to
%      the existing singleton*.
%
%      HAISHENSHIBIE1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HAISHENSHIBIE1.M with the given input arguments.
%
%      HAISHENSHIBIE1('Property','Value',...) creates a new HAISHENSHIBIE1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before haishenshibie1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to haishenshibie1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help haishenshibie1

% Last Modified by GUIDE v2.5 11-Mar-2021 20:38:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @haishenshibie1_OpeningFcn, ...
                   'gui_OutputFcn',  @haishenshibie1_OutputFcn, ...
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


% --- Executes just before haishenshibie1 is made visible.
function haishenshibie1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to haishenshibie1 (see VARARGIN)

% Choose default command line output for haishenshibie1
handles.output = hObject;
axes(handles.axes1);
global vid;
vidRes = vid.VideoResolution;
nBands = vid.NumberOfBands;
hImage = image( zeros(vidRes(2), vidRes(1), nBands) );
preview(vid, hImage);
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes haishenshibie1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = haishenshibie1_OutputFcn(hObject, eventdata, handles) 
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
axes(handles.axes1);
global vid;
global im;
im=getsnapshot(vid);
imwrite(im, '抓拍.jpg');
imshow(im);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im;
[a,b,c]=size(I);   
for i=1:a
    for j=1:b
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R==255
           I(i,j)=I(i,j);
       else
           I(i,j,1)=0;
           I(i,j,2)=0;
           I(i,j,3)=0;
       end
    end
end
% figure,imshow(I);
bw1=im2bw(I);
% figure,imshow(bw1);
[L num] = bwlabel(bw1);
for i=1:num
   if numel(find(L==i)) < 1000
       bw1(L==i) =0;
   end
end 
% figure,imshow(bw1);
bw1=~bw1;
w=imresize(bw1,0.5); 
 figure,imshow(w);
% [L1 num1]=bwlabel(w,8);%标记连通区域
 A=regionprops(w,'Area','Perimeter','BoundingBox');
 A1=A(1).Area
 numberD = length(find(w>0.5));
 if A1<200000
     set(handles.edit2,'string','小');%在edit2文本框处输出缺陷类型
 else
     set(handles.edit2,'string','大');%在edit2文本框处输出缺陷类型
 end
hold off;
toc
time=toc;
set(handles.edit1,'string',time);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off       %取消警告
feature jit off   %加速通道
global im
tic
axes(handles.axes2);
I=im;
[a,b,c]=size(I);   
for i=1:a
    for j=1:b
        R=I(i,j,1);
        G=I(i,j,2);
        B=I(i,j,3);
       if R==255
           I(i,j)=I(i,j);
       else
           I(i,j,1)=0;
           I(i,j,2)=0;
           I(i,j,3)=0;
       end
    end
end
% figure,imshow(I);
bw1=im2bw(I);
% figure,imshow(bw1);
[L num] = bwlabel(bw1);
for i=1:num
   if numel(find(L==i)) < 1000
       bw1(L==i) =0;
   end
end 
% figure,imshow(bw1);
bw1=~bw1;
w=imresize(bw1,0.5); 
% imtool(w)
[L1 num1]=bwlabel(w,8);%标记连通区域
D=regionprops(L1,'all');%计算水平轴与椭圆长轴夹角（度数）描绘子%角度很准
%% 缩放 摆正 平移到质心
zhixin=D.Centroid;%取质心
x0=zhixin(2);%得质心所在行
y0=zhixin(1);%得质心所在列
[m,n]=size(w);%求图像大小

scale = 1;%缩放，1为 原比例
angle_rot = -round(D.Orientation);%摆正角度
x_shift=round(n/2-y0);%x轴方向为列方向和Centroid取值坐标一致，即x-n,y-m
y_shift=round(m/2-x0);%求行方向偏移量

% scale, rotate, and translate I1
I2 = im_rst(w, scale, angle_rot, x_shift, y_shift);%这是调用函数，用以得到变化后的结果图像

% figure(1),%subplot(2,1,1),imshow(w),title('原图');
% subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   
% subplot(2,1,1),imshow(logical(I2)),title('the image of Scaled, Rotated, Translated Lena');   
  %% 摆正后 图像质心
% if fang_fa==2
  D_z{1,1}=regionprops(I2,'all');%计算水平轴与椭圆长轴夹角（度数）描绘子%角度很准
  zhixin_z(1,:)=D_z{1}.Centroid;%取质心
  width1(1)=D_z{1}.BoundingBox(1,3);%最小外界矩形长
  width2(1)=D_z{1}.BoundingBox(1,4);%最小外界矩形高
    %% 裁剪
   kuo_bian=15;%可以酌情调整，一般不动
  jian_tu{1}=imcrop(I2,[zhixin_z(1,1)-(round(width1(1)/2)+kuo_bian),zhixin_z(1,2)-(round(width2(1)/2)+kuo_bian),width1(1)+2*kuo_bian,width2(1)+2*kuo_bian]);%jian_tu{i}{99}就是每一张图片的信息
  %% 统一大小化
  beilv=108/max(size(jian_tu{1}));
% suo_tongyi=imresize(jian_tu,beilv);%第一种方法
  tmp=imresize(jian_tu{1},[NaN,108]);%行按与列相同的方法,缩到统一大小
% else 
%   %% 对方的
%   [x1, y1] = find(I2 ==1);
%  
%   % 截取图像中的数字部分  %% 修改保留边界，不是图像超过边界 确实在这里修改呀
%   %fix(min(x1)-2):fix(max(x1)-2),fix(min(y1)-2):fix(max(y1)+2)
%   %% 可以调整控制图像距离边缘的大小
%   Xmin=min(x1)-3;Xmax=max(x1)+3;Ymin=min(y1)-6;Ymax=max(y1)+6;
%   tmp = I2(Xmin:Xmax,Ymin:Ymax);  
%   % 原来直接到边界 tmp = I2(min(x1):max(x1),min(y1):max(y1));  
%   %%   %改变图像大小要从这里开始   把图像变为256*256的
%   %   rate = 72 / max(size(tmp));%从256变成了72
%   %   tmp = imresize(tmp,rate); 
%   tmp = imresize(tmp,[72 171]); %行缩至72，列按相应比例缩至某一数值
%   %% 我想让他变化成非方形
%   %   [x1, y1] = find(tmp == 1);
%   %   tmp = mubiao(min(x1):max(x1),min(y1):max(y1)); % 截取图像中的数字部分
%   %   imshow(logical(tmp));
%   %% 原来  % 改变图像大小要随着上面的变而变
%   [x1,y1] = size(tmp);
%   %  大小 统一化
%    if x1 ~= 72
%     tmp = [zeros(ceil((72-x1)/2)-1,y1);tmp;zeros(floor((72-x1)/2)+1,y1)];
%    end
%  %    if y1 ~= size(tmp,2)% 这里要根据具体情况作出相应的调整，
%    if y1 ~= 171% 这里要根据具体情况作出相应的调整，
%     tmp = [zeros(171,ceil((171-y1)/2)-1);tmp;zeros(171,floor((171-y1)/2)+1)];
%    end
% end
   tmp=logical(tmp);%转成逻辑图以方便显示
   %% 我修改的
%    subplot(2,1,2),imshow(tmp); %显示下保存的图片
%    %%  写文件重命名成功啦
%    picname=[num2str(sprintf('%02d',1)),'.bmp'];  %保存的文件名：如i=1时，picname=1.bmp picname=[num2str(i),'.bmp'];
%    imwrite(tmp,['fig1\',picname]); 
% [FileName,PathName] = uiputfile({'*.jpg','JPEG(*.jpg)';...  
%                                  '*.bmp','Bitmap(*.bmp)';...  
%                                  '*.gif','GIF(*.gif)';...  
%                                  '*.*',  'All Files (*.*)'},...  
%                                  'Save Picture','Untitled');  
% imwrite(tmp,[PathName,FileName]); 
% [A,map]=tmp;  %读入图像
rect=[0 26 108 46];           %定义剪切区域
X1=imcrop(tmp,rect);              %进行图像剪切
set(0,'defaultFigurePosition',[100,100,1000,500]);%修改图形图像位置的默认设置
set(0,'defaultFigureColor',[1 1 1])%修改图形背景颜色的设置
% subplot(121),imshow(A); %显示原图像
rectangle('Position',rect,'LineWidth',2,'EdgeColor','r') %显示图像剪切区域
% subplot(122),imshow(X1);   %显示剪切的图像 
I8 = X1;
I8=im2bw(I8);
% I = rgb2gray(I);  % 对图像进行灰度处理，若是，可跳过
[m n]=size(I8); % m n分别为图像的行 列数
%--- 进行垂直灰度投影
for y=1:n
     V(y)=sum(I8(1:m,y));
end
y=1:n;
figure
plot(y,V(y));
title('垂直灰度投影');
% % 进行水平灰度投影
% for x=1:m
%     L(x)=sum(I8(x,:));
% end
% x=1:m;
% subplot(212),plot(x,L(x));
% title('水平灰度投影');

column=[0];  %一共三行，用“;”分开
p1=[V(y) column];
% display(p1);
load a61.mat
%% 随机产生训练集/测试集
%  a = randperm(20);
Train = a61(1:10,:);
Test = p1(1:end,:);
%% 训练数据
Ptrain = Train(:,1:end-1);
Ttrain = Train(:,end);
%% 测试数据
 P_test = Test(:,1:end-1);
 T_test = Test(:,end);
%% 创建决策树分类器
ctree = ClassificationTree.fit(Ptrain,Ttrain);
%% 查看决策树视图
view(ctree,'mode','graph');
%% IV. 仿真测试
T_pre = predict(ctree,P_test);
 if T_pre<1
     set(handles.edit2,'string','多刺');%在edit2文本框处输出缺陷类型
 else
     set(handles.edit2,'string','少刺');%在edit2文本框处输出缺陷类型
 end
hold off;
toc
time=toc;
set(handles.edit1,'string',time);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(haishenshibie1);% //想关闭的matlab界面名称——对应gui.m和gui.fig
set(haishenshibie,'Visible','on'); % //想打开的界面名称——gui.m和gui.fig



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
