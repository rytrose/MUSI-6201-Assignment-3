function [errCentRms] = myEvaluation(estimation, annotation)

%% Evaluates the performance of a pitch tracker
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
%   errCentRms: float, rms of the difference between estInMidi and annInMidi 
% Note: 
%   1) please exclude the blocks when ann(i) == 0

[m1,n1] = size(estimation);
if (n1>1)
    error('illegal estimation vector ');
end
[m2,n2] = size(annotation);
if (n2>1)
    error('illegal annotation vector');
end
if (m1~=m2)
   error('size of estimation and annotation do not match'); 
end

%% Please write your code here, Follow the steps as per the comments
vals = zeros(length(estimation), 1);
n = 1;
count = 0;
while(n <= length(estimation))
   if(annotation(n) ~= 0)
      estInMidi = myFreq2MidiPitch(estimation(n));
      annInMidi = myFreq2MidiPitch(annotation(n));
      diff = 100 * abs(annInMidi - estInMidi);
      vals(n) = diff;
      count = count + 1;
   end
   n = n + 1;
end

% RMS = sqrt( (1/n)(x_1^2 + x_2^2 + ... + x_n^2) )
% https://en.wikipedia.org/wiki/Root_mean_square
vals_sqrd = vals.^2;
vals_summed = sum(vals_sqrd);
vals_div = vals_summed / count;
errCentRms = sqrt(vals_div);

end