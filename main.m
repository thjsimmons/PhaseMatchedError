%======================================================================
% Github: https://github.com/thjsimmons
%======================================================================

%{
Plots phase matched error between x1(t), x2(t), compares to 
unmatched error.

Phase matched error is the error between 2 time series x1(t) & x2(t)
when the phase difference of the fundamental frequencies is removed.
This allows error to be split into 2 components: a constant phase error, 
and a time varying amplitude error. 

%}

% Load 2 time series as .mats:
addpath('DATA');
t_mat = load('t1.mat'); 
x1_mat = load('x1.mat'); 
x2_mat = load('x2.mat'); 
t = t_mat.data ;    
x1 = x1_mat.data;
x2 = x2_mat.data;

% Phase shift x2(t) to match x1(t):
[x1, x2, t_res, phase, idx_offset] = phaseMatch(x1, x2 , t);
x2_shift = shift(x2, idx_offset);

%================== Overlay plots x1(t), x2(t) ==========================
figure(1)
subplot(2,1,1);
plot(t, x1);
hold on;
plot(t, x2);
hold off;
title(['Unmatched x1(t), x2(t) vs. time (s), phase error = ',num2str(rad2deg(phase)), ' degrees']); 
xlabel('time (s)'); ylabel('angle (rad)');

%============== Overlay plots x1(t), phase shifted x2(t) ================
subplot(2,1,2);
plot(t_res, x1);
hold on;
plot(t_res, x2_shift);
hold off;
title('Phase Matched x1(t), x2(t) vs. time (s), phase error = 0 degrees');
xlabel('time (s)'); ylabel('x(t)');

%===================== Plot unmatched error x2(t)-x1(t)  ================
figure(2);
subplot(2,1,1);
plot(t_res, x2 - x1);
title(['Unmatched error x2(t)-x1(t) vs. time (s), phase error = ',num2str(rad2deg(phase)), ' degrees']); 
xlabel('time (s)'); ylabel('x(t)');

%================== Plot phase matched error x2(t)-x1(t) ================
% Unmatched Error 
subplot(2,1,2);
plot(t_res, x2_shift - x1);
title('Phase matched x2(t)-x1(t) vs. time (s), phase error = 0 degrees'); 
xlabel('time (s)'); ylabel('x(t)');
%========================================================================
