f =imread('���ͼ');
imshow(f);
F=fft2(f);       %��f������Ҷ��Ƶ
% S�Ƕ����任���Ƶ����ĵĸ���Ƶ��
S=fftshift(log(1+abs(F)));
S=gscale(S);      %��S��һ����[0��1]֮��
figure, imshow(S,[ ]);  %��ʾ����Ƶ��
 
h=fspecial ('sobel')  %��3*3 ��ֱ����Sobel�˲���
freqz2(h)     %��ʾ��h��Ӧ��Ƶ���˲�����ͼ��
PQ= paddedsize(size(f));  %����С
H=freqz2(h, PQ(1), PQ(2)); %������h��Ӧ��Ƶ���˲����������䵽ָ����С
H1=ifftshift(H);           %���H�ľ���
figure, imshow(abs(H),[  ]);  %��ʾƵ���˲�����Ƶ�ף���������������
figure, imshow(abs(H1),[  ]);  %������в������Ƶ�ף������������ĸ�����
 
gs=imfilter(double(f), h);    % ��f���пռ��˲���������ȡ0���߽�
gf=dftfilt(f, H1);           %��f ����Ƶ���˲���dftfilt ��������4.6��
figure, imshow(gs, [ ]);   %��ʾ�ռ��˲����
figure, imshow(gf, [ ]);    %��ʾƵ���˲����
 
figure, imshow(abs(gs), [ ]);  %ȡgs�ľ���ֵ��������ֵ
figure, imshow(abs(gs), [ ]);  %ȡgf�ľ���ֵ��������ֵ
 
d=abs(gs-gf);     %�Կռ��˲������Ƶ���˲����ȡ��ֵ
max(d(:))               %��ӡ��ֵ�����ֵ
min(d(:))              %��ӡ��ֵ����Сֵ

