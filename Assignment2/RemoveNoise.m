function [result] = RemoveNoise(fileName)
noise_img = imread(fileName);
[row, col, ch] = size(noise_img);
%figure;
%    imshow(img_noisy);

noise_red = noise_img(:, :, 1);
noise_green = noise_img(:, :, 2);
noise_blue = noise_img(:, :, 3);

fft_red_noise = fftshift(fft2(noise_red));
fft_green_noise = fftshift(fft2(noise_green));
fft_blue_noise = fftshift(fft2(noise_blue));

%figure;
subplot(1, 2, 1);
imshow(mat2gray(log(1 + abs(fft_red_noise))));

filter = ones(row, col);
length = 120;
width = 0.4;
% Along the length filtering
filter((ceil(row/2 + 1) - width):(ceil(row/2 + 1) + width), 1:length) = 0.0;
filter((ceil(row/2 + 1) - width):(ceil(row/2 + 1) + width), col-length:col) = 0.0;
filter((ceil(row/4 - 2) - width):(ceil(row/4 - 2) + width), 1:length) = 0.0;
filter((ceil(row/4 - 2) - width):(ceil(row/4 - 2) + width), col-length:col) = 0.0;
filter((ceil(3*row/4 + 4) - width):(ceil(3*row/4 + 4) + width), 1:length) = 0.0;
filter((ceil(3*row/4 + 4) - width):(ceil(3*row/4 + 4) + width), col-length:col) = 0.0;

% Along the breadth filtering
filter(1:length, (ceil(col/2 + 1) - width):(ceil(col/2 + 1) + width)) = 0.0;
filter(row-length:row, (ceil(col/2 + 1) - width):(ceil(col/2 + 1) + width)) = 0.0;
filter(1:length, (ceil(col/3 - 8) - width):(ceil(col/3 - 8) + width)) = 0.0;
filter(row-length:row, (ceil(col/3 - 8) - width):(ceil(col/3 - 8) + width)) = 0.0;
filter(1:length, (ceil(2*col/3 + 9) - width):(ceil(2*col/3 + 9) + width)) = 0.0;
filter(row-length:row, (ceil(2*col/3 + 9) - width):(ceil(2*col/3 + 9) + width)) = 0.0;
filter(1:length, (ceil(col/30 - 2) - width):(ceil(col/30 - 2) + width)) = 0.0;
filter(row-length:row, (ceil(col/30 - 2) - width):(ceil(col/30 - 2) + width)) = 0.0;
filter(1:length, (ceil(29*col/30 + 3) - width):(ceil(29*col/30 + 3) + width)) = 0.0;
filter(row-length:row, (ceil(29*col/30 + 3) - width):(ceil(29*col/30 + 3) + width)) = 0.0;

%figure;imshow(filter);

fft_red_filtered = fft_red_noise .* filter;
fft_green_filtered = fft_green_noise .* filter;
fft_blue_filtered = fft_blue_noise .* filter;

%figure;
subplot(1, 2, 2);imshow(mat2gray(log(1 + abs(fft_red_filtered))));

red_filtered = ifft2(ifftshift(fft_red_filtered));
green_filtered = ifft2(ifftshift(fft_green_filtered));
blue_filtered = ifft2(ifftshift(fft_blue_filtered));
%plot(red_filtered);
result = cat(3, uint8(abs(red_filtered)), uint8(abs(green_filtered)), uint8(abs(blue_filtered)));

% brighten up image
gamma = 0.45;
J = imadjust(result,[],[],gamma); 
figure;imshow(J, []);
end
