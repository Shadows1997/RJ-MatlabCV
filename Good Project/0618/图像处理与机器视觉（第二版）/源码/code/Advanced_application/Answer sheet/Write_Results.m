function Write_Results(I,stuNum)
%�������ܣ������⿨ͼƬת�浽results�ļ���
%���������
%I����ͼƬ
imwrite(I, sprintf('results\\%s.png', stuNum));
