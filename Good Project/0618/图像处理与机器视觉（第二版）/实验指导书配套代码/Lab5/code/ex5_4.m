clear all;
close all;
 f = imread('FigP0918.tif');
B1 = strel([0 0 0; 0 1 1; 0 1 0]);
B2 = strel([1 1 1; 1 0 0; 1 0 0]);
g = bwhitmiss(f, B1, B2);
subplot(1,2,1),imshow(f), title('a)Original Image')
subplot(1,2,2),imshow(g), title('b) Result Of HMT')

