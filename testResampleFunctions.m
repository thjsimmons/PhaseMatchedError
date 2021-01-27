%======================================================================
% Github: https://github.com/thjsimmons
% Date: 1/3/2021
%======================================================================

clear;
% Load time series as .mat:
addpath('DATA');
x1_mat  = load('DATA/x1.mat'); % q_rad
t1_mat = load('DATA/t1.mat');

% Zoom in on a small subset of x(t):
start_idx = 495;
end_idx = 515;
t = t1_mat.data(start_idx:end_idx) -  t1_mat.data(start_idx);
x = x1_mat.data(start_idx:end_idx);

% Get results of both Resample Functions:
[x_avg, t_avg] = avgResample(x, t);
nSamples = round(length(x)/3);
[x_res, t_res] = genResample(x, t, round(length(x)/3));

%================== Plot Variable Time-step =============================
% Plot time w.r.t. to N to see variable step
figure(1);

t_offset = zeros(1, length(t));
for i = 1: length(t) -1
    t_offset(i) = t(i+1);
end
t_offset(end) = t_offset(end-1);

plot(1:length(t), t_offset - t);
title('time-step vs N (variable-step)'); 
xlabel('N'); ylabel('time-step (s)');

%============== Averaged Resampled x(t) & original x(t) ===============
figure(2);
plot(t, x);
hold on;
plot(t_avg, x_avg);
hold off;
title('x(t), avg resampled x(t) vs. t (overlayed)'); 
xlabel('t (s)'); ylabel('x(t)');
%============== General Resampled x(t) & original x(t)=================
figure(3);
plot(t, x);
hold on;
plot(t_res, x_res);
hold off;
title('x(t), gen resampled x(t) vs. t (overlayed)'); 
xlabel('t (s)'); ylabel('x(t)');
%======================================================================
