
f =imread('���ͼ'); 
imshow(f);
[M,N]=size(f);   % M,N�ֱ���ͼ��f�Ŀ�Ⱥ͸߶�
 
%��f���и���Ҷ�任��û�ж�f����������0����
F=fft2(f);
sig=10;         % sig�Ǹ�˹�˲����ķ���
 
% lpfilter ����һ��Ƶ���ͨ�˲���
H =lpfilter('gaussian', M, N, sig);
G=H.*F;    % Ƶ���˲������˲�����F���
% �˲�������и���Ҷ��任��ȡ��ʵ�����õ��ռ�����˲����
g =real(ifft2(G));
% �����۵�ЧӦ��g��ͼ��ˮƽ��Ե��Щģ�������Ǵ�ֱ��Ե����ģ��
figure, imshow (g,[]);
PQ=paddedsize (size(f));  %PQ��������ͼ��ߴ磬Ĭ��Ϊ��M*2, N*2��
Fp=fft2(f, PQ(1), PQ(2));   %����Ҷ�任�����䵽ָ���ߴ�
Hp=lpfilter('gaussian', PQ(1),PQ(2), 2*sig);  %Hp��ָ���ߴ�ĵ�ͨ�˲���
Gp=Hp.*Fp;     %Ƶ���ͨ�˲�
gp=real(ifft2(Gp));  % ����Ҷ��任���õ��˲����
figure, imshow(gp,[  ]);  % ����Ҷ��任��Ľ����ԭͼ��ֻռ�����Ͻ�1/4
gpc=gp(1:size(f,1), 1:size(f,2));  %ֻȡ��任�����Ͻǲ���
figure, imshow(gpc, [  ]);  %���Կ���ͼ��Ĵ�ֱ��ˮƽ��Ե����ģ��


