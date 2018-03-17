function [message]=q6(fileName)
[y1,fs1]=audioread(fileName)
x1 = fft(y1);
len = length(x1);

sample1 = x1(1:len/8);
% sample1
sample2 = x1(len/8 + 1: len/4);
sample3 = x1(len/4 + 1 : 3*(len/8));
sample4 = x1(3*(len/8) + 1: len/2);

sample_array = [sample1 sample2 sample3 sample4];
idx = [1 2 3 4];

% find all permutations and map it to the samples in sample_array
idx = perms(idx);

for i = 1:24
    
    % obtain whole of the row
    row = idx(i,:);
    message = ifft(vertcat(vertcat(sample_array(:,row(1)),sample_array(:,row(2)),sample_array(:,row(3)),sample_array(:,row(4))),vertcat(flipud(sample_array(:,row(1))),flipud(sample_array(:,row(2))),flipud(sample_array(:,row(3))),flipud(sample_array(:,row(4))))));
    audiowrite(strcat(int2str(i),'.wav'), message,32000);
end
end