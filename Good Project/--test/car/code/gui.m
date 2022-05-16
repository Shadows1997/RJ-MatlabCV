function varargout = gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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
%������ʼ��
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% ======================����ͼ��===============================
function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile({'*.jpg';'*.bmp'}, 'File Selector');
I=imread([pathname '\' filename]);
handles.I=I;
guidata(hObject, handles);
axes(handles.axes1);
imshow(I);title('ԭͼ');

% ======================ͼ����===============================
function pushbutton2_Callback(hObject, eventdata, handles)
I=handles.I;
I1=rgb2gray(I);
I2=edge(I1,'roberts',0.18,'both');
axes(handles.axes2);
imshow(I1);title('�Ҷ�ͼ');
axes(handles.axes3);
imshow(I2);title('��Ե���');
se=[1;1;1];
I3=imerode(I2,se);%��ʴ����
se=strel('rectangle',[25,25]);
I4=imclose(I3,se);%ͼ����࣬���ͼ��
I5=bwareaopen(I4,2000);%ȥ�����ŻҶ�ֵС��2000�Ĳ���
[y,x,z]=size(I5);%����15��ά�ĳߴ磬�洢��x,y,z��
myI=double(I5);
tic      %tic��ʱ��ʼ��toc����
Blue_y=zeros(y,1);%����һ��y*1������
for i=1:y
    for j=1:x
        if(myI(i,j,1)==1)%���myIͼ������Ϊ��i��j����ֵΪ1����������ɫΪ��ɫ��blue��һ
            Blue_y(i,1)=Blue_y(i,1)+1;%��ɫ���ص�ͳ��
        end
    end
end
[temp MaxY]=max(Blue_y);
%Y����������ȷ��
%tempΪ����yellow_y��Ԫ���е����ֵ��MaxYΪ��ֵ������
PY1=MaxY;
while((Blue_y(PY1,1)>=5)&&(PY1>1))
    PY1=PY1-1;
end
PY2=MaxY;
while((Blue_y(PY2,1)>=5)&&(PY2<y))
    PY2=PY2+1;
end
IY=I(PY1:PY2,:,:);
%X����������ȷ��
Blue_x=zeros(1,x);%��һ��ȷ��x����ĳ�������
for j=1:x
    for i=PY1:PY2
        if(myI(i,j,1)==1)
            Blue_x(1,j)=Blue_x(1,j)+1;
        end
    end
end
PX1=1;
while((Blue_x(1,PX1)<3)&&(PX1<x))
    PX1=PX1+1;
end
PX2=x;
while((Blue_x(1,PX2)<3)&&(PX2>PX1))
    PX2=PX2-1;
end
PX1=PX1-1;%�Գ�������Ľ���
PX2=PX2+1;
dw=I(PY1:PY2-8,PX1:PX2,:);
t=toc;
axes(handles.axes4);imshow(dw),title('��λ����');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imwrite(dw,'dw.jpg');%����ɫ����д��dw�ļ���
a=imread('dw.jpg');%��ȡ����
b=rgb2gray(a);%������ͼ��ת��Ϊ�Ҷ�ͼ
imwrite(b,'�Ҷȳ���.jpg');%���Ҷ�ͼд���ļ�
g_max=double(max(max(b)));
g_min=double(min(min(b)));
T=round(g_max-(g_max-g_min)/3);%TΪ��ֵ������ֵ
[m,n]=size(b);
d=(double(b)>=T);%d:��ֵͼ��
imwrite(d,'��ֵ��.jpg');
%��ֵ�˲�ǰ
%�˲�
h=fspecial('average',3);
%����Ԥ������˲����ӣ�averageΪ��ֵ�˲���ģ��ߴ�Ϊ3*3
d=im2bw(round(filter2(h,d)));%ʹ��ָ�����˲���h��h����d����ֵ�˲�
imwrite(d,'��ֵ�˲�.jpg');
%ĳЩͼ����в���
%���ͻ�ʴ
se=eye(2);%��λ����
[m,n]=size(d);%������Ϣ����
if bwarea(d)/m/n>=0.365%�����ֵͼ���ж�������������������ı��Ƿ����0.365
    d=imerode(d,se);%�������0.365����и�ʴ
elseif bwarea(d)/m/n<=0.235%�����ֵͼ���ж�������������������ı�ֵ�Ƿ�С��0.235
    d=imdilate(d,se);%%���С����ʵ�����Ͳ���
end
imwrite(d,'����.jpg');
%Ѱ�����������ֵĿ飬�����ȴ���ĳ��ֵ������Ϊ�ÿ��������ַ���ɣ���Ҫ�ָ�
d=qiege(d);
[m,n]=size(d);
k1=1;
k2=1;
s=sum(d);
j=1;
while j~=n
    while s(j)==0
        j=j+1;
    end
    k1=j;
    while s(j)~=0 && j<=n-1
        j=j+1;
    end
    k2=j-1;
    if k2-k1>=round(n/6.5)
        [val,num]=min(sum(d(:,[k1+5:k2-5])));
        d(:,k1+num+5)=0;%�ָ�
    end
end
%���и�
d=qiege(d);
%�и��7���ַ�
y1=10;
y2=0.25;
flag=0;
word1=[];
while flag==0
    [m,n]=size(d);
    left=1;
    wide=0;
    while sum(d(:,wide+1))~=0
        wide=wide+1;
    end
    if wide<y1 %��Ϊ������� 
        d(:,[1:wide])=0;
        d=qiege(d);
    else
        temp=qiege(imcrop(d,[1 1 wide m]));
        [m,n]=size(temp);
        all=sum(sum(temp));
        two_thirds=sum(sum(temp([round(m/3):2*round(m/3)],:)));
        if two_thirds/all>y2
            flag=1;word1=temp;%word1
        end
        d(:,[1:wide])=0;d=qiege(d);
    end
end
%�ָ���ڶ����߸��ַ�
[word2,d]=getword(d);
[word3,d]=getword(d);
[word4,d]=getword(d);
[word5,d]=getword(d);
[word6,d]=getword(d);
[word7,d]=getword(d);
[m,n]=size(word1);
%����ϵͳ�����й�һ����СΪ40*20
word1=imresize(word1,[40 20]);
word2=imresize(word2,[40 20]);
word3=imresize(word3,[40 20]);
word4=imresize(word4,[40 20]);
word5=imresize(word5,[40 20]);
word6=imresize(word6,[40 20]);
word7=imresize(word7,[40 20]);
axes(handles.axes5);imshow(word1),title('1');
axes(handles.axes6);imshow(word2),title('2');
axes(handles.axes7);imshow(word3),title('3');
axes(handles.axes8);imshow(word4),title('4');
axes(handles.axes9);imshow(word5),title('5');
axes(handles.axes10);imshow(word6),title('6');
axes(handles.axes11);imshow(word7),title('7');
imwrite(word1,'1.jpg');
imwrite(word2,'2.jpg');
imwrite(word3,'3.jpg');
imwrite(word4,'4.jpg');
imwrite(word5,'5.jpg');
imwrite(word6,'6.jpg');
imwrite(word7,'7.jpg');
liccode=char(['0':'9' 'A':'Z' '����ԥ��³�¾���']);%�����弽ԥ���ɺ�����³������Ӷ���ʽ����¼���������ش�����
SubBw2=zeros(40,20);
l=1;
for I=1:7;
    ii=int2str(I);
    t=imread([ii,'.jpg']);
    SegBw2=imresize(t,[40 20],'nearest');
    SegBw2=double(SegBw2)>20;
    if l==1 %��һλ����ʶ��
        kmin=37;
        kmax=43;
    elseif l==2 %�ڶ�λ��ĸʶ��
        kmin=11;
        kmax=36;
    else l>=3   %����λ����ĸ������ʶ��
        kmin=1;
        kmax=36;
    end
    for k2=kmin:kmax
        fname=strcat('�ַ�ģ��\',liccode(k2),'.jpg');
        SamBw2=imread(fname);
        SamBw2=double(SamBw2)>1;
        for i=1:40
            for j=1:20
                SubBw2(i,j)=SegBw2(i,j)-SamBw2(i,j);
            end
        end
        %�൱������ͼ����õ�����ͼ
        Dmax=0;
        for k1=1:40;
            for l1=1:20
                if(SubBw2(k1,l1)>0 | SubBw2(k1,l1)<0)
                    Dmax=Dmax+1;
                end
            end
        end
        Error(k2)=Dmax;
    end
    Error1=Error(kmin:kmax);
    MinError=min(Error1);
    findc=find(Error1==MinError);
    Code(l*2-1)=liccode(findc(1)+kmin-1);
    Code(l*2)=' ';
    l=l+1;
end
axes(handles.axes12);imshow(dw),title(['���ƺ��룺',Code],'Color','b');
axes(handles.axes13);imhist(I1);title('�ҶȻ�ֱ��ͼ');

% ==========================�˳�ϵͳ============================
function pushbutton3_Callback(hObject, eventdata, handles)
close(gcf);



