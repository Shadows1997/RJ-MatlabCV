function I2 = Image_Smooth(I1, hsize, sigma, flag)

if nargin < 4
    flag = 1;
end
if nargin < 2
    hsize = [3 3];
    sigma = 0.5;
end
h = gaussianFilter( hsize ,sigma );
I2 = imfilter(I1, h, 'replicate');
if flag
    figure('units', 'normalized', 'position', [0 0 1 1]);
    subplot(1, 2, 1); imshow(I1, []); title('平滑前图像', 'FontWeight', 'Bold');
    subplot(1, 2, 2); imshow(I2, []); title('平滑后图像', 'FontWeight', 'Bold');
end
