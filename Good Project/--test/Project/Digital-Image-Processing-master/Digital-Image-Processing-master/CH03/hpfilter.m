function H = hpfilter(type,M,N,D0,n)
%   ����hpfilter���������ָ�ͨ�˲�����D0����λ����
%   'ideal' �����ͨ�˲���
%   'btw'   ������˹��ͨ�˲���
%   'gaussian'  ��˹��ͨ�˲���

if nargin == 4
    n = 1;
end
Hlp = lpfilter(type,M,N,D0,n);
H = 1 - Hlp;
