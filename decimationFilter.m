function b = decimationFilter
%UNTITLED Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 9.2 and the DSP System Toolbox 9.4.
% Generated on: 24-Jul-2018 14:09:21

% Equiripple Lowpass filter designed using the FIRPM function.

% All frequency values are in MHz.
Fs = 1;  % Sampling Frequency

N     = 63;    % Order
Fpass = 0.05;  % Passband Frequency
Fstop = 0.1;   % Stopband Frequency
Wpass = 1;     % Passband Weight
Wstop = 0.1;   % Stopband Weight
dens  = 20;    % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop], ...
           {dens});
end
