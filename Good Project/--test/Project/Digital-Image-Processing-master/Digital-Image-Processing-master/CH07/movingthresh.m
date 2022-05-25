function g = movingthresh(f,n,K)
%   ����movingthershʹ���ƶ�ƽ����ֵ�ָ�ͼ��
%   ����K������[0,1]֮��

%   ������������
f = tofloat(f);
[M,N] = size(f);
if (n < 1) || (rem(n,1) ~= 0)
    error('n must be in integer >= 1.')
end
if K < 0 || K > 1
    error('K must be a fraction in the range [0,1]')
end

%   ת��ͼ��Ϊ����
f(2:2:end,:) = fliplr(f(2:2:end,:));
f = f';
f = f(:)';

%   �����ƶ�ƽ��ֵ
maf = ones(1,n)/n;
ma = filter(maf,1,f);

%   ��ֵ����
g = f > K * ma;

%   ͼ���ʽ��
g = reshape(g,N,M)';

g(2:2:end, :) = fliplr(g(2:2:end, :));