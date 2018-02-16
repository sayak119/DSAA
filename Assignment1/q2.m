% reading cameraman.tif from image processing toolbox
img=imread('cameraman.tif');
i=(img);
% converitng to double precision
i1=im2double(img);
m=[-1 -2 -1; 0 0 0; 1 2 1];
% applying convolution

convImg=conv2(i,m);
convImg1=conv2(i1,m);
% plotting
figure; subplot(1,2,1); imshow(uint8(i)); title('original'); subplot(1,2,2); imshow(uint8(convImg));title('filtered');
figure; subplot(1,2,1); imshow(i1); title('original'); subplot(1,2,2); imshow(convImg1);title('filtered');

% the given filter is embossing the image

% transpose
n=m';
convImg2=conv2(i,n);
convImg3=conv2(i1,n);
figure; subplot(1,2,1); imshow(uint8(i)); title('original'); subplot(1,2,2); imshow(uint8(convImg2));title('filtered');
figure; subplot(1,2,1); imshow(i1); title('original'); subplot(1,2,2); imshow(convImg3);title('filtered');

% difference
figure; subplot(1,2,1); imshow(uint8(convImg)); title('first conv'); subplot(1,2,2); imshow(uint8(convImg2));title('transpose conv');
figure; subplot(1,2,1); imshow(convImg1); title('first conv'); subplot(1,2,2); imshow(convImg3);title('transpose conv');
