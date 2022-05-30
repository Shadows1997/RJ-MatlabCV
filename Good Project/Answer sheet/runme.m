clc; clear all; close all;
warning off all;
%��ȡͼ��
I = imread('3.jpg');
%Ԥ����
I1 = Image_Normalize(I, 0);
%ƽ������ģ��ߴ�[3 3]��sigma��0.5��ƽ����ʽ����˹�˲�
hsize = [9 9];
sigma = 0.5;
I2 = Image_Smooth(I1, hsize, sigma, 0);
%�ҶȻ�
I3 = Gray_Convert(I2, 0);
%��ֵ��
bw2 = Image_Binary(I3, 0);
%hough�任
[~, ~, xy_long] = Hough_Process(bw2, I1, 0);
%�任б��
angle = Compute_Angle(xy_long);
%ͼ����ת
[I4, bw3] = Image_Rotate(I1, bw2, angle*1.8, 0);
%��̬ѧ�˲�
[bw4, Loc1] = Morph_Process(bw3, 0);
%hough�������ֽ���
[Len, XYn, xy_long] = Hough_Process(bw4, I4, 0);
%����ָ�
[bw5, bw6] = Region_Segmation(XYn, bw4, I4, 0);
%������
[stats1, stats2, Line] = Location_Label(bw5, bw6, I4, XYn, Loc1, 0);
%�������
[Dom, Aom, Answer, Bn] = Analysis(stats1, stats2, Line, I4);
%�ɼ��ж�
[pass,sum_scores] = contrastAnswers( Answer,10);
%���ɼ�д��results��grades.xls
[stuNum,studentInfo] = WriteInExcel( Bn ,sum_scores,pass);
%�����⿨ͼƬת�浽results�ļ���
Write_Results(I4,stuNum);