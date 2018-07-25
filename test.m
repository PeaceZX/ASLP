wavPath = 'C:\ALSP\SpeechData\SNR=20\train\clean\';
wavDir  = dir([wavPath '*.wav']);

for i = 1:length(wavDir)
   [s,fs] = audioread([wavPath wavDir(i).name]);
   N = length(s);                %length of the signal
   p = awgn(s, 10, 'measured');  %in-built awgn function 
   SNR_dB = 20;
   snr = 10^(SNR_dB /10);        %SNR to linear scale
   Esym = sum(abs(s).^2) / (N);
   N0 = Esym / snr ;
   noiseSigma = sqrt(N0);
   n = noiseSigma*randn(N,1);
   y = s + n; 

%    figure;
%    subplot(211);
%    plot(1/fs:1/fs:N/fs, p);
%    subplot(212);
%    plot(1/fs:1/fs:N/fs, y);
   audiowrite([wavPath wavDir(i).name],y,fs)
end 

