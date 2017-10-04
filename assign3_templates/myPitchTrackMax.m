function [f0, timeInSec] = myPitchTrackMax(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on Maximum Spectrum approach
% Input:
%   x:          (N x 1) float vector, input signal
%   blockSize:  int, block size of the blockwise process
%   hopSize:    int, hop size of the blockwise process
%   fs:         float, sample rate in Hz
% Output:
%   f0:         (numBlocks x 1) float vector, detected pitch (Hz) per block
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block


%% Please write your code here. Follow the steps as per the comments
% first block the audio and get the time-stamps per block (myBlockAudio)
[xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs);

% compute the magnitude spectrogram (myComputeSpectrogram)
spec = myComputeSpectrogram(xb, fs, blockSize * 2);

% compute f0 for each block by looking at the maximum of the spectrum of each block
i = 1;
spec_size = size(spec);
numBlocks = spec_size(2);
f0 = zeros(numBlocks, 1);

while i < numBlocks + 1
    pks = findpeaks(spec(:,i));
    f0(i) = max(pks);
    i = i + 1;
end