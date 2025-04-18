%%=========================================================================================================================================
% Synopsis     : Testbench for polyphase Decimation experiment
%              : compares the two step operation of filtering followed by downsampling with single step operation of Polyphase Decimation
% Last updated : 2022-08-28
%%=========================================================================================================================================
clc;clear;close all

bits    = round(rand(1,10000));
out     = pskmod(bits,2);
b       = fir1(511,0.1);
out1    = filter(b,1,out);

b       = decimationFilter;
out2    = downsample(filter(b,1,out1),2);
out4    = downsample(filter(b,1,out1),4);

% Filter and downsampling
figure(1);
subplot(3,1,1);
spectrumVisualizer(out1,1e6);
subplot(3,1,2);
spectrumVisualizer(out2,0.5*1e6);
subplot(3,1,3);
spectrumVisualizer(out4,0.25*1e6);

% Polyphase Filtering
out2PolyPhase = PolyPhaseDecimator(b,2,out1);
out4PolyPhase = PolyPhaseDecimator(b,4,out1);
figure(2);
subplot(3,1,1);
spectrumVisualizer(out1,1e6);
subplot(3,1,2);s
pectrumVisualizer(out2PolyPhase,0.5*1e6);
subplot(3,1,3);
spectrumVisualizer(out4PolyPhase,0.25*1e6);

figure(3)
subplot(2,1,1)
plot(real(out2),'-r*');hold on;
plot(real(out2PolyPhase),'-bo');
legend('Filtered and downsampled','Polyphase interpolated')
subplot(2,1,2)
plot(real(out4),'-r*');hold on;
plot(real(out4PolyPhase),'-bo');
legend('Filtered and downsampled','Polyphase interpolated')

%%%%%%

