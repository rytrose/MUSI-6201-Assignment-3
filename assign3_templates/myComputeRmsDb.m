function [rmsDb] = myComputeRmsDb(xb) 

%% Computes the rms amplitude of each block of the input blocked audio 
% Input:
%	xb: 	(blockSize x numBlocks) float matrix, blocked audio 
% Output:
%	rmsDb: 	(numBlocks x 1) float vector, rms amplitude of each block in decibels	


%% Please insert your code here

size_xb = size(xb);
num_blocks = size_xb(2);
block_len = size_xb(1);
rmsDb = zeros(num_blocks, 1);
i = 1;
while i <= num_blocks
    block = xb(:, i);
    squared = block .* block;
    summed = sum(squared);
    rms = sqrt(summed/block_len);
    rmsDb(i) = 20*(log(rms)); % get dB
    i = i + 1;
end
end