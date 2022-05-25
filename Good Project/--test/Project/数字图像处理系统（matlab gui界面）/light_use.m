function  newIm= light_use(im)
%im:原始图像;w 滤波窗体大小;isShow 是否显示中间过程
%
%
w = 3;
bk=double(im);
%最小值滤波
bk=ordfilt2(bk,1,ones(w,w),'symmetric');
%均值滤波
h=ones(w,w)/(w*w);
bk=imfilter(bk,h,'replicate');

%减掉亮度不均的结果
newIm=imsubtract(double(im),bk);
end