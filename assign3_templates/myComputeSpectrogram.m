function [X, binFreqs] = myComputeSpectrogram(xb, fs, fftLength)

%% Computes the magnitude spectrogram from a matrix of audio blocks
% Input:
%	xb:			(blockSize x numBlocks) float matrix, blocks of audio
%	fs:			float, sampling rate in Hz
% 	fftLength:	int, usually power of 2, length of the fft
% Output:
% 	X:			(floor(fftLength / 2) + 1 x numBlocks) float matrix, magnitude spectrogram 
% 	binFreqs:	(floor(fftLength / 2) + 1 x 1) float vector, center frequencies(Hz) of all bins

%% Please insert your code here




end