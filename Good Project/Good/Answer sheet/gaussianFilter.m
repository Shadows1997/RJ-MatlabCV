function h = gaussianFilter( p2 ,p3 )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明

siz   = (p2-1)/2;
std   = p3;

[x,y] = meshgrid(-siz(2):siz(2),-siz(1):siz(1));
arg   = -(x.*x + y.*y)/(2*std*std);

h     = exp(arg);
h(h<eps*max(h(:))) = 0;

sumh = sum(h(:));
if sumh ~= 0,
    h  = h/sumh;
end;

end

