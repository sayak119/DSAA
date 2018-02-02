% reading cameraman.tif from image processing toolbox
img=imread('sample_inp.png');
i=img;
m=[0 0 0; 1 1 1; -1 -1 -1]; %[-1 -1 -1; 2 2 2; -1 -1 -1];
% applying convolution
convImg=convn(i,m);
% plotting
figure; subplot(1,2,1); imshow(i); title('original'); subplot(1,2,2); imshow(convImg, []);title('filtered');

img=imread('blur.jpg');
cimg=convn(img,m);
cimg2=convn(img,m');
imwrite(cimg,'blur1.jpg');
imwrite(cimg2,'blur2.jpg');
img2=imadd(cimg,cimg2);
imwrite(img2,'blur_add.jpg');
img_double=im2double(img);
img_double=padarray(img_double,[1 1],0,'both');
img3=imadd(img2,img_double);
imwrite(img3,'blur3.jpg');
figure; imshow(img2);
figure; imshow(img3);