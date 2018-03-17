function [y] = recursive_fft(x)
%     x = x(:);
    % w is omega in the equation
    x = double(x);
    n = length(x);
    w = exp(-2*pi*i/n);
    if rem(n,2) == 0
      % Recursive divide and conquer
      k = (0:n/2-1)';
      w = w .^ k;
      u = recursive_fft(x(1:2:n-1));
      v = w.*recursive_fft(x(2:2:n));
      y = [u+v; u-v];
   else
      % The Fourier matrix
      j = 0:n-1;
      k = j';
      F = w .^ (k*j);
      y = F*x;
   
    end
     
end
