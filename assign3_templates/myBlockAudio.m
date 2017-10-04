function [xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs)

%% Blocks the input audio signal into overlapping buffers
% Input:
%   x:          N*1 float vector, input signal
%   blockSize:  int, size of each block
%   hopSize:    int, hop size
%   fs:         float, sampling rate in Hz
% Output:
%   xb:         (blockSize x numBlocks) float matrix, where numBlocks is 
%               the number of blocks
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block   
% Note:
%   1)  numBlocks depends on the length of the audio, zeropadding may be needed

% Check input dimensions 
[~,n] = size(x);
if (n>1)
    error('illegal input signal');
end
[m,n] = size(blockSize);
if (m ~= 1 && n ~=1)
    error('illegal blockSize');
end
[m,n] = size(hopSize);
if (m ~= 1 && n ~=1)
    error('illegal hopSize');
end
[m,n] = size(fs);
if (m ~= 1 && n ~=1)
    error('illegal fs');
end

%% Please write your code here
n = 1;
xb = zeros(blockSize, 0);
size_x = size(x);
timeInSec = zeros(0,1);
while(n <= size_x(1))
    i_s = n;
    i_e = n + blockSize - 1;
    
    % Calculate timestamp
    timestamp = i_s/fs;
    
    % Make block
    thisBlock = x(i_s : min(size_x(1), i_e) );
    this_block_size = size(thisBlock);
    if(this_block_size(1) < blockSize)
        thisBlock = vertcat(thisBlock, zeros((blockSize - this_block_size(1)), 1));
    end
    
    % Append block to xb
    xb = horzcat(xb, thisBlock);
    
    % Append timestamp
    timeInSec = vertcat(timeInSec, timestamp);
    
    % Hop
    n = n + hopSize;
end

end