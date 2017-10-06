function [f0] = myComputeF0FromHPS(X, fs, order)

%% Computes the fundamental frequency f0 from a spectrogram using HPS
% Input:
%	X:			(fftLength / 2 x numBlocks) float matrix, mag. spectrogram
%	fs:			float, sampling rate in Hz
% 	order:		int, specifying the order for computing HPS
% Output:
% 	f0:			(numBlocks x 1) float vector, fundamental frequency of all blocks

%% Please insert your code here
size_x = size(X);
block_len = size_x(1);
fft_len = block_len * 2; 
numBlocks = size_x(2);
f0 = zeros(numBlocks, 1);
block_index = 1;
binFreqs = (fs/(fft_len))*[1:block_len];
while block_index <= numBlocks
    j = 2;
    spec = X(:,block_index);
    spec = spec .* spec;
    spec_copy = spec;
    while j <= order
        down_sampled = downsample(spec_copy, j);
        spec(1:length(down_sampled)) = spec(1:length(down_sampled)) .* down_sampled;
        j = j + 1;
    end
    [pks, locs] = findpeaks(spec);
    max = -1;
    max_i = -1;
    peaks_i = 1;
    while peaks_i <= length(pks)
        if max_i == -1
            max = pks(peaks_i);
            max_i = locs(peaks_i);
        else
            if pks(peaks_i) > max
                max = pks(peaks_i);
                max_i = locs(peaks_i);
            end
        end
        peaks_i = peaks_i + 1;
    end
    if(max == -1)
        f0(block_index) = 0;
    else
        f0(block_index) = binFreqs(max_i);
    end
    block_index = block_index + 1;
end


end
