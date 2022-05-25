function I = percentile2i(h,P)
%   ����percentile2i����һ�������İٷ�λ���ܶ�ֵ
%   I��P��[0,1]֮��

%   ���p��ֵ
if P < 0 || P > 1
    error('The percentilr must be in the rang [0,1]');
end

%   ��һ��ֱ��ͼ
h = h /sum(h);

% �ۼƷֲ�
C = cumsum(h);

idx = find(C >= P,1,'first');
I = (idx - 1)/(numel(h) - 1);