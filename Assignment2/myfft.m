function [out] = myfft(x)
    
    y = zeros(size(x));
    y1 = y;
    col = size(x,2);
    for i = 1:col
        y(:,i) = recursive_fft(x(:,i));
    end
    row = size(x,1);
    for i = 1:row
        y1(i,:) = recursive_fft(y(i,:).');
    end
    
    out = y1;
    
%     x=q1(imread('cameraman.tif'));
%     y=(fft2((imread('cameraman.tif'))));
%     flx = log(1+abs(x));
%     fmx=max(flx(:));
%     fly = log(1+abs(y));
%     fmy=max(fly(:));
%     figure;subplot(1,2,1);imshow(im2uint8(flx / fmx));subplot(1,2,2);imshow(im2uint8(fly / fmy));
end

