% reading cameraman.tif from image processing toolbox
img=imread('cameraman.tif');
% converitng to double precision
i=(img);
m=[-1 -2 -1; 0 0 0; 1 2 1];
% applying convolution

convImg=conv2(i,m);
% plotting
figure; subplot(1,2,1); imshow(i); title('original'); subplot(1,2,2); imshow(convImg);title('filtered');

% the given filter is embossing the image

% transpose
n=m';
convImg2=conv2(i,n);
figure; subplot(1,2,1); imshow(i); title('original'); subplot(1,2,2); imshow(convImg2);title('filtered');

% difference
figure; subplot(1,2,1); imshow(convImg); title('first conv'); subplot(1,2,2); imshow(convImg2);title('transpose conv');
