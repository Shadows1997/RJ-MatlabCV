function H = lpfilter(type,M,N,D0,n)
%   ����lpfilter���������ͨ�˲�����������˹�˲�������˹�˲���
%
%   ����ֵ�б�:type��D0��n
%   'ideal' �����ͨ�˲���D0��n���Ǳ����ṩ�ģ���D0����������
%   'btw'   ������˹��ͨ�˲���(ButterWorth lowpass filter����nĬ��ֵ��1.0��D0����������
%   'gaussian'  ��˹��ͨ�˲���,n�������ṩ��D0����������

%   ʹ�ú���dftuv�������ڼ���������������
[U,V] = dftuv(M,N);

%   �������
D = hypot(U,V);

%   �˲���
switch type
    case 'ideal'
        H = single(D <= D0);
    case 'btw'
        if(nargin == 4)
            n = 1;
        end
        H = 1./(1 + (D./D0).^(2*n));
    case 'gaussian'
        H = exp(-(D.^2)./(2*(D0^2)));
    otherwise
        error('Unknow filter type.')
end