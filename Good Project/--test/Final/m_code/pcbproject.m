function varargout = miniproject(varargin)
% Prepared by OON CHEE YEE, 27737268
% MINIPROJECT MATLAB code for miniproject.fig
%      MINIPROJECT, by itself, creates a new MINIPROJECT or raises the existing
%      singleton*.
%
%      H = MINIPROJECT returns the handle to a new MINIPROJECT or the handle to
%      the existing singleton*.
%
%      MINIPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINIPROJECT.M with the given input arguments.
%
%      MINIPROJECT('Property','Value',...) creates a new MINIPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before miniproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to miniproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help miniproject

% Last Modified by GUIDE v2.5 04-Jun-2020 15:53:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @miniproject_OpeningFcn, ...
                   'gui_OutputFcn',  @miniproject_OutputFcn, ...
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


% --- Executes just before miniproject is made visible.
function miniproject_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to miniproject (see VARARGIN)

% Choose default command line output for miniproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes miniproject wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = miniproject_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in CheckDefects.
function CheckDefects_Callback(hObject, eventdata, handles)
% hObject    handle to CheckDefects (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Creating global variables to be used across Callback Function
global template test defect
% Display image in top right axes
axes(handles.axes6)
% by using image substraction between template and test, defects can be
% identified as diff_1 variable
defect= imabsdiff(template,test);
% display test image 
imshow (test)
% draw a boundingbox on each defect found on PCB
all_defect_bboxes = regionprops(defect,'BoundingBox','centroid');
hold on

for i = 1:length(all_defect_bboxes)
    % Accessing each bounding box to obtain its position and insert
    % annotation
    each_boundingbox = all_defect_bboxes(i).BoundingBox;
    rectangle('Position',each_boundingbox,'EdgeColor','r','LineWidth',1.5)    
end

% --- Executes on button press in DefectTypes.
function DefectTypes_Callback(hObject, eventdata, handles)
% hObject    handle to DefectTypes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Creating global variables to be used across Callback Function
global template test
% Determining defect types
axes(handles.axes7)
imshow (test)

% Negative image represents defects of Pin Holes, Open Circuit and
% Mousebite

Negative_Image =  test-template;
% Dealing with logical arrays
Negative_Image = Negative_Image>0;
% Assign bounding box to each Negative Image defect
neg_img_defect = regionprops(Negative_Image,'BoundingBox','centroid');
% Looping for each defect found from negative image
for i=1:length(neg_img_defect)
    neg_defectbox=neg_img_defect(i).BoundingBox;
    % modifying bounding box starting point (left corner), width and height
    neg_defectbox(1)=neg_defectbox(1)-2;
    neg_defectbox(2)=neg_defectbox(2)-2;
    neg_defectbox(3)=neg_defectbox(3)+6;
    neg_defectbox(4)=neg_defectbox(4)+6;
    
    % dealing with a smaller logical array with defects included
    neg_crop_test=imcrop(test,neg_defectbox);
    neg_crop_temp=imcrop(template,neg_defectbox);
    
    % invert the arrays since object detection is only applicable for white
    % parts   
     test_comp1=imcomplement(neg_crop_test);
     [neg_labelled_img, neg_num_object] = bwlabel(test_comp1);
     boundingbox_centroid = neg_img_defect(i).Centroid;
            negdefect_centr_x=boundingbox_centroid(1);
            negdefect_centr_y=boundingbox_centroid(2);
    % filling holes only applicable for white surrounding ares
    test_comp2_filled=imfill(test_comp1,'holes');
    temp = neg_img_defect(i).Centroid;
            holes_centr_x=temp(1);
            holes_centr_y=temp(2);
            % if filling up holes causing test image to be equal to
            % template image, the array being filled are classified as Pin
            % Hole defects
    if test_comp2_filled==imcomplement(neg_crop_temp)
        % insert annotation at position near hole centre
        text(holes_centr_x-20,holes_centr_y+30, 'PinHoles','Color','r','FontSize',14,'FontWeight','bold')
        rectangle('Position',neg_defectbox,'EdgeColor','c','LineWidth',1.5)
        % if more than one object detected, open circuit, morea than 1
        % white part (after inverting) detected, missing part in the mid
    elseif neg_num_object >1
                text(negdefect_centr_x-20,negdefect_centr_y+30, 'Open','Color','r','FontSize',14,'FontWeight','bold')
                rectangle('Position',neg_defectbox,'EdgeColor','c','LineWidth',1.5)   
    else
        % if negative image defects, not holes, not open circuit, objects
        % detected <1, means the PCB circuit is still connected partly,
        % only chunks of the part is missing, then MouseBite
                text(negdefect_centr_x-20,negdefect_centr_y+30, 'MouseBite','Color','r','FontSize',14,'FontWeight','bold')
                rectangle('Position',neg_defectbox,'EdgeColor','c','LineWidth',1.5)   
    end
end

% Positive image represents defects of Spurs, spurrious copper and short
% circuit
% opposite of negative image
    Positive_Image = template - test;
    % Dealing with logical arrays
    Positive_Image = Positive_Image > 0;
    pos_img_defect = regionprops(Positive_Image,'BoundingBox','centroid');
    
for i=1:length(pos_img_defect)
    pos_defectbox=pos_img_defect(i).BoundingBox;
    % modifying bounding box starting point (left corner), width and height
    pos_defectbox(1)=pos_defectbox(1)-2;
    pos_defectbox(2)=pos_defectbox(2)-2;
    pos_defectbox(3)=pos_defectbox(3)+6;
    pos_defectbox(4)=pos_defectbox(4)+6;
    % dealing with a smaller logical array with defects included
    pos_crop_test=imcrop(test,pos_defectbox);

    
    [pos_labelled_img, pos_num_object] = bwlabel(pos_crop_test);

    boundingbox_centroid = pos_img_defect(i).Centroid;
            posdefect_centr_x=boundingbox_centroid(1);
            posdefect_centr_y=boundingbox_centroid(2);
            %Same concept, if object more than 1, means surrounded by more
            %than 1 white parts, thus a black wire in between, indicating
            %short circuit
    if pos_num_object >1
        text(posdefect_centr_x-20,posdefect_centr_y+30, 'Short','Color','r','FontSize',14,'FontWeight','bold')
        rectangle('Position',pos_defectbox,'EdgeColor','y','LineWidth',1.5)
    else
        %using ratio concept of surrounding edge of the array to determine
        %if is spur or copper, if ratio larger than specified value,means
        %the defect is surrounded by white(1), hence, ratio is larger, vice
        %versa.
        %Calculating edges, ratio
    refedge= double(2*(pos_defectbox(3)+pos_defectbox(4))+4);
    topedge= sum(pos_crop_test(1,:));
    bottomedge= sum(pos_crop_test(end,:));
    leftedge= sum(pos_crop_test(:,1));
    rightedge= sum(pos_crop_test(:,end));
    sum_edges=topedge + bottomedge + leftedge + rightedge;
    ratio = sum_edges/refedge;
    
        if ratio < 0.7 
            text(posdefect_centr_x-20,posdefect_centr_y+30, 'Spur','Color','r','FontSize',14,'FontWeight','bold')
            rectangle('Position',pos_defectbox,'EdgeColor','y','LineWidth',1.5)
        else
            text(posdefect_centr_x-20,posdefect_centr_y+30, 'Copper','Color','r','FontSize',14,'FontWeight','bold')
            rectangle('Position',pos_defectbox,'EdgeColor','y','LineWidth',1.5)
        end
    end
end

% --- Executes on button press in ChooseTemplateButton.
function ChooseTemplateButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseTemplateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global template
      fullname_temp = uigetfile({'*.jpg*'}, 'Select File to Open');
           template = imread(fullname_temp);   
        axes(handles.axes1);
        template=im2bw(template,0.5);
        imshow (template);


% --- Executes on button press in ChooseTestButton.
function ChooseTestButton_Callback(hObject, eventdata, handles)
% hObject    handle to ChooseTestButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global test
      fullname_test = uigetfile({'*.jpg*'}, 'Select File to Open');
           test = imread(fullname_test);   
        axes(handles.axes2);
        test=im2bw(test,0.5);
        imshow (test);
