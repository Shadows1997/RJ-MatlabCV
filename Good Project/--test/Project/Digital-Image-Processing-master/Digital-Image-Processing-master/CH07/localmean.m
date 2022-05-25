function mean = localmean(f,nhood)
%   ����localmean����ֲ�ƽ��ֵ

if nargin == 1
    nhoog = ones(3)/9;
else
    nhood = nhood / sum(nhoog(:));
end
mean = imfilter(tofloat(f),nhood,'replicate');
