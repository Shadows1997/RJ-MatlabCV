f =imread('���ͼ');
H=fftshift(hpfilter('ideal', 500, 500, 50));  % H�Ǿ��еĸ�ͨ�˲���
figure,mesh(H(1:10:500, 1 :10:500));          % ���������ʽ��ʾ��ͨ�˲���
figure,imshow(H, [ ]);                    % ��ͼ����ʽ��ʾ�˲���
 
PQ = paddedsize(size(f));  %����С
D0 = 0.05*PQ(1);          %��ֹƵ��
H = hpfilter('gaussian', PQ(1),PQ(2),D0);%��ͨ�˲���
g = dftfilt(f, H);         %��ͨ�˲�
figure,imshow(g,[  ]);
%**********��Ƶǿ���˲�***********************
f = imread('���ͼ');
figure,imshow(f);
PQ = paddedsize(size(f));
DO = 0.05 * PQ(1);
% HBW�ǰ�����˹��ͨ�˲���
HBW = hpfilter('btw',  PQ(1),  PQ(2),  DO,2);
H = 0.5+2 * HBW;           %H�Ǹ�Ƶǿ���˲���
gbw = dftfilt(f,HBW);     %��ͨ�˲�
gbw=gscale(gbw);         %��ֵ��һ����[o,1]
figure,imshow(gbw,[  ])  %��ʾ��ͨ�˲�ͼ��
ghf = dftfilt(f,H);          %��Ƶǿ���˲�
ghf = gscale(ghf);           %ֵ��һ��
figure,imshow(ghf,[  ])   %��ʾ��Ƶǿ���˲����ͼ��
ghe = histeq(ghf,256);     %ֱ��ͼ���⻯
figure,imshow(ghe,[  ])  %ֱ��ͼ���⻯���ͼ��



