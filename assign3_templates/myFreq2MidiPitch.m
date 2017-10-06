function  [pitchInMidi] = myFreq2MidiPitch(pitchInHz)

%% Converts fundamental pitch in Hz to pitch in MIDI
% Input:
%   pitchInHz:		(N x 1) float vector, fundamental pitch in Hz
% Output:
%   pitchInMidi:    (Nx 1) float vector, pitch in MIDI

% Check input dimensions 
[~,n] = size(pitchInHz);
if (n>1)
    error('illegal input signal');
end

%% Please write your code here

pitchInMidi = zeros(length(pitchInHz), 1);
n = 1;
while(n <= length(pitchInHz))
    pitchInMidi(n) = 69 + (12 * log2(pitchInHz(n)/440));
    n = n + 1;
end


end