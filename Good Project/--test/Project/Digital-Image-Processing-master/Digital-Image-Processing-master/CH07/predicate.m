function flag = predicate(region)
%   ����predicate�����ں���splitmerge�й���һ��predicate

sd = std2(region);
m = mean2(region);
flag = (sd > 10) & (m > 0) & (m < 125);
