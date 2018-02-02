function [out] = RESIZENN(img, out_dim)
    scaleFactor = [out_dim out_dim];              % The resolution scale factors: [rows columns]
    origSize = size(img);                   % Get the size of your image
    newSize = max(floor(scaleFactor.*origSize(1:2)),1);  % Compute the new image size
    % max is used so that cases like when dimensions is 0 due to floor when scaling is less than 1 
    % Compute an upsampled set of indices:
    % Here min is used so that number isn't greater than original image
    rowIdx = round(((1:newSize(1))-0.5)./scaleFactor(1)+0.5),origSize(1);
    colIdx = round(((1:newSize(2))-0.5)./scaleFactor(2)+0.5),origSize(2);

    % Index old image to get new image:

    out = img(rowIdx,colIdx,:);
end
