function [out] = RESIZEBL(im, out_dims)

    inpRows = size(im,1);
    inpCols = size(im,2);
    outpRows = out_dims*size(im,1);
    outCols = out_dims*size(im,2);
     
    rowRatio = inpRows / outpRows;
    columnRatio = inpCols / outCols;

    % Define grid of co-ordinates in our image
    % Generate (x,y) pairs for each point in our image
    [cf, rf] = meshgrid(1 : outCols, 1 : outpRows);

    % Let r_f = r'*rowratio for r = 1,...,R'
    % Let c_f = c'*columnRatio for c = 1,...,C'
    % (rf, cf) is the Fractional location in input image of pixel from which to sample the output pixel(r', c') 

    rf = rf * rowRatio;
    cf = cf * columnRatio;

    % Integral part of (rf, cf)
    r = floor(rf);
    c = floor(cf);

    % Any values out of range, cap
    r(r < 1) = 1;
    c(c < 1) = 1;
    r(r > inpRows - 1) = inpRows - 1;
    c(c > inpCols - 1) = inpCols - 1;

    % (delta_R, delta_C) are fractional parts of the row and column locations, (rf, cf)
    delta_R = rf - r;
    delta_C = cf - c;

    % Get column major indices for each point we wish
    % to access. Helpls in removing for loops
    in1_ind = sub2ind([inpRows, inpCols], r, c);
    in2_ind = sub2ind([inpRows, inpCols], r+1,c);
    in3_ind = sub2ind([inpRows, inpCols], r, c+1);
    in4_ind = sub2ind([inpRows, inpCols], r+1, c+1);       

    % Now interpolate
    % Go through each channel for the case of colour
    % Create output image that is the same class as input (IMPORTANT)
    out = zeros(outpRows, outCols, size(im, 3));
    out = cast(out, class(im));

    for idx = 1 : size(im, 3)
        chan = double(im(:,:,idx)); % Get i'th channel
        % Interpolate the channel
        tmp = chan(in1_ind).*(1 - delta_R).*(1 - delta_C) + ...
                       chan(in2_ind).*(delta_R).*(1 - delta_C) + ...
                       chan(in3_ind).*(1 - delta_R).*(delta_C) + ...
                       chan(in4_ind).*(delta_R).*(delta_C);
        out(:,:,idx) = cast(tmp, class(im));
    end
