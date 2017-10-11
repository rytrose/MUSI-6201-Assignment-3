function [f0, timeInSec] = myPitchTrackMod2(x, blockSize, hopSize, fs)

%% Blockwise Pitch Tracking based on a modified approach
% Input:
%   x:          (N x 1) float vector, input signal
%   blockSize:  int, block size of the blockwise process
%   hopSize:    int, hop size of the blockwise process
%   fs:         float, sample rate in Hz
% Output:
%   f0:         (numBlocks x 1) float vector, detected pitch (Hz) per block
%   timeInSec:  (numBlocks x 1) float vector, time stamp (sec) of each block

%% Please write your code here
% first block the audio and get the time-stamps per block (myBlockAudio)
[xb, timeInSec] = myBlockAudio(x, blockSize, hopSize, fs);

% assign memory for Output
f0 = zeros(size(xb,2), 1);

for i = 1:size(xb, 2)
	% compute the ACF for each block (myCompAcf)
	r = myCompAcf (xb(:, i), 1);
	
	% compute the pitch in Hz for each block, using median filtering (myGetF0FromACFMod)
	f0(i) = myGetF0FromAcfMod(r, fs);
end

end