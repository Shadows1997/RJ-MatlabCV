f = rgb2gray(imread('raccoon.jpg'));
se=strel('square',3); 
gd=imdilate(f,se);    
ge=imerode(f,se);    
morph_grad=imsubtract(gd,ge); 
subplot(2,2,1);imshow(f,[]);title('(a)Original Image');
subplot(2,2,2),imshow(gd,[]);title('(b)Dilate');
subplot(2,2,3),imshow(ge,[]);title('(c)Erode');
subplot(2,2,4),imshow(morph_grad,[]);title('(d)Gradient');
