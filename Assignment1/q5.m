% reading cameraman.tif from image processing toolbox
img=imread('sample_inp.png');
i=img;
m=[0 0 0; 1 1 1; -1 -1 -1]; %[-1 -1 -1; 2 2 2; -1 -1 -1];
% applying convolution
convImg=convn(i,m);
% plotting
figure; subplot(1,2,1); imshow(uint8(i)); title('original'); subplot(1,2,2); imshow(uint8(convImg), []);title('filtered');

img=uint8(imread('blur.jpg'));
cimg=convn(img,m);
cimg2=convn(img,m');
imwrite(uint8(cimg),'blur1.jpg');
imwrite(uint8(cimg2),'blur2.jpg');
img2=imadd(cimg,cimg2);
imwrite(uint8(img2),'blur_add.jpg');
img_double=im2double(img);
img_double=padarray(img_double,[1 1],0,'both');
img3=imadd(img2,img_double);
imwrite(img3,'blur3.jpg');
figure; imshow(img2);
figure; imshow(img3);