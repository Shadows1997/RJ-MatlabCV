%对待检测PCB板预处理
function tgtImg = pre_process(srcImg)

srcImg_gray = rgb2gray(srcImg);%灰度化
src_med = medfilt2(srcImg_gray);%中值滤波
src_bw = im2bw(src_med);%二值化
src_spur = bwmorph(src_bw,'spur',8);%去除物体小的分支
src_fill = bwmorph(src_spur,'fill');填充孤立黑点
tgtImg = bwmorph(src_fill,'clean');%去除孤立亮点
end

%对标准PCB板图像进行预处理
%认为标准PCB板的图像为理想情况，只用进行灰度化和二值化
function tgtImg = getBW(srcImg)

srcImg_gray = rgb2gray(srcImg);%灰度化
srcImg_bw = im2bw(srcImg_gray);%二值化
tgtImg = srcImg_bw;

end

