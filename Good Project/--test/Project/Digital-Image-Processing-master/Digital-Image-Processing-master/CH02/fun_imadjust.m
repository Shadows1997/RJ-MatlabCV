g = imread('Fig0203(a).tif');%��ȡԭʼͼ��
imshow(g);

g1 = imadjust(g,[0 1],[1 0],1);%�ԻҶȼ�ͼ����лҶȱ任
%figure,imshow(g1);

g2 = imcomplement(g); %imcomplement����ͬ��ɻ�ȡͼ��ĸ�Ƭ
%figure,imshow(g2);

g2 = imadjust(g,[0.5 0.75],[0 1]); %��0.5��0.75֮��ĻҶ���չ��[0 1]
g3 = imadjust(g,[ ],[ ],2); %ѹ���Ҷȼ��ĵͶ˲���չ���߶�
%figure,imshow(g3);

g4 = imadjust(g,stretchlim(g),[]); %stretchlim������ȡͼ��ĵͲ����͸߲���
%figure,imshow(g4);


