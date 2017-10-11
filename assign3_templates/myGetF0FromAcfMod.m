function [f0] = myGetF0FromAcfMod(acfVector, fs)

%% Computes the pitch for a block of audio from the ACF vector
% Input:
%   acfVector:  (blockSize x 1) float vector, ACF of a block
%   fs:         float, sampling rate in Hz
% Output:
%   f0:         float, fundamental frequency of the block in Hz  

% check input dimensions
[~, n] = size(acfVector);
if (n>1)
    error('illegal input acfVector');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end


%% Please insert your code here
n = 1;
acfVector = medfilt2(acfVector, [5 1]);
max_val = -1;
max_i = 1;
mid = ceil(length(acfVector)/2);
flag = false;
f0 = 0;
peaks = myPeaks(acfVector);


% look for local maxima
while n <= length(peaks)
    maxes = [acfVector(floor(peaks(n))), acfVector(ceil(peaks(n)))];
    this_max = max(maxes);
    if(this_max >= max_val)
        max_val = this_max;
        max_i = peaks(n);
        flag = true;
    end
    n = n + 1;
end

if (flag)
    t0_in_samples = abs(mid - max_i);
    t0_in_sec = t0_in_samples/fs;
    f0 = 1/(t0_in_sec);
end

end
