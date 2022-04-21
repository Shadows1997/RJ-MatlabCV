%demo_multi_LBF.m
%Author: HSW
%Date；2015/4/12
%HARBIN INSTITUTE OF TECHNOLOGY
% Set Matlab
close all;
clear all;
clc;
% demo 编号,需要修改
ii = 1;
% Add path
addpath(genpath('Image\'));
addpath(genpath('Multi_LBF solver\'));
% save result path
SaveFilePath = 'Results\';

% Read Image
c0 = 2;
imgID = 6;

Img = imread('几何中心.jpg');
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
        % 产生随机位置
        figure;
        imshow(Temp);colormap;
        rand('seed',0);
        boardsize = 20; %距离边界的位置
        
        r = 10; %产生圆形时为半径，产生矩形时为(1/2)*边长
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
        % 用鼠标获取中心位置
        figure;
        imshow(Temp);colormap;
%         [centrex,centrey] = ginput; % 按右键结束
%         centrex = uint8(centrex(1));
%         centrey = uint8(centrey(1));
        centrex = 52; 
        centrey = 40; 
        boardsize = 20; %距离边界的位置
        iscircle = 1; % 产生圆形,否则产生矩形
        r = 10; %产生圆形时为半径，产生矩形时为(1/2)*边长
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
figure;
imshow(Temp);
hold on;
contour(phi_star,[0,0],'r','linewidth',1);
title('Initial Level set');


figure;
imshow(Temp);
hold on;
contour(phi_Multi_LBF,[0,0],'r','linewidth',1);
title('Results of Multi-LBF model');

figure;
imshow(Temp);
hold on;
contour(phi_Multi_LBF10,[0,0],'r','linewidth',1);
title('iter = 10 Results of Multi-LBF model');
figure;
imshow(Temp);
hold on;
contour(phi_Multi_LBF60,[0,0],'r','linewidth',1);
title('iter = 60 Results of Multi-LBF model');

MultiLBFFilePath = [SaveFilePath,'Multi_LBF\Demo',num2str(ii),'.bmp'];

SaveMultiLBF = phi_Multi_LBF >= 0;
figure(11),imshow(SaveMultiLBF)
% imwrite(SaveMultiLBF,MultiLBFFilePath,'bmp');

% 3.2 模型实现
% 
% 
% % Make a function satisfy Neumann boundary condition








