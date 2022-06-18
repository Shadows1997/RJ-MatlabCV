clc; clear all; close all;
warning off all;
I = imread('2.jpg');
%I = imread('images\\1.jpg');
I1 = Image_Normalize(I, 1);
hsize = [3 3];
sigma = 0.5;
I2 = Image_Smooth(I1, hsize, sigma, 1);
I3 = Gray_Convert(I2, 1);
bw2 = Image_Binary(I3, 1);
figure; subplot(1, 2, 1); imshow(I, []); title('ԭͼ��');
subplot(1, 2, 2); imshow(bw2, []); title('��ֵ��ͼ��');
[~, ~, xy_long] = Hough_Process(bw2, I1, 1);
angle = Compute_Angle(xy_long);
[I4, bw3] = Image_Rotate(I1, bw2, angle*1.8, 1);
[bw4, Loc1] = Morph_Process(bw3, 1);
[Len, XYn, xy_long] = Hough_Process(bw4, I4, 1);
[bw5, bw6] = Region_Segmation(XYn, bw4, I4, 1);
[stats1, stats2, Line] = Location_Label(bw5, bw6, I4, XYn, 255, 1);
[Dom, Aom, Answer, Bn] = Analysis(stats1, stats2, Line, I4);