function [g,NR,SI,TI] = regiongrow(f,S,T)
%   ����regingrowʵ�ֻ��������������ָ�
%   f��������ָ��ͼ��
%   S�ǵ�һ����ֵ
%   T�ǰ�������ֵ�����飬Ҳ������ȫ����ֵ
%   S��T�����е�ֵ������[0,1]֮��
%   
%   g�Ƿָ���ͼ��
%   NR�����ҵ������������
%   SI�ǰ������ӵ��һ��ͼ��
%   TI�ǰ�������������֮ǰ����ͨ����ֵ���Ե����ص�һ��ͼ��

f = tofloat(f);
%   ���S�Ǳ�������������ͼ��
if numel(S) == 1
    SI = f == S;
    S1 = S;
else
    %   S������
    SI = bwmorph(S,'shrink',Inf);
    S1 = f(SI);
end

TI = false(size(f));
for K = 1 : length(S1)
    seedvalue = S1(K);
    S = abs(f - seedvalue) < T;
    TI = TI | S;
end

[g,NR] = bwlabel(imreconstruct(SI,TI));