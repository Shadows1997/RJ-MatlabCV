%对处理后的结果进行显示：

std_rgb =  imread('standard.jpg');
figure()
imshow(std_rgb);
title('标准图');
stdImg = getBW(std_rgb);
figure()
imshow(stdImg);
title('标准图二值化');
src_rgb = imread('untreated.jpg');
figure()
imshow(src_rgb);
title('待检测图');
srcImg = pre_process(src_rgb);
figure()
imshow(srcImg);
title('待检测图二值化');

