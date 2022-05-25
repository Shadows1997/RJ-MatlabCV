function Write_Results(I,stuNum)
%函数功能：将答题卡图片转存到results文件夹
%输入参数：
%I——图片
imwrite(I, sprintf('results\\%s.png', stuNum));
