function varargout = calcEnclosedArea(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calcArea_OpeningFcn, ...
                   'gui_OutputFcn',  @calcArea_OutputFcn, ...
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


% --- Executes just before calcArea is made visible.
function calcArea_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calcArea (see VARARGIN)
axes(handles.axes4)    
set(gca,'xtick',[]);
set(gca,'ytick',[]);
set(gca,'color','none');
ii = imread('logo.png');
imshow(ii);
axes(handles.axes1)    
set(gca,'xtick',[]);
set(gca,'ytick',[]);
set(gca,'color','none');

% Choose default command line output for calcArea
handles.output = hObject;
handles.im = [];

% handles = resetPoints(handles);
handles.run = 0;

% a function handle for distance between two points
dist = @(a,b) sqrt( sum( (a-b).^2 ) );

%% Update handles structure
guidata(hObject, handles);

reset_Callback(hObject, eventdata, handles)

% UIWAIT makes calcArea wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calcArea_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- 加载图片
function loadImage_Callback(hObject, eventdata, handles)
    [fName folder ] = uigetfile('*.jpg;*.tif,*.bmp');
    axes(handles.axes1);
    if fName
        cd(folder);
        im = double( imread(fName) );
        handles.im = im;
        reset_Callback(hObject, eventdata, handles);
        guidata(hObject, handles);
    end
% hObject    handle to loadImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- 重置
function reset_Callback(hObject, eventdata, handles)
    temp = [1 0 0];
    set(handles.totalArea,'userdata',temp);
    A = temp(1);
    handles = resetPoints(handles);
    hold off;
    im = handles.im;
    [r c ans] = size(im);
    %%%%
    %% in the future will support an option not to reset the scale 
    %%%%
    x = (0:c-1) * A;
    y = (0:r-1) * A;
    if ~isempty(im)
        image(x,y,im/max(im(:)),'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
    else
        image([],'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
    end
    grid on
    hold on;
    guidata(handles.figure1, handles);
    
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- 鼠标响应.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
    
    temp = get(handles.totalArea,'userdata');
    A = temp(1);
    temp = get(gca,'CurrentPoint');
    x = temp(1,1)/A;  y=temp(1,2)/A;
    mouseButton = get(gcf,'SelectionType');
    switch mouseButton
        case 'normal'
            % 确定点
            switch get(handles.mode,'value')
                case 1  % calibrate scale
                    hPlot = plot(x*A,y*A,'b+','markersize',10,'Linewidth',2,'tag','point');
                    if size(handles.scaleCalibP,1) > 1
                        handles.scaleCalibP(2,:) = [x y];
                        if ishandle(handles.hScaleCalibP(2))
                            delete(handles.hScaleCalibP(2));
                        end
                        handles.hScaleCalibP(2) = (hPlot);
                    else
                        handles.scaleCalibP = [handles.scaleCalibP ; x y];
                        handles.hScaleCalibP = [handles.hScaleCalibP hPlot];
                    end
                    guidata(hObject,handles);
                case 2 % 区域计算            
                    handles.areaPoints = [handles.areaPoints ; x y];
                    hPlot = plot(x*A,y*A,'r.','markersize',14,'tag','point');
                    handles.hAreaPoints = [handles.hAreaPoints ; hPlot];
                    n = length(handles.hAreaPoints);
                    if n > 1
                        %% 根据点生成线
                        xx = handles.areaPoints([n-1 n],1);  yy = handles.areaPoints([n-1 n],2);

                        %% 防止线重叠
                        connectionsMat = [zeros(n,1) eye(n,n-1)];
                        cross = lineCrossExistingLines(n-1,n,connectionsMat,handles.areaPoints);
                        if cross
                            message = 'Line entered croses an existing line, point disregarded';
                            title = 'error';
                            msgbox(message,title,'error')
                            handles.areaPoints = handles.areaPoints(1:end-1,:);
                            delete(handles.hAreaPoints(end));
                            handles.hAreaPoints = handles.hAreaPoints(1:end-1,:);
                        else
                            hLine = plot(A*xx,A*yy, 'r', 'linewidth',2, 'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
                            handles.hAreaLines = [handles.hAreaLines hLine];
                        end
                    end
                    guidata(hObject,handles);
                case 3 % 计算长度
                    handles.lengthPoints = [handles.lengthPoints ; x y];
                    hPlot = plot(x*A,y*A,'g.','markersize',14,'tag','point');
                    handles.hLengthPointsPlot = [handles.hLengthPointsPlot ; hPlot];
                    if size(handles.lengthPoints,1) > 1
                        points = A*handles.lengthPoints([end-1 end],:);
                        hLine = plot(points(:,1), points(:,2), 'g', 'linewidth',2, 'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
                        handles.lengthLines = [handles.lengthLines hLine];
                        dist = sqrt( sum((diff(points).^2)) );
                        orientation = angle( diff(points) * [1 ; i] );
                        h = text(mean( points(:,1) ), mean( points(:,2) ) , num2str(dist), 'Rotation', orientation);
                        handles.hLengthData = [handles.hLengthData h];
                        temp = get(handles.totalArea,'userdata');
                        temp(3) = temp(3) + dist;
                        set(handles.totalArea,'userdata',temp);
                        updateTitle(handles);
                    end
                    guidata(hObject,handles);
                    
            end
                    
        case 'alt'
            switch get(handles.mode,'value')
                case 1  % 标定
                    if ~isempty(handles.hScaleCalibP)
                        if ishandle(handles.hScaleCalibP(end))
                            delete(handles.hScaleCalibP(end));
                        end
                        handles.hScaleCalibP = handles.hScaleCalibP(1:end-1);
                        handles.scaleCalibP = handles.scaleCalibP(1:end-1,:);
                    end
                    guidata(hObject,handles);
                    
                 case 2 % 面积计算
                    h = gco;
                    if strcmp( get(h,'type'), 'patch') || strcmp( get(h,'type'), 'text')
                        button = questdlg('Remove entire shape?','','Yes','No','Yes');
                        if strcmp( button, 'Yes')
                            tag = get(h,'tag');
                            h = findobj(handles.axes1,'tag',tag);
                        end
                            removeHandles= zeros(size(h));
                            for nn =1 : length(handles.hAreaPatches)
                                for mm=1 : length(h)
                                    if handles.hAreaPatches(nn) == h(mm)
                                        removeHandles(mm) = nn;
                                    end
                                end
                            end
                            handles.hAreaPatches(removeHandles) = [];
                            deletedArea = get(h,'userdata');
                            if iscell(deletedArea)
                                deletedArea = sum(cell2mat(deletedArea) );
                            end
                            delete(h);
                            temp = get(handles.totalArea,'userdata');
                            totalArea = temp(2);
                            totalArea = totalArea - deletedArea;
                            temp(2) = totalArea;
                            set(handles.totalArea,'userData',temp);
                            str = ['Total Area is = ' num2str(temp(2)) ];
                            set(handles.totalArea,'string',str);
                            guidata(hObject,handles);
                        return
                    end
                    n = length(handles.hAreaPoints);
                    if n > 1
                        delete(handles.hAreaLines(end));
                        handles.hAreaLines = handles.hAreaLines(1:end-1);
                    end
                    if  n > 0
                        handles.areaPoints = handles.areaPoints(1:end-1,:);
                        delete(handles.hAreaPoints(end));
                        handles.hAreaPoints = handles.hAreaPoints(1:end-1,:);
                    end
                    guidata(hObject,handles);
                    
                    case 3
                        % 长度计算
                        if size(handles.lengthPoints,1) > 0 
                            delete(handles.hLengthPointsPlot(end));
                            handles.hLengthPointsPlot = handles.hLengthPointsPlot(1:end-1);
                            handles.lengthPoints = handles.lengthPoints(1:end-1,:);
                            if length(handles.lengthLines) > 0
                                dist = str2double( get(handles.hLengthData(end),'string') );
                                delete(handles.lengthLines(end));
                                handles.lengthLines = handles.lengthLines(1:end-1);
                                delete(handles.hLengthData(end));
                                handles.hLengthData = handles.hLengthData(1:end-1);
                                temp = get(handles.totalArea,'userdata');
                                temp(3) = temp(3) - dist;
                                set(handles.totalArea,'userdata',temp);
                                updateTitle(handles);
                            end
                        end                            
                        guidata(hObject,handles);
                end
            end
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    function area=triangleArea(cord,A)
        cord = [cord ; cord(1,:)];
        dcord = diff(cord);
        points = zeros(3,1);
        for n=1:3
            points(n) = sqrt(sum(dcord(n,:).^2));
        end
        
        points=points*A;
        s = sum(points)/2;
        area = sqrt(s*(s-points(1))*(s-points(2))*(s-points(3)));

% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of run



% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    function valid=testIfCanCloseATriangle(n,m,k,connectionsMat,points,triangleCenters)
        % 测试三点是否在形状内部闭合一个矩形，
         % 测试新线不与任何现有线交叉
         % 如果新三角形中不包含任何现有三角形 
        valid = false;
        
        angle1 = mod( angle(( points(k,:)-points(n,:) )*[1 ;i])+2*pi, 2*pi);
        angle2 = mod( angle(( points(k,:)-points(m,:) )*[1 ;i])+2*pi, 2*pi);
        middleAngle = (angle1+angle2)/2;
        if max([angle1,angle2] - middleAngle) > pi/2
            % The middle angle croses the wide angle... Neads to flip it.
            middleAngle = mod(middleAngle+pi,2*pi);
        end
        if min( abs(middleAngle - [angle1,angle2]-pi/2) ) < 1e-1
            % The three points are on a straight line
            valid = false;
            return
        end
        dAngle = min( abs([angle2 angle1] - middleAngle) );
        p1 = points(k,:);
        
       % 判断矩形是否在整体形状中
         % 中角线应与奇数条轮廓线交叉 
        [a b] = find(connectionsMat == 1);
        f = find(b > a & b~=k & a ~=k);    % working only on half the matrix (not to count same line twice)
        a = a(f);   b=b(f);
        decision = false;
        itt = 0;
        nTests = 5;
        crossings = zeros(length(f),nTests);
        while ~decision && itt < 10
            for mm =1 :nTests 
                testAngle = middleAngle - dAngle + 2*dAngle*rand(1,1);
                p2 = points(k,:)+[cos(testAngle) sin(testAngle)]*-1e4; %don't know why the minus
                for nn=1 : length(f)
                    crossings(nn,mm) = doesLinesCross(p1,p2, points(a(nn),:), points(b(nn),:),'' );
                end        
            end
            itt = itt+1;
            crossingCount = sum( crossings );
            isPointIn = mod(crossingCount,2);

            %% 仅当所有行都返回相同的结果时，decision 才为真 
            
            decision = true;
            if  sum(abs(diff(isPointIn)))
                decision = false;
            end
        end %while ~decision & itt < 10
        %%%%%%%%%%%%%%%%

        if ~( isPointIn(1,1) )

            valid =false;
            return
        end
        
       
        cross = lineCrossExistingLines(m,n,connectionsMat,points);
        if cross
            valid = false;
            return
        end
        
     
        cross = zeros(3,1);
        for nn=1: size(triangleCenters,1)
            p1 = triangleCenters(nn,:);
            p2 = rand(1,2).*[1e4 1e4];
            cross(1) = doesLinesCross( p1,p2, points(m,:), points(n,:),'' );
            cross(2) = doesLinesCross( p1,p2, points(m,:), points(k,:), '' );
            cross(3) = doesLinesCross( p1,p2, points(k,:), points(n,:), '' );
            if mod( sum( cross),2 )
                valid = false;
                return;
            end
        end
        %%%%%
        valid = true;
                
        
        
    function cross = lineCrossExistingLines(p1,p2,connectionsMat,points)
        [a b] = find(connectionsMat);
        f = find( b > a &  ~(b==p1 & a==p2) & ~(a==p1 & b==p2) );
        N = length(f);
        a = a(f);   b=b(f);
        nn=0;
        cross = 0;
        while nn < N
            nn = nn+1;            
            cross = doesLinesCross( points(p1,:), points(p2,:), points(a(nn),:), points(b(nn),:),'EdgeCross' );
            if cross
                return
            end
        end
        
        
    function cross = doesLinesCross(pA1,pA2,pB1,pB2,mode)  
%         cross = 0     - 不重叠
%         cross = 1     - 重叠
        cross = 0;
        a1Sat = false;  a2Sat = false;
        d_a = pA2-pA1;
        d_b = pB2-pB1;
        a1 = tan( angle( d_a(1)+i*d_a(2) ) );
        if abs(a1) > 1e5
            a1Sat = true;
        end
        b1 = pA1(2)-a1*pA1(1);
        a2 = tan( angle( d_b(1)+i*d_b(2) ) );
        b2 = pB1(2)-a2*pB1(1);
        if abs(a2) > 1e5
            a2Sat = true;
        end
        if a2Sat
            if a1Sat
                
                if ~ ( min(pA1(2),pA2(2)) >= max(pB1(2),pB2(2)) || max(pA1(2),pA2(2)) <= min(pB1(2),pB2(2)) ) && abs( pA1(1)-pB1(1) ) < 0.1
                    cross = 1;
                    return
                end
            else
               
                x0 = (pB1(1)+pB2(1))/2;
                y0 = a1*x0+b1;
                if y0 >  min(pA1(2),pA2(2)) && y0 < max(pA1(2),pA2(2)) && ...
                    x0 > min(pA1(1),pA2(1)) && x0 < max(pA1(1),pA2(1)) && ...
                    y0 > min(pB1(2),pB2(2)) && y0 < max(pB1(2),pB2(2))
                    cross = 1;
                end
            end
        elseif a1Sat
               
                x0 = (pA1(1)+pA2(1))/2;
                y0 = a2*x0+b2;
                if y0 >  min(pA1(2),pA2(2)) && y0 < max(pA1(2),pA2(2)) && ...
                    y0 > min(pB1(2),pB2(2)) && y0 < max(pB1(2),pB2(2)) &&...
                     x0 > min(pB1(1),pB2(1)) && x0 < max(pB1(1),pB2(1))
                    cross = 1;
                end
        else
            if a1 ~= a2
                x0 = (b2-b1)/(a1-a2);
                y0 = a1*x0+b1;
                if x0 < max(pA2(1),pA1(1))-eps && x0 > min(pA2(1),pA1(1))+eps && x0 < max(pB2(1),pB1(1))-eps && x0 > min(pB2(1),pB1(1))+eps
                     cross =1;
                end
            elseif ~(max(pA1(1),pA2(1)) < min(pB1(1),pB2(1)) || min(pA1(1),pA2(1)) > max(pB1(1),pB2(1)) )
                cross =1;
                return
             end
        end
        
        if strcmp(mode,'EdgeCross')  && cross
            x = [pA1(1), pA2(1), pB1(1), pB2(1)];
            y = [pA1(2), pA2(2), pB1(2), pB2(2)];
            if min( (x-x0).^2 + (y-y0).^2 ) < 0.001
                cross =0;
            end
        end
        
function area = calcAreaMonteCarlo(points,connectionsMat)    
   
    
    Y = [ min(points(:,2)) max(points(:,2)) ];
    X = [ min(points(:,1)) max(points(:,1)) ];
    dx = X(2)-X(1);   dy = Y(2)-Y(1);
    
    count = 0;
    N = 1e4;
    n =0;
    hWaitBar = waitbar(0,'Monte Carloing','CreateCancelBtn','closereq ');
    while n < N && ishandle(hWaitBar);
        p1 = rand(1,2) .* [dx dy] + [X(1) Y(1)];
        p2 = rand(1,2).*[1e4 1e4];
        
        [a b] = find(connectionsMat == 1);
        f = find(b > a);    
        a = a(f);   b=b(f);
        crossings = zeros(length(f),1);
        for nn=1 : length(f)
            crossings(nn) = doesLinesCross(p1,p2, points(a(nn),:), points(b(nn),:),'EdgeCross' );
        end        
        crossingCount = sum( sign(crossings) );
        if mod(crossingCount,2)
           
           count = count+1;
        end
        if ~mod(n,1e3)
            waitbar(n/N,hWaitBar);
        end
        n = n+1;
    end % while n < N
    if ishandle(hWaitBar)
        delete(hWaitBar);
        totalA = dx*dy;
        area = count/N*totalA;
    else
        area = 0;
    end


% --- 不同功能选择
function mode_Callback(hObject, eventdata, handles)
    hPanels = [handles.scalePanel ; handles.areaPanel ; handles.lengthPanel ];
    set(hPanels,'visible','off');
    n = get(hObject,'value');
    set(hPanels(n),'visible','on');
    
    h = {handles.hScaleCalibP ,...
        handles.hAreaLines , handles.hAreaPatches, handles.hAreaPoints,...
        handles.lengthLines, handles.hLengthPointsPlot, handles.hLengthData};
    
    for nn =1: length(h)
        set(h{nn},'visible','off');
    end
    switch n
        case 1
             
                set(h{1},'visible','on');
        case 2
        % 面积数据
            set(h{ 2 },'visible','on');
            set(h{ 3 },'visible','on');
            set(h{ 4 },'visible','on');
        case 3 
            % 长度数据
            set(h{ 5 },'visible','on');
            set(h{ 6},'visible','on');
            set(h{ 7 },'visible','on');
    end
    
    updateTitle(handles);

% hObject    handle to mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns mode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mode

    function updateTitle(handles)
        n = get(handles.mode,'value');
        temp = get(handles.totalArea,'userdata');
        switch n
            case 1
                    
                    str = ['Scale = ' num2str(temp(1)) ' units/pixel'];
                    set(handles.totalArea,'string',str);
            case 2
            
                str = ['Total Area is = ' num2str(temp(2)) ];
                set(handles.totalArea,'string',str);
            case 3 
                
                str = ['Total Length is = ' num2str(temp(3)) ];
                set(handles.totalArea,'string',str);
        end


function mode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end





function calibDistance_Callback(hObject, eventdata, handles)
% hObject    handle to calibDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calibDistance as text
%        str2double(get(hObject,'String')) returns contents of calibDistance as a double


% --- Executes during object creation, after setting all properties.
function calibDistance_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calibDistance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


% --- Executes on button press in calibrateScale.
function calibrateScale_Callback(hObject, eventdata, handles)
    temp = get(handles.calibDistance,'string');
    dist = str2double( temp );
    if isempty(dist) || size(handles.scaleCalibP,1) < 2
        errorstring = {'输入无效或少点' ; '请单击两点并输入它们之间的距离'};
        errordlg(errorstring,'ERROR','on')
        return
    end
    x = handles.scaleCalibP(:,1);
    y = handles.scaleCalibP(:,2);
    dx = x(2)-x(1);
    dy = y(2)-y(1);
    A = dist / sqrt( dx^2 + dy^2 );
    temp = get(handles.totalArea,'userdata');
    oldA = temp(1);
    temp(1) = A;
    temp(2) = temp(2) * (A/oldA)^2;
    temp(3) = temp(3) * A/oldA;
    set(handles.totalArea,'userdata',temp);
    hIm = findobj(gca,'type','image');
    im = handles.im;
    [r c ans] = size(im);
    x = (0:c-1) * A;
    y = (0:r-1) * A;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    hold off;
    image(x,y,im/max(im(:)),'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
    grid on
    hold on;
%     axis image;
    handles.hScaleCalibP = [];
    handles.scaleCalibP = [];
    handles = resetPoints(handles);
    guidata(hObject,handles);
% hObject    handle to calibrateScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% --- Executes on button press in calcEnclosedArea.
function calcEnclosedArea_Callback(hObject, eventdata, handles)
    % --- Executes on button press in calc.
% function calc_Callback(hObject, eventdata, handles)
    f = findobj(handles.axes1,'tag','tempPatch');
    delete(f);
    
    temp = get(handles.totalArea,'userdata');
    A = temp(1);
    patchHandles = [];
    triangleCenters = [];
    points = handles.areaPoints;
    Npoints = size(points,1);
    if Npoints < 3
        message = '少于三点无法圈定面积';
        title = 'error';
        msgbox(message,title,'error')
        return
    end

    
    connectionsMat = or( [zeros(Npoints,1) eye(Npoints,Npoints-1)], [zeros(1,Npoints) ; eye(Npoints-1,Npoints)] );
    connectionsMat(1,Npoints) = 1; connectionsMat(Npoints,1) = 1;
    connectionsMat = int8(connectionsMat);
    
    cross = lineCrossExistingLines(1,Npoints,connectionsMat,handles.areaPoints);
    if cross
        message = 'The last line cross an existing line, correct the shape         (first & last points are connected)';
        title = 'error';
        msgbox(message,title,'error')
        return
    end
                            
    temp = get(handles.areaCalcMethode,'string');
    methode = temp{get(handles.areaCalcMethode,'value')};
    
    switch methode
        case 'Monte-Carlo'
            patchArea = calcAreaMonteCarlo(points,connectionsMat)*A^2;
            if patchArea
                hPatch = patch(A*points(:,1),A*points(:,2), 'r','facealpha',0.51,'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))',...
                    'userdata',patchArea,'tag',['patch ' num2str(handles.run)] );
                handles.hAreaPatches = [handles.hAreaPatches hPatch];
                x = mean(A*points(:,1));    y = mean(A*points(:,2));
                h = text(x,y,num2str(patchArea),'color','k','tag',['patch ' num2str(handles.run)],... 
                    'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
                handles.hAreaPatches = [handles.hAreaPatches h];
            end
        case 'Triangulation'
            triangles = 0;
            addedTriangle = false;
            ind=1;
            pointWorthChecking = ones(Npoints,1);
            while triangles < Npoints-3 && sum(pointWorthChecking)
                
                connections = find( connectionsMat(:,ind) );
                for n=1:length(connections)-1
                    for m =n+1:length(connections)
                        N = connections(n);
                        M = connections(m);                
                        if  ~connectionsMat( N, M) 
                            fit4triangle = testIfCanCloseATriangle( N,M,ind,connectionsMat,points,triangleCenters);
                            if fit4triangle
                                triangles = triangles+1;
                                pointWorthChecking(N) = 1;
                                pointWorthChecking(M) = 1;
                                h =  patch(A*points([M,N,ind],1),A*points([M,N,ind],2), 'r','tag','tempPatch','facealpha',0.51,...
                                    'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))'); 
                                patchHandles = [patchHandles h];
                                drawnow;
                                addedTriangle = true;
                                triangleCM = [ mean( points([M,N,ind],1) ) mean(points([M,N,ind],2) ) ];
                                triangleCenters = [triangleCenters ; triangleCM];
                                if ~connectionsMat( M,N )
                                    connectionsMat(M,N) = 2;
                                end
                                if ~connectionsMat(N,M)  
                                    connectionsMat(N,M) = 2;
                                end
                            end % if fit
                        end % if n~=curr & m ~=curr

                    end %for m
                end %for n

                pointWorthChecking(ind) = 0;

                loop = 0;
                while ~pointWorthChecking(ind) && loop < Npoints
                    loop = loop+1;
                    ind = ind+1;
                    ind = mod(ind-1,Npoints)+1;
                end

            end % while

            delete(patchHandles);   

            patchArea = 0;
            for ind =1 : Npoints
               b = find(connectionsMat(ind,:));
               a = ind;
               f = find(b > a);
                N = length(f);
                b = b(f);
                if N > 1
                    for n=1:N-1
                        for m =n+1:N
                            if connectionsMat(b(n),b(m))
                                trianglePoints = points([ind ,b(m) ,b(n)],:)*A;
                                area = triangleArea( trianglePoints,1);
                                patchArea = patchArea + area;
                                h = patch(trianglePoints(:,1),trianglePoints(:,2), 'r','facealpha',0.51,'EdgeColor','none',...
                                    'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))', 'userdata',area,...
                                    'tag',['patch ' num2str(handles.run)]);
                                handles.hAreaPatches = [handles.hAreaPatches h];
                            end
                        end %for m
                    end % for n
                end %if N >1
            end %for ind
            x = mean(A*points(:,1));
            y = mean(A*points(:,2));
            h = text(x,y,num2str(patchArea),'color','k','tag',['patch ' num2str(handles.run)],...
                'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
            handles.hAreaPatches = [handles.hAreaPatches h];
            
        case 'Matlab (polyArea)'
            temp = get(handles.totalArea,'userdata');
            A = temp(1);
            patchArea = polyarea(points(:,1),points(:,2))*A^2;
            hPatch = patch(A*points(:,1),A*points(:,2), 'r','facealpha',0.51,'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))',...
                'userdata',patchArea,'tag',['patch ' num2str(handles.run)] );
            handles.hAreaPatches = [handles.hAreaPatches hPatch];
            x = mean(A*points(:,1));
            y = mean(A*points(:,2));
            h = text(x,y,num2str(patchArea),'color','k','tag',['patch ' num2str(handles.run)],... 
                'ButtonDownFcn','calcArea(''axes1_ButtonDownFcn'',gca,[],guidata(gcbo))');
            handles.hAreaPatches = [handles.hAreaPatches h];

end 

    temp = get(handles.totalArea,'userdata');
    totalArea = temp(2);
    totalArea = totalArea + patchArea;
    temp(2) = totalArea;
    set(handles.totalArea,'userdata',temp);    
    
    updateTitle(handles);
    
    handles.areaPoints = [];
    delete(handles.hAreaPoints);
    handles.hAreaPoints = [];
    delete(handles.hAreaLines);
    handles.hAreaLines = [];
    handles.run = handles.run +1;
    
    guidata(hObject,handles);       
    
    
                

% hObject    handle to calcEnclosedArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function areaCalcMethode_Callback(hObject, eventdata, handles)
% hObject    handle to areaCalcMethode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns areaCalcMethode contents as cell array
%        contents{get(hObject,'Value')} returns selected item from areaCalcMethode


% --- Executes during object creation, after setting all properties.
function areaCalcMethode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to areaCalcMethode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc
    set(hObject,'BackgroundColor','white');
else
    set(hObject,'BackgroundColor',get(0,'defaultUicontrolBackgroundColor'));
end


function handles = resetPoints(handles)
    % Area measurment data
    handles.areaPoints = [];
    handles.hAreaPoints = [];
    handles.hAreaLines = [];
    handles.hAreaPatches = [];

    % scale calibration data
    handles.scaleCalibP = [];
    handles.hScaleCalibP = [];

    % length measures data
    handles.lengthPoints = [];
    handles.lengthLines = [];
    handles.hLengthPointsPlot = [];
    handles.hLengthData = [];
    
    temp = get(handles.totalArea,'userdata');
    temp(2) = 0;    temp(3) = 0;
    set(handles.totalArea,'userData',temp);
    mode_Callback(handles.mode, [], handles)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
