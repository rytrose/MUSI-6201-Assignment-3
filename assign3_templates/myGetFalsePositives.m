function [pfp] = myGetFalsePositives(estimation, annotation)

%% Computes the percentage of false positives
% Input:
%   estimation: (numBlocks x 1) float vector, estimated pitch (Hz) per block   
%   annotation: (numBlocks x 1) float vector, annotated pitch (Hz) per block
% Output:
% 	pfp:		float, percentage of false positives


%% Please insert your code here
i = 1;
num_neg = 0;
num_wrong = 0;
while i <= length(estimation)
    if annotation(i) == 0
       num_neg = num_neg + 1;
       if estimation(i) ~= 0
           num_wrong = num_wrong + 1;
       end
    end
    i = i + 1;
end

pfp = (num_wrong / num_neg) * 100.; %multiply by 100 to get percent

end