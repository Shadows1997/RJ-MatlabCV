function [U,V] = dftuv(M,N)
%   ����[u,v] = dftuv(M,N)�ṩ������㼰���������������������
%   u,v��M,N�ǵ�һ����

%   ������һ����
u = single(0:(M - 1));
v = single(0:(N - 1));

%   ������meshgrid��ʹ�õ�����
idx = find(u > M/2);
u(idx) = u(idx) - M;
idy = find(v > N/2);
v(idy) = v(idy) - N;

%   ������������
[V,U] = meshgrid(v,u);
