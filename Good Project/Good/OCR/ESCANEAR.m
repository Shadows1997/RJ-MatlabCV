function varargout = ESCANEAR(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ESCANEAR_OpeningFcn, ...
                   'gui_OutputFcn',  @ESCANEAR_OutputFcn, ...
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

function ESCANEAR_OpeningFcn(hObject, eventdata, handles, varargin)
cla(handles.axes1,'reset');
set(handles.axes1,'Visible','off');
axes(handles.axes4);
path = 'samplepicture2.png';
img = imread(path);
imshow(img);
axis off;
handles.output = hObject;
guidata(hObject, handles);

function varargout = ESCANEAR_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function BotonSalir_Callback(hObject, eventdata, handles)
exit; % Comando para salir de la aplicación


function BotonGrabar_Callback(hObject, eventdata, handles)
[nombre dire]=uigetfile('*.jpg','Abrir');
if nombre==0
    return
end
imagen=imread(fullfile(dire,nombre));
axes(handles.axes1)
image(imagen)
axis off
guidata(hObject, handles);



%----- Función Normalizar -----
% Función que será utilizada en los siguientes procesos


% --- Executes on button press in rbt1.
function rbt1_Callback(hObject, eventdata, handles)
function rbt2_Callback(hObject, eventdata, handles)
function grabar_Callback(hObject, eventdata, handles)
function uipanel15_SelectionChangeFcn(hObject, eventdata, handles)


% --- Executes on button press in agregar_voz.





% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(ESCANEAR);
PORTADA



% --- Executes on button press in BotonReproducir.
function BotonReproducir_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imagen=getimage(handles.axes1);
%title('INPUT IMAGE WITH NOISE')
% Convert to gray scale
if size(imagen,3)==3 %RGB image
    imagen=rgb2gray(imagen);
end
% Convert to BW
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);
% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,30);
%Storage matrix word from image
word=[ ];
re=imagen;
%Opens text.txt as file for write
fid = fopen('doc.doc', 'wt');
% Load templates
load templates
global templates
% Compute the number of letters in template file
num_letras=size(templates,2);
while 1
    %Fcn 'lines' separate lines in text
    [fl re]=lines(re);
    imgn=fl;
    %Uncomment line below to see lines one by one
    %imshow(fl);pause(0.5)    
    %-----------------------------------------------------------------     
    % Label and count connected components
    [L Ne] = bwlabel(imgn);    
    for n=1:Ne
        [r,c] = find(L==n);
        % Extract letter
        n1=imgn(min(r):max(r),min(c):max(c));  
        % Resize letter (same size of template)
        img_r=imresize(n1,[42 24]);
        %Uncomment line below to see letters one by one
         %imshow(img_r);pause(0.5)
        %-------------------------------------------------------------------
        % Call fcn to convert image to text
        letter=read_letter(img_r,num_letras);
        % Letter concatenation
        word=[word letter];
    end
    %fprintf(fid,'%s\n',lower(word));%Write 'word' in text file (lower)
    fprintf(fid,'%s\n',word);%Write 'word' in text file (upper)
    % Clear 'word' variable
    word=[ ];
    %*When the sentences finish, breaks the loop
    if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end    
end
fclose(fid);
%Open 'text.txt' file
open('doc.doc')


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1,'reset');
set(handles.axes1,'Visible','off');
