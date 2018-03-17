%Image1
img1 = imread('q4/Img1a.png');
F1 = fft(img1);
F = fft2(img1);

figure;subplot(1,4,1);imshow(F1);

F1 =  fftshift(F1);
F1 = abs(F1); 
F1 = log(F1+1); 
F1 = mat2gray(F1);
subplot(1,4,2);
imshow(F1);

subplot(1,4,3);
imshow(F);
F =  fftshift(F);
F = abs(F); 
F = log(F+1); 
F = mat2gray(F);

subplot(1,4,4);
imshow(F,[]); 
disp("Press Enter to continue");
pause;

%Image2
img1 = imread('q4/Img1b.png');
F1 = fft(img1);
F = fft2(img1);

figure;
subplot(1,4,1);
imshow(F1);

F1 =  fftshift(F1);
F1 = abs(F1); 
F1 = log(F1+1); 
F1 = mat2gray(F1);
subplot(1,4,2);
imshow(F1);

subplot(1,4,3);
imshow(F);
F =  fftshift(F);
F = abs(F); 
F = log(F+1); 
F = mat2gray(F);

subplot(1,4,4);
imshow(F,[]);
%disp("Press Enter to continue");
pause;

%Image3
img1 = imread('q4/Img2a.png');
F1 = fft(img1);
F = fft2(img1);

figure;
subplot(1,4,1);
imshow(F1);

F1 =  fftshift(F1);
F1 = abs(F1); 
F1 = log(F1+1); 
F1 = mat2gray(F1);
subplot(1,4,2);
imshow(F1);

subplot(1,4,3);
imshow(F);
F =  fftshift(F);
F = abs(F); 
F = log(F+1); 
F = mat2gray(F);

subplot(1,4,4);
imshow(F,[]);
disp("Press Enter to continue");
pause;

%Image4
img1 = imread('q4/Img2b.png');
F1 = fft(img1);
F = fft2(img1);

figure;
subplot(1,4,1);
imshow(F1);

F1 =  fftshift(F1);
F1 = abs(F1); 
F1 = log(F1+1); 
F1 = mat2gray(F1);
subplot(1,4,2);
imshow(F1);

subplot(1,4,3);
imshow(F);
F =  fftshift(F);
F = abs(F); 
F = log(F+1); 
F = mat2gray(F);

subplot(1,4,4);
imshow(F,[]);
disp("Press Enter to continue");
pause;