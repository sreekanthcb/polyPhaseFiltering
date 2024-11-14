%%=========================================================================================================================================
% Synopsis     : Testbench for polyphase interpolation experiment
%              : compares the two step operation of upsampling followed by filtering with single step operation of Polyphase interpolation
% Last updated : 2022-08-25
%%=========================================================================================================================================
clc;clear;close all

bits    = round(rand(1,10000));
out     = pskmod(bits,2);
b       = fir1(512,0.4);
out1    = filter(b,1,out);
m1 = 2; m2 = 2;
out2    = upsample(out1,m1);
out4    = upsample(out1,m2);

% Just upsampling
figure(1);
subplot(3,1,1);spectrumVisualizer(out1,1e6);
subplot(3,1,2);spectrumVisualizer(out2,m1*1e6);
subplot(3,1,3);spectrumVisualizer(out4,m2*1e6);

% appyling filter to upsampled data to avoid images
bout2        = out2Filter;
out2_filterd = filter(bout2,1,out2);
bout4        = out4Filter;
out4_filterd = filter(bout4,1,out4);
figure(2);
subplot(3,1,1);spectrumVisualizer(out1,1e6);
subplot(3,1,2);spectrumVisualizer(out2_filterd,m1*1e6);
subplot(3,1,3);spectrumVisualizer(out4_filterd,m2*1e6);

% Doing upsampling and filtering done together with polyphase filtering
out2PolyPhase = PolyPhaseInterpolator(bout2,m1,out1);
out4PolyPhase = PolyPhaseInterpolator(bout4,m2,out1);
figure(3);
subplot(3,1,1);spectrumVisualizer(out1,1e6);
subplot(3,1,2);spectrumVisualizer(out2PolyPhase,m1*1e6);
subplot(3,1,3);spectrumVisualizer(out4PolyPhase,m2*1e6);

% Time domain plots
figure(4)
subplot(2,1,1)
plot(real(out2_filterd),'-r*');hold on;
plot(real(out2PolyPhase),'-bo');
legend('Upsampled and filtered','Polyphase interpolated')
subplot(2,1,2)
plot(real(out4_filterd),'-r*');hold on;
plot(real(out4PolyPhase),'-bo');
legend('Upsampled and filtered','Polyphase interpolated')
