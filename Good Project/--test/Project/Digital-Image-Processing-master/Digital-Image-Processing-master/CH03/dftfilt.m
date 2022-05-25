function g = dftfilt(f,H,classout)
%   ����dftfilt��������ͼ�񣬴������й���ϸ�ڣ�������˲���Ľ���Լ��޼�ͼ��
%   classout�Ĳ������£�
%   'original'    classout��Ĭ��ֵ�����ͼ��������ͼ������һ��
%   'fltpoint' ���ͼ���Ǹ������ͣ���f��H����double����ʱ�����ͼ��Ҳ��double����

%   ������ͼ��任Ϊ��������
[f,revertClass] = tofloat(f);

%   ��ȡ��������FFT
F = fft2(f,size(H,1),size(H,2));

%   �����˲��󷴱任
g = ifft2(H.*F);

%   �ü���ԭ���Ĵ�С
g = g(1:size(f,1),1:size(f,2));

%   ���classout��ֵ�����ݱ�����ֵת�����ͼ��
if nargin == 2 || strcmp(classout,'original')
    g = revertClass(g);
elseif strcmp(classout,'fltpoint')
    return
else
    error('Undefined class for the output image.')
end