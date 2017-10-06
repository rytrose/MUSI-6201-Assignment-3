testWave = vertcat( mySine( 441, 44100, 1  ), mySine( 882, 44100, 1  ));

[f0, timeInSec] = myPitchTrackMax(testWave, 1024, 512, 44100);
figure(1)
plot(timeInSec, f0);
title('f0 of test wave detected with myPitchTrackMax');
xlabel('time in s')
ylabel('freq in hz')

diff = zeros(length(f0), 1);
n = 1;
while(n <= length(diff))
    val = 441;
    if (timeInSec(n) >= 1)
        val = 882;
    end
    diff(n) = abs(val - f0(n));
    n = n + 1;
end
figure(2);
plot(timeInSec, diff);
title('absolute error of test wave detected with myPitchTrackMax');
xlabel('time in s')
ylabel('abs err in hz')

[f0, timeInSec] = myPitchTrackHps(testWave, 1024, 512, 44100);
figure(3)
plot(timeInSec, f0);
title('f0 of test wave detected with myPitchTrackHps');
xlabel('time in s')
ylabel('freq in hz')

diff = zeros(length(f0), 1);
n = 1;
while(n <= length(diff))
    val = 441;
    if (timeInSec(n) >= 1)
        val = 882;
    end
    diff(n) = abs(val - f0(n));
    n = n + 1;
end
figure(4);
plot(timeInSec, diff);
title('absolute error of test wave detected with myPitchTrackHps');
xlabel('time in s')
ylabel('abs err in hz')

[onset_seconds1, duration_seconds1, pitch_frequency1, quantized_frequency1] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y1, fs] = audioread('01-D_AMairena.wav');
estimation1 = myPitchTrackMax(y1, 1024, 512, fs);
[rms1, pfp1, pfn1] = myEvaluation2(estimation1, pitch_frequency1);

[onset_seconds2, duration_seconds2, pitch_frequency2, quantized_frequency2] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[y2, fs] = audioread('24-M1_AMairena-Martinete.wav');
estimation2 = myPitchTrackMax(y2, 1024, 512, fs);
[rms2, pfp2, pfn2] = myEvaluation2(estimation2, pitch_frequency2);

[onset_seconds3, duration_seconds3, pitch_frequency3, quantized_frequency3] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y3, fs] = audioread('63-M2_AMairena.wav');
estimation3 = myPitchTrackMax(y3, 1024, 512, fs);
[rms3, pfp3, pfn3] = myEvaluation2(estimation3, pitch_frequency3);

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackMax - rms, pfp, pfn')
[rms1, pfp1, pfn1]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackMax - rms, pfp, pfn')
[rms2, pfp2, pfn2]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackMax - rms, pfp, pfn')
[rms3, pfp3, pfn3]


[onset_seconds1, duration_seconds1, pitch_frequency1, quantized_frequency1] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y1, fs] = audioread('01-D_AMairena.wav');
estimation1 = myPitchTrackHps(y1, 1024, 512, fs);
[rms1, pfp1, pfn1] = myEvaluation2(estimation1, pitch_frequency1);

[onset_seconds2, duration_seconds2, pitch_frequency2, quantized_frequency2] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[y2, fs] = audioread('24-M1_AMairena-Martinete.wav');
estimation2 = myPitchTrackHps(y2, 1024, 512, fs);
[rms2, pfp2, pfn2] = myEvaluation2(estimation2, pitch_frequency2);

[onset_seconds3, duration_seconds3, pitch_frequency3, quantized_frequency3] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y3, fs] = audioread('63-M2_AMairena.wav');
estimation3 = myPitchTrackHps(y3, 1024, 512, fs);
[rms3, pfp3, pfn3] = myEvaluation2(estimation3, pitch_frequency3);

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackHps - rms, pfp, pfn')
[rms1, pfp1, pfn1]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackHps - rms, pfp, pfn')
[rms2, pfp2, pfn2]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackHps - rms, pfp, pfn')
[rms3, pfp3, pfn3]




[onset_seconds1, duration_seconds1, pitch_frequency1, quantized_frequency1] = textread('01-D_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y1, fs] = audioread('01-D_AMairena.wav');
estimation1_acf_40 = myPitchTrack(y1, 1024, 512, fs, 'acf',-40);
estimation1_max_40 = myPitchTrack(y1, 1024, 512, fs, 'max',-40);
estimation1_hps_40 = myPitchTrack(y1, 1024, 512, fs, 'hps',-40);
estimation1_acf_20 = myPitchTrack(y1, 1024, 512, fs, 'acf',-20);
estimation1_max_20 = myPitchTrack(y1, 1024, 512, fs, 'max',-20);
estimation1_hps_20 = myPitchTrack(y1, 1024, 512, fs, 'hps',-20);
[rms1_acf_40, pfp1_acf_40, pfn1_acf_40] = myEvaluation2(estimation1_acf_40, pitch_frequency1);
[rms1_max_40, pfp1_max_40, pfn1_max_40] = myEvaluation2(estimation1_max_40, pitch_frequency1);
[rms1_hps_40, pfp1_hps_40, pfn1_hps_40] = myEvaluation2(estimation1_hps_40, pitch_frequency1);
[rms1_acf_20, pfp1_acf_20, pfn1_acf_20] = myEvaluation2(estimation1_acf_20, pitch_frequency1);
[rms1_max_20, pfp1_max_20, pfn1_max_20] = myEvaluation2(estimation1_max_20, pitch_frequency1);
[rms1_hps_20, pfp1_hps_20, pfn1_hps_20] = myEvaluation2(estimation1_hps_20, pitch_frequency1);

[onset_seconds2, duration_seconds2, pitch_frequency2, quantized_frequency2] = textread('24-M1_AMairena-Martinete.f0.Corrected.txt','%f %f %f %f'); 
[y2, fs] = audioread('24-M1_AMairena-Martinete.wav');
estimation2_acf_40 = myPitchTrack(y2, 1024, 512, fs, 'acf',-40);
estimation2_max_40 = myPitchTrack(y2, 1024, 512, fs, 'max',-40);
estimation2_hps_40 = myPitchTrack(y2, 1024, 512, fs, 'hps',-40);
estimation2_acf_20 = myPitchTrack(y2, 1024, 512, fs, 'acf',-20);
estimation2_max_20 = myPitchTrack(y2, 1024, 512, fs, 'max',-20);
estimation2_hps_20 = myPitchTrack(y2, 1024, 512, fs, 'hps',-20);
[rms2_acf_40, pfp2_acf_40, pfn2_acf_40] = myEvaluation2(estimation2_acf_40, pitch_frequency2);
[rms2_max_40, pfp2_max_40, pfn2_max_40] = myEvaluation2(estimation2_max_40, pitch_frequency2);
[rms2_hps_40, pfp2_hps_40, pfn2_hps_40] = myEvaluation2(estimation2_hps_40, pitch_frequency2);
[rms2_acf_20, pfp2_acf_20, pfn2_acf_20] = myEvaluation2(estimation2_acf_20, pitch_frequency2);
[rms2_max_20, pfp2_max_20, pfn2_max_20] = myEvaluation2(estimation2_max_20, pitch_frequency2);
[rms2_hps_20, pfp2_hps_20, pfn2_hps_20] = myEvaluation2(estimation2_hps_20, pitch_frequency2);


[onset_seconds3, duration_seconds3, pitch_frequency3, quantized_frequency3] = textread('63-M2_AMairena.f0.Corrected.txt','%f %f %f %f'); 
[y3, fs] = audioread('63-M2_AMairena.wav');
estimation3_acf_40 = myPitchTrack(y3, 1024, 512, fs, 'acf',-40);
estimation3_max_40 = myPitchTrack(y3, 1024, 512, fs, 'max',-40);
estimation3_hps_40 = myPitchTrack(y3, 1024, 512, fs, 'hps',-40);
estimation3_acf_20 = myPitchTrack(y3, 1024, 512, fs, 'acf',-20);
estimation3_max_20 = myPitchTrack(y3, 1024, 512, fs, 'max',-20);
estimation3_hps_20 = myPitchTrack(y3, 1024, 512, fs, 'hps',-20);
[rms3_acf_40, pfp3_acf_40, pfn3_acf_40] = myEvaluation2(estimation3_acf_40, pitch_frequency3);
[rms3_max_40, pfp3_max_40, pfn3_max_40] = myEvaluation2(estimation3_max_40, pitch_frequency3);
[rms3_hps_40, pfp3_hps_40, pfn3_hps_40] = myEvaluation2(estimation3_hps_40, pitch_frequency3);
[rms3_acf_20, pfp3_acf_20, pfn3_acf_20] = myEvaluation2(estimation3_acf_20, pitch_frequency3);
[rms3_max_20, pfp3_max_20, pfn3_max_20] = myEvaluation2(estimation3_max_20, pitch_frequency3);
[rms3_hps_20, pfp3_hps_20, pfn3_hps_20] = myEvaluation2(estimation3_hps_20, pitch_frequency3);

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackAcf - -40 thresh - rms, pfp, pfn')
[rms1_acf_40, pfp1_acf_40, pfn1_acf_40]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackAcv - -40 thresh -  rms, pfp, pfn')
[rms2_acf_40, pfp2_acf_40, pfn2_acf_40]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackAcf - -40 thresh -  rms, pfp, pfn')
[rms3_acf_40, pfp3_acf_40, pfn3_acf_40]

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackMax - -40 thresh - rms, pfp, pfn')
[rms1_max_40, pfp1_max_40, pfn1_max_40]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackMax - -40 thresh -  rms, pfp, pfn')
[rms2_max_40, pfp2_max_40, pfn2_max_40]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackMax - -40 thresh -  rms, pfp, pfn')
[rms3_max_40, pfp3_max_40, pfn3_max_40]

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackHps - -40 thresh - rms, pfp, pfn')
[rms1_hps_40, pfp1_hps_40, pfn1_hps_40]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackHps - -40 thresh -  rms, pfp, pfn')
[rms2_hps_40, pfp2_hps_40, pfn2_hps_40]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackHps - -40 thresh -  rms, pfp, pfn')
[rms3_hps_40, pfp3_hps_40, pfn3_hps_40]






disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackAcf - -20 thresh - rms, pfp, pfn')
[rms1_acf_20, pfp1_acf_20, pfn1_acf_20]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackAcv - -20 thresh -  rms, pfp, pfn')
[rms2_acf_20, pfp2_acf_20, pfn2_acf_20]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackAcf - -20 thresh -  rms, pfp, pfn')
[rms3_acf_20, pfp3_acf_20, pfn3_acf_20]

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackMax - -20 thresh - rms, pfp, pfn')
[rms1_max_20, pfp1_max_20, pfn1_max_20]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackMax - -20 thresh -  rms, pfp, pfn')
[rms2_max_20, pfp2_max_20, pfn2_max_20]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackMax - -20 thresh -  rms, pfp, pfn')
[rms3_max_20, pfp3_max_20, pfn3_max_20]

disp('----------------------------------------------')
disp('audio file 1 - myPitchTrackHps - -20 thresh - rms, pfp, pfn')
[rms1_hps_20, pfp1_hps_20, pfn1_hps_20]
disp('----------------------------------------------')
disp('audio file 2 - myPitchTrackHps - -20 thresh -  rms, pfp, pfn')
[rms2_hps_20, pfp2_hps_20, pfn2_hps_20]
disp('----------------------------------------------')
disp('audio file 3 - myPitchTrackHps - -20 thresh -  rms, pfp, pfn')
[rms3_hps_20, pfp3_hps_20, pfn3_hps_20]
