function filter = q7(inpSignals,outSignals)
    x = size(inpSignals,2);
    y = size(outSignals,2);
    len = x-y+1; % length of filter assuming zero padding and stride 1
    resultant = zeros(len,len);
    for i=1:len
        resultant(i,:) = inpSignals(i:i+len-1);
    end
    
    temp = outSignals';
    % Flipping done only once as it's a 1D signal
    filter = flipud(pinv(resultant)*temp(1:len))';
end