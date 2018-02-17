% Read images
subimg=imread('F1.jpg');
parimg=imread('Faces.jpg');

[subx, suby, subch]=size(subimg); % size of image F1
[parx, pary, parch]=size(parimg); % size of image Faces

% Find the sub image in parent image by traversing the image and checking 
% whether all the values in image size of parent image in
% sub image equals to parent image or not
% The place where maximum pixels match that's the sub image in parent image
maxi=-1;
bi=1;
bj=1;
for i=1:parx-subx
    for j=1:pary-suby
        sm=sum(sum(sum(parimg(i:i+subx-1, j:j+suby-1, :) == subimg))); % [1 2 3 4] == [1 5 3 2] ans = [1 0 1 0]
            if sm > maxi
                maxi=sm;
                bi=i;
                bj=j;
            end
    end
end

% Draw rectangle around the sub image when found in parent image
parimg(bi:bi+subx-1, bj:bj+2, :) = 0;
parimg(bi:bi+subx-1, bj+suby-3:bj+suby-1, :) = 0;
parimg(bi:bi+2, bj:bj+suby-1, :) = 0;
parimg(bi+subx-3:bi+subx-1, bj:bj+suby-1, :) = 0;
 % % % % % % 
figure; imshow(parimg);
imwrite(parimg,'find.jpg');