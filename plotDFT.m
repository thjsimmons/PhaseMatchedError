%======================================================================
% Github: https://github.com/thjsimmons
%======================================================================

%{
Plots magnitude & phase of time series DFT (upper half)
frequency axis scaled to [Hz] using the time array 't'
%}

clear;
% Load time series as .mat:
addpath('DATA');
x1_mat = load('DATA/x1.mat'); 
x2_mat = load('DATA/x2.mat'); 
t_mat  = load('DATA/t1.mat');
t = t_mat.data; 
x = x1_mat.data;

% Compute DFT of uniformly-resampled x(t):
[x, t] = avgResample(x, t);
[X, f] = DFT(x,t);
[~, maxIndex] = max(X);

%================== Plot time series x(t) vs. t ========================
figure(1);
plot(t, x);
title('x(t) (rad) vs. time (s)'); 
xlabel('time (s)'); ylabel('x(t)');

%=========== Plot DFT magnitude & phase |X(f)|, <X(f) vs. f ============
figure(2);
subplot(2,1,1);
plot(f,  2 * abs(X)); % why *2
xlim([0, f(10*maxIndex)]);
title('X(f) vs. frequency (Hz)'); xlabel('frequency (Hz)'); ylabel('|X(f)|');
subplot(2,1,2);
plot(f,  rad2deg(angle(X))); 
xlim([0, f(10*maxIndex)]);
title('<X(f) (degrees) vs. frequency (Hz)'); 
xlabel('frequency (Hz)'); ylabel('<X(f) (degrees)');

%==================== Plot DFT magnitude in dB  =========================
%{
subplot(3,1,3);
plot(f,  mag2db(abs(X))); % why *2
title('|X(f)| (dB) vs. frequency (Hz)'); 
xlabel('frequency (Hz)'); ylabel('|X(f)| (dB)');
%}



