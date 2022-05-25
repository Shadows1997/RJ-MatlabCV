function g = localthresh(f,nhood,a,b,meantype)
%   ����localthreshִ�оֲ���ֵ����
f = tofloat(f);
SIG = stdfilt(f,nhood);
if nargin == 5 && strcmp(meantype,'global')
    MEAN = mean2(f);
else
    MEAN = localmean(f,nhood);
end

%   ��÷ָ�ͼ��
g = (f > a*SIG) & (f > b*MEAN);
