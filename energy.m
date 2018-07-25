%Engineer: Dake Song
%Project: first part:  draw the waveform 
%         second part: Creating noisy data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%first part:  draw the waveform 
% speech signal.
[s,fs] = audioread('C:\ALSP\SpeechData\test\clean\FAI_812A.wav');
N1 = length(s);
figure; set(0,'defaultfigurecolor','w');
subplot(311);
plot(s); grid;
title('clean FAI812A.wav'); xlabel('time(ms)');
subplot(312)
noisy1 = awgn(s, 10,'measured');plot(noisy1); grid;
title('noisy SNR=10 FAI812A.wav'); xlabel('time(ms)');
subplot(313)
noisy2 = awgn(s, 20,'measured');plot(noisy2); grid;
title('noisy SNR=20 FAI812A.wav'); xlabel('time(ms)');
%Energy
E1 = (1/N1)*sum(abs(s).^2);
En1 = (1/N1)*sum(abs(noisy1).^2);En2 = (1/N1)*sum(abs(noisy2).^2);
En = En1 - E1;      %SNR10 noise power
Enn  = En2 - E1;    %SNR20 noise power
figure; 
stem(1,E1, '+', 'LineWidth', 3); 
title('Energy of Clean and Noisy FAI812A.wav');hold on;
stem(2,En1, '+', 'red','LineWidth', 3);
stem(3,En2, '+', 'green','LineWidth', 3);
xlabel('Index'); ylabel('Energy Value'); 
legend('Clean','Noisy SNR=10','Noisy SNR=20');hold off;
figure;
stem(4, En, '+', 'LineWidth', 3);
title('Energy of Noise');hold on;
stem(5, Enn, '+', 'LineWidth', 3); 
legend('noise SNR=10','noise SNR=20');hold off;

%second part: Creating noisy data
wavPath = 'C:\ALSP\SpeechData\SNR=20\train\clean\';
wavDir  = dir([wavPath '*.wav']);
%write gaussian to speech data
for i = 1:length(wavDir)
   [s,fs] = audioread([wavPath wavDir(i).name]);
   N = length(s);                %length of the signal 
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

