%======================================================================
% Github: https://github.com/thjsimmons
% Date: 1/3/2021
%======================================================================

% Computes the phase difference between waveforms x1(t), x2(t) 
% and the corresponding index offset in x2(t):
function [x1_res, x2_res, t_res, phase, idx_offset] = phaseMatch(x1, x2, t)
    % Resample to get uniformly stepped signals:
    [x1_res, t_res] = avgResample(x1, t);
    [x2_res, ~] = avgResample(x2, t);
    
    % Get index of fundamental frequency:
    [X1, f] = DFT(x1_res, t_res);
    [X2, ~] = DFT(x2_res, t_res);
    [~, index1] = max(X1);
    [~, index2] = max(X2);

    % Get phase difference from DFT phase:
    X1_angle = angle(X1);
    X2_angle = angle(X2);
    phase = X1_angle(index1) - X2_angle(index2);
    
    % Get index offset from phase:
    time_shift = phase / (2 * pi * f(index1));
    idx_offset = round(time_shift / t_res(1));
end
