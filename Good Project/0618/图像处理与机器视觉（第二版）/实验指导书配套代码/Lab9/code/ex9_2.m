clc
clear all
close all
Symbols =['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' '-'];
P3 = [];
Result = [];
path = 'C:\Users\lenovo\Desktop\23149049ocr\';          % working Path
ext = '_bold.bmp';                  %Train Data Files Extension name
P = zeros(16,12,11);

% Read 0-9 digits data
for i = 0: 9
    file = [path,char(48 + i) , ext];      % char(48) => '0'
   
    P(:,:,i + 1) = imread(file);
    P3 = [P3,P(:,:,i + 1)'];
end
  %  imshow(P(:,:,1));

  i = i + 1;
% read other symbols
    file = [path,'dash' , ext];
   
    P(:,:,i + 1) = imread(file);
    P3 = [P3,P(:,:,i + 1)'];
 
% figure
%  for i = 1:11
%       subplot( 11, 1, i );
%       imshow( P(:,:,i) );
%   end

P1 = reshape(P3, 12 * 16, 11);

T = zeros(11,11);
for i = 1:11
    T(i,i) = 1;
end

[R,Q] = size(P1);
[S2,Q] = size(T);

S1 =   25;

net = newff(minmax(P1),[S1 S1 S2],{'logsig' 'logsig','logsig'},'traingdx');

net.performFcn = 'sse';
net.trainParam.goal = 0.05;
net.trainParam.show = 100;
net.trainParam.epochs = 5000;
net.trainParam.mc = 0.95;

[net,tr] = train(net,P1,T);


sept2 = []; %character segment start-end pos
Test1 =[];
file = [path,'test_bold2.bmp'];
a = imread(file);
figure;
subplot(3,24,1:24);
imshow(a);

j =1;
  seg1 = a;
  b = sum(seg1) ; % character segment, if the vertical projection is zero, means the space between characters.
  b(find(b < 1) ) = 0;
  c = find(b == 0);
  d= find(b > 0);
  e = find(c > d(1));
  sept2 = [];
  for k = 1:size(e,2) -1    % delete repeated zero position
    if( c(e(k + 1)) - c(e(k)) > 1) 
        sept2 = [sept2, c(e( k ))];
        sept2 = [sept2, c(e(k + 1))];
    end    
  end
  

 %figure
  sept2 = [1, sept2];
 chCount = size(sept2);

 for k = 1: chCount(2) -1
     Test1 = [];
    tmp = zeros(16,1);
     z =   a(:,sept2(k)+1: sept2( k+1 ));
    t1 = size(z);
    if(t1(2)> 2) 
        tt1 = size(z);
%         if( tt1(2) < 11)
%             z = [z,tmp];
%         end
        tt1 = size(z);
%         if( tt1(2) < 11)
%            z = [tmp,z,tmp];
%         end
        z2 = imresize(z,[16,12],'bilinear');
%         z2 = ~z2;
%         z2 = ~z2;
%         z2 = double(z2);
%         z2 = imnoise(z2,'salt & pepper', 0.4);
        z2 = ~z2;
        z2 = ~z2;
        subplot(3,24,24+k);
        imshow(z2);
        z2 =z2';
        
        z3 = reshape(z2,16 * 12,1);
        Test1 = [Test1,z3];
        %figure;
        %imshow(z2);
        %title('TRUE');
 %   end

