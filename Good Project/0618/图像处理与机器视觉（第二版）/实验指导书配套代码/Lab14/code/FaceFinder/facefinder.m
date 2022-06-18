function varargout = facefinder(varargin)
gui_Singleton = 0;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @facefinder_OpeningFcn, ...
                   'gui_OutputFcn',  @facefinder_OutputFcn, ...
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
end

function facefinder_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
% If there is a splash screen for deployed version, kill it since this code
% is now running and is MCR is no longer loading.
if (isdeployed==1)    
        
system('taskkill /f /im facefinder_starter.exe')
 
end
set(gcf,'Pointer','watch')
guidata(hObject, handles);set(handles.percentage,'String','欢迎使用人脸识别系统');
axes(handles.live_axis);axis off;
axes(handles.face_axis);axis off;
axes(handles.main_image1);axis off;
axes(handles.match_image1);axis off;
axes(handles.pie_chart),axis off; imshow('about.png');
global database_path trainimages_path data_path state image_info counter Train_Number file;
state=0;counter=1;
[database_path,trainimages_path,data_path]= default_dir();
[Train_Number]=noofdata(trainimages_path);
[image_info,file]=data_loader(data_path);
webcamlist(hObject, eventdata, handles);
formatlist(hObject, eventdata, handles);
try
webcamlist(hObject, eventdata, handles);
formatlist(hObject, eventdata, handles);
train_button_Callback(hObject, eventdata, handles);
catch
h=errordlg('数据库未录入人脸数据','File Error');   
beep;
uiwait(h);  
set(handles.inform_pane,'String','数据库中无可用人脸数据','FontSize',10.0,'BackgroundColor','red');
set(handles.percentage,'String','请查看实验指导书'); 
  set(gcf,'Pointer','arrow')
end
set(gcf,'Pointer','arrow')
end

function varargout = facefinder_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
end
function webcamlist(~, ~, handles)
try
global cam_type cam_id format faceDetector  ;  
 h=waitbar(0,'INTIALISING........');
cam_type={};cam_id=[];list={};format=struct;
info=imaqhwinfo;
instlist=info.InstalledAdaptors;
[~, n]=size(instlist(1,:));
for x=1:n
   waitbar(x/n);
    c=instlist(1,x);
    device_info=imaqhwinfo(char(c));
    [~, j]=size(device_info.DeviceIDs(1,:));
    if j==0
    else
        for y=1:j
            selection=imaqhwinfo(char(c),y);
            list=[list selection.DeviceName];
            cam_id=[cam_id y];
            cam_type=[cam_type c];
        end
    end
end
faceDetector = vision.CascadeObjectDetector();
set(handles.winvideo_list,'String',list)
set(handles.inform_pane,'String','选择 web_cam','FontSize',10.0)
delete(h);
catch
    delete(h);
    d=warndlg('未安装相机');
    uiwait(d);
end
end

function formatlist(~, ~, handles, varargin)
try
global cam_type cam_id format;
format=struct;
[~,n]=size(cam_type);
for x=1:n
     selection=imaqhwinfo(char(cam_type(1,x)),cam_id(1,x));
    format(1,x).suppourtedformat=selection.SupportedFormats;
end
catch
end
end



function winvideo_list_Callback(hObject, ~, handles)
set(gcf,'Pointer','watch')
 set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
d=msgbox('WAIT CONNECTING TO WEB_CAM..............');
global cam_type cam_id  list_id format vid_obj list_name; 
try 
    release (vid_obj)
catch
end
list_id=get(hObject,'Value');list_name=get(hObject,'String');
set(handles.inform_pane,'String','connecting to webcam.......','FontSize',10.0);
vid_obj=videoinput(char(cam_type(1,list_id)),cam_id(1,list_id));
set(vid_obj,'FramesPerTrigger',1);
set(vid_obj,'TriggerRepeat',Inf);
triggerconfig(vid_obj,'Manual');
 suppourted_list=format(1,list_id).suppourtedformat;
 set(handles.format_list,'String',suppourted_list);
 c=char(list_name(list_id));
 b=sprintf('CONNECETED TO:%s \n\n FORMAT         :default ',c);
 set(handles.inform_pane,'String',b,'FontSize',10.0);
 set(handles.percentage,'String','请选择更高的相机分辨率');
 delete(d);
 set(gcf,'Pointer','arrow')
end


function format_list_Callback(hObject, eventdata, handles)
set(gcf,'Pointer','watch')
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
set(handles.inform_pane,'String','connecting to webcam.......','FontSize',10.0);
d=msgbox('WAIT CONNECTING TO WEB_CAM OF SELECTED FORMAT............');
global vid_obj cam_type cam_id list_id list_name;
delete(vid_obj);
si_no=get(hObject,'Value');
selected_format=get(hObject,'String');
vid_obj=videoinput(char(cam_type(1,list_id)),cam_id(1,list_id),char(selected_format(si_no)));
set(vid_obj,'FramesPerTrigger',1);
set(vid_obj,'TriggerRepeat',Inf);
triggerconfig(vid_obj,'Manual');
c=char(list_name(list_id));
 b=sprintf('CONNECETED TO:%s \n\n FORMAT         :%s ',c,char(selected_format(si_no)));
 set(handles.inform_pane,'String',b,'FontSize',10.0)
 set(handles.percentage,'String','开始识别');
delete(d);
set(gcf,'Pointer','arrow')
end
function format_list_CreateFcn(hObject, ~, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function winvideo_list_CreateFcn(hObject, eventdata, ~)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end




function refresh_button_Callback(hObject, eventdata, handles)
set(gcf,'Pointer','watch')
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
global vid_obj;
try
delete (vid_obj);
catch
end
webcamlist(hObject, eventdata, handles);
formatlist(hObject, eventdata, handles);
set(gcf,'Pointer','arrow')
end



function match_Callback(hObject, eventdata, handles)
%set(gcf,'Pointer','watch')
try
global Euc_dist  m Eigenfaces trainimages_path  image_info counter A dd file ;
Euc_dist = match_finding(dd, m,A, Eigenfaces);
%disp(Euc_dist);
 load(file,'image_info');
[min_dist,reg_no]=min(Euc_dist);
per=((0.5-(min_dist/ 1.0e+17))*100/0.5);
set(handles.percentage,'String',strcat(sprintf('匹配准确率:\n %f',per),'%'));
axes(handles.match_image1);axis off;
imshow(strcat(trainimages_path,'\',int2str(reg_no),'.jpg'));
if(image_info(1,reg_no).status)==1
    b='allowed';
    set(handles.inform_pane,'BackgroundColor','green');
else
    b='not allowed';
    set(handles.inform_pane,'BackgroundColor','red');
end
a=sprintf('姓名 :%s \n权限: %s\n匹配优先级:1',image_info(1,reg_no).name,b);
set(handles.inform_pane,'String',a);
match_sort (hObject, eventdata, handles);
counter=2;
set(gcf,'Pointer','arrow')
catch
    x=errordlg('database error');
    uiwait(x);
end
end

function match_sort (hObject, eventdata, handles)
global Euc_dist Train_Number prediction match
prediction=[];match=[];
for i=1:Train_Number
[min_dist,reg_no]=min(Euc_dist);
match=[match min_dist];
Euc_dist(1,reg_no)=inf;
prediction=[prediction reg_no];
end
end
function file_Callback(hObject, eventdata, handles)

end


function settings_Callback(hObject, eventdata, handles)

end


function help_Callback(hObject, eventdata, handles)

end




function close_Callback(hObject, eventdata, handles)
global vid_obj; 
try
delete(vid_obj);%release(vid_obj);;
delete(gcf);
catch
    delete(gcf);
end
end


function start_button_Callback(hObject, eventdata, handles)
set(gcf,'Pointer','watch')
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
global vid_obj state_1 faceDetector  faceImage1;
try 
    release(faceDetector)
catch
end
try
    b=msgbox('等待响应....');
state_1=0; axes(handles.live_axis);
start(vid_obj)
delete(b);
set(gcf,'Pointer','arrow')
while ~state_1
    %%videoframe = getsnapshot(vid_obj);
    trigger(vid_obj);
 videoframe = getdata(vid_obj,1);
    bbox = step(faceDetector, videoframe);
   try
    faceImage1    = imcrop(videoframe,bbox(1,:)+[-17 -17 30 30]);
    faceImage1 =imresize(faceImage1,[200 180]);
    axes(handles.face_axis);
    imshow(faceImage1)
   catch
   end
     try
    
     videoOut = insertObjectAnnotation(videoframe,'rectangle',bbox,'face');
     axes(handles.live_axis);
     imagesc(videoOut);
    
     catch
       end
end
catch
    set(gcf,'Pointer','arrow');
    delete(b);
    d=msgbox('请先选择 web_cam');
set(gcf,'Pointer','arrow');
uiwait(d);
end
end
function stop_button_Callback(hObject, eventdata, handles)
global  state_1   vid_obj;
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
try


state_1=1;
%delete(imaqfind);%release(vid_obj);;
stop(vid_obj);
catch
end
end



function snap_button_Callback(hObject, eventdata, handles)
global faceImage1 test_image database_path dd prediction;
prediction=[];
faceImage1=imresize(faceImage1,[200 180]);
test_image=faceImage1;
%faceImage1=('C:\ProgramData\facefinder\testimages\1.jpg');
axes(handles.main_image1)
dd=strcat(database_path,'\test.jpg');
imwrite(test_image,dd);
imshow(test_image);
    axes(handles.saveimage);
    imshow(test_image);
end



function figure1_CloseRequestFcn(hObject, eventdata, handles)
global vid_obj ;
try
%delete(imaqfind);
delete(vid_obj);%release(vid_obj);;
delete(hObject);
close (about);
catch
    delete(hObject);
    close(about);
end
end

function previous_Callback(hObject, eventdata, handles)
global trainimages_path counter prediction image_info inti match
if inti==1
    counter=counter-1;
else
end
inti=0;
axes(handles.match_image1);
try
    per=((0.5-(match(1,counter)/ 1.0e+17))*100/0.5);
set(handles.percentage,'String',strcat(sprintf('匹配准确率:\n %f',per),'%'));
counter=counter-1;
temp=strcat(trainimages_path,'\',int2str(prediction(1,counter)),'.jpg');
imshow(temp);
if(image_info(1,prediction(1,counter)).status)==1
    b='allowed';
    set(handles.inform_pane,'BackgroundColor','green');
else
    b='not allowed';
    set(handles.inform_pane,'BackgroundColor','red');
    beep;
end
a=sprintf('姓名 :%s \n权限: %s\n匹配优先级: %d',image_info(1,prediction(1,counter)).name,b,counter);
set(handles.inform_pane,'String',a);

catch
    counter=counter+1;
    set(handles.inform_pane,'String','没有可匹配数据');
end
end

function next_Callback(hObject, eventdata, handles)
global trainimages_path prediction counter image_info inti match
if inti==0
    counter=counter+1;
else
end
inti=1;
axes(handles.match_image1);
try
  per=((0.5-(match(1,counter)/ 1.0e+17))*100/0.5);
set(handles.percentage,'String',strcat(sprintf('match rate:\n %f',per),'%'));   
temp=strcat(trainimages_path,'\',int2str(prediction(1,counter)),'.jpg');
imshow(temp);
if(image_info(1,prediction(1,counter)).status)==1
    b='allowed';
    set(handles.inform_pane,'BackgroundColor','green');
else
    b='not allowed';
    set(handles.inform_pane,'BackgroundColor','red');
    beep;
end
a=sprintf('姓名 :%s \n权限: %s\n匹配优先级: %d',image_info(1,prediction(1,counter)).name,b,counter);
set(handles.inform_pane,'String',a,'FontSize',10);
counter=counter+1;
catch
  %counter=counter-1;
   
    set(handles.inform_pane,'String','没有可匹配数据');
end
end


function train_button_Callback(hObject, eventdata, handles)
set(gcf,'Pointer','watch')
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
global  trainimages_path m Eigenfaces  file A ;
load(file,'image_info');
[trainimage_matrix]=imagematrix_creator(trainimages_path);
[m,A,Eigenfaces] = Eigenface(trainimage_matrix);
set(gcf,'Pointer','arrow')
end


function save_Callback(hObject, eventdata, handles)
x=warndlg('请以管理员身份运行，否则可能导致数据丢失');
uiwait(x);
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
set(handles.primary_panel,'Visible','off');
set(handles.match,'Visible','off');
set(handles.train_button,'Visible','off');
set(handles.previous,'Visible','off');
set(handles.next,'Visible','off');
set(handles.save_panel,'Visible','on');
axes(handles.saveimage);axis off;
set(handles.save,'Visible','off')
end



function status_Callback(hObject, eventdata, handles)

end



function name_Callback(hObject, eventdata, handles)

end



function name_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function save_butt_Callback(hObject, eventdata, handles)
try
global Train_Number trainimages_path test_image image_info file
Train_Number=Train_Number+1;
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
d=strcat(trainimages_path,'\',int2str(Train_Number),'.jpg');

f=get(handles.name,'String');
if (strcmp(f,'type name')||(strcmp(f,''))==1)
    set(handles.inform_pane,'String','输入姓名为空')
else
image_info(1,Train_Number).name=f;
image_info(1,Train_Number).status=get(handles.status,'Value');
save(file,'image_info');
imwrite(test_image,d);
a=sprintf('数据编号: %d \n姓名 :%s \n权限: %d\n已保存',Train_Number,f,get(handles.status,'Value'));
 set(handles.inform_pane,'String',a);
 
end
catch
    h=errordlg('"请以管理员权限写入"');
uiwait(h);
end
end
function go_butt_Callback(hObject, eventdata, handles)
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
set(handles.primary_panel,'Visible','on');
set(handles.match,'Visible','on');
%set(handles.train_button,'Visible','on');
set(handles.previous,'Visible','on');
set(handles.next,'Visible','on');
set(handles.save_panel,'Visible','off');
set(handles.save,'Visible','on')
train_button_Callback(hObject, eventdata, handles)
end


function ok_Callback(hObject, eventdata, handles)
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
set(handles.primary_panel,'Visible','on');
set(handles.match,'Visible','on');
set(handles.train_button,'Visible','on');
set(handles.previous,'Visible','on');
set(handles.next,'Visible','on');
set(handles.save_panel,'Visible','off');
set(handles.save,'Visible','on')
set(handles.camlist,'Visible','on');
set(handles.snap_button,'Visible','on');
set(handles.mepan,'Visible','off');
set(handles.live_panel,'Visible','on');
set(handles.start_button,'Visible','on');
set(handles.stop_button,'Visible','on');
end


function about_menu_Callback(hObject, eventdata, handles)
%set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
%axes(handles.about_axes);axis off;
%imshow('about_menu.jpg');
%set(handles.primary_panel,'Visible','off');
%set(handles.match,'Visible','off');
%set(handles.train_button,'Visible','off');
%set(handles.previous,'Visible','off');
%set(handles.next,'Visible','off');
%set(handles.save_panel,'Visible','off');
%set(handles.save,'Visible','off');
%set(handles.camlist,'Visible','off');
%set(handles.snap_button,'Visible','off');
%set(handles.live_panel,'Visible','off');
%set(handles.start_button,'Visible','off');
%set(handles.stop_button,'Visible','off');
%set(handles.mepan,'Visible','on');
end




function open_Callback(hObject, eventdata, handles)
set(gcf,'Pointer','watch')
stop_button_Callback(hObject, eventdata, handles)
 set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
global test_image   faceDetector  faceImage1;
axes(handles.live_axis);axis off;
axes(handles.face_axis);axis off;
axes(handles.main_image1);axis off;
axes(handles.match_image1);axis off;
try 
    release(faceDetector)
catch
end
try
[name, folder]=uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files'},'specify an image file');
address=fullfile(folder,name);
set(handles.inform_pane,'String',fullfile(folder,name))
test_image=imread(address);
catch
    z=msgbox('未选择图像');
    test_image=0;
    uiwait(z);
    set(gcf,'Pointer','arrow') ;
    set(handles.nothing,'hai');
end
    axes(handles.live_axis);
    bbox = step(faceDetector, test_image);
try
    faceImage1    = imcrop(test_image,bbox(1,:)+[-17 -17 30 30]);
    faceImage1 =imresize(faceImage1,[200 180]);
    axes(handles.face_axis);
    imshow(faceImage1)
    videoOut = insertObjectAnnotation(test_image,'rectangle',bbox,'face');
    axes(handles.live_axis);
    imagesc(videoOut);
    snap_button_Callback(hObject, eventdata, handles);
catch
    set(gcf,'Pointer','arrow')  ;
   set(handles.inform_pane,'String','unable to detect face in the image','FontSize',10.0 );
   h=warndlg('未能识别到人脸数据');
   uiwait(h);
end
  set(gcf,'Pointer','arrow')  
end


function webcam_image_Callback(hObject, eventdata, handles)
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
    set(handles.webcam_image,'Checked','on');
    set(handles.snap_button,'Visible','on');
    set(handles.local_image,'Checked','off');
    set(handles.open,'Visible','off');
    set(handles.start_button,'Visible','on');
    set(handles.stop_button,'Visible','on');
   set(handles.inform_pane,'String','选择 web_cam')
   axes(handles.live_axis);axis off;
axes(handles.face_axis);axis off;
axes(handles.main_image1);axis off;
axes(handles.match_image1);axis off;
end

function local_image_Callback(hObject, eventdata, handles)
stop_button_Callback(hObject, eventdata, handles);
set(handles.snap_button,'Visible','off');
set(handles.inform_pane,'BackgroundColor',[0.73,0.83,0.96]);
set(handles.webcam_image,'Checked','off');
    set(handles.local_image,'Checked','on');
    set(handles.open,'Visible','on');
    set(handles.start_button,'Visible','off');
    set(handles.stop_button,'Visible','off');
    set(handles.open,'Visible','on');
    set(handles.inform_pane,'String','请打开图像')
    axes(handles.live_axis);axis off;
axes(handles.face_axis);axis off;
axes(handles.main_image1);axis off;
axes(handles.match_image1);axis off;
    
end

% --------------------------------------------------------------------

% --------------------------------------------------------------------

% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% --------------------------------------------------------------------
function nimbus_Callback(hObject, eventdata, handles)
javax.swing.UIManager.setLookAndFeel('com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel');
set(handles.Motif,'Checked','off');
set(handles.Untitled_7,'Checked','off');    
set(handles.windows,'Checked','off');
set(handles.nimbus,'Checked','on');
set(handles.metal,'Checked','off');
close(gcf);
facefinder();
end

% --------------------------------------------------------------------
function metal_Callback(hObject, eventdata, handles)
javax.swing.UIManager.setLookAndFeel('javax.swing.plaf.metal.MetalLookAndFeel');
set(handles.Motif,'Checked','off');
set(handles.Untitled_7,'Checked','off');    
set(handles.windows,'Checked','off');
set(handles.nimbus,'Checked','off');
set(handles.metal,'Checked','on');
close(gcf);
facefinder();
end

% --------------------------------------------------------------------
function windows_Callback(hObject, eventdata, handles)
javax.swing.UIManager.setLookAndFeel('com.sun.java.swing.plaf.windows.WindowsLookAndFeel');
set(handles.Motif,'Checked','of');
set(handles.Untitled_7,'Checked','off');
set(handles.windows,'Checked','on');
set(handles.nimbus,'Checked','off');
set(handles.metal,'Checked','off');
close(gcf);
facefinder();
end

% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
javax.swing.UIManager.setLookAndFeel('com.jgoodies.looks.plastic.Plastic3DLookAndFeel');
set(handles.Motif,'Checked','off');
set(handles.Untitled_7,'Checked','on');
set(handles.windows,'Checked','off');
set(handles.nimbus,'Checked','off');
set(handles.metal,'Checked','off');
close(gcf);
facefinder();
end


% --------------------------------------------------------------------
function Motif_Callback(hObject, eventdata, handles)
javax.swing.UIManager.setLookAndFeel('com.sun.java.swing.plaf.motif.MotifLookAndFeel');
set(handles.Motif,'Checked','on');
set(handles.Untitled_7,'Checked','off');
set(handles.windows,'Checked','off');
set(handles.nimbus,'Checked','off');
set(handles.metal,'Checked','off');
close(gcf);
facefinder();
end


% --------------------------------------------------------------------
function menu_open_Callback(hObject, eventdata, handles)
local_image_Callback(hObject, eventdata, handles);
 open_Callback(hObject, eventdata, handles);
end


% --------------------------------------------------------------------
function about_face_Callback(hObject, eventdata, handles)
h=about;
set(handles.figure1,'Visible','off');
uiwait(h);
set(handles.figure1,'Visible','on');
end


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes on key press with focus on figure1 and none of its controls.
function figure1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  structure with the following fields (see FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
end


% --- Executes during object creation, after setting all properties.
% function text10_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to text10 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over save.
function save_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end
