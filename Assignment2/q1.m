y1=imread('cameraman.tif');
x=myfft(y1);
flx = log(1+abs(x));fmx=max(flx(:));
y=(fft2((imread('cameraman.tif'))));
fly = log(1+abs(y));fmy=max(fly(:));
figure;subplot(1,2,1);imshow(im2uint8(flx / fmx));subplot(1,2,2);imshow(im2uint8(fly / fmy));

y1=imread('saturn.png');
y1 = rgb2gray(y1);
y1=imresize(y1,[256,256]);
x=myfft(y1);
flx = log(1+abs(x));fmx=max(flx(:));
y=(fft2(y1));
fly = log(1+abs(y));fmy=max(fly(:));
figure;subplot(1,2,1);imshow(im2uint8(flx / fmx));subplot(1,2,2);imshow(im2uint8(fly / fmy));

y1=imread('peppers.png');
y1 = rgb2gray(y1);
y1=imresize(y1,[256,256]);
x=myfft(y1);
flx = log(1+abs(x));fmx=max(flx(:));
y=(fft2(y1));
fly = log(1+abs(y));fmy=max(fly(:));
figure;subplot(1,2,1);imshow(im2uint8(flx / fmx));subplot(1,2,2);imshow(im2uint8(fly / fmy));