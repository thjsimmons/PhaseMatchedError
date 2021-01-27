%======================================================================
% Github: https://github.com/thjsimmons
%======================================================================

% Returns upper half of DFT, frequencies are scaled to (Hz)
function [X_half, f] = DFT(x, t)
    % fs = 1/Ts where Ts is sampling_period of x(t)
    % x(t) is assumed to be uniformly sampled after resampling
    x_samplingFrequency = length(t)/(t(end)-t(1)); 
    
    % N = DFT length, always a power of 2 
    % Nearest power of 2 always works if x(t) is oversampled
    % oversampling: (nyquist frequency << samplingRate)
    N = 2^nextpow2(length(t)); 
    
    % Return positive upper half of DFT:
    X = fft(x, N) / length(t);
    X_half = X(1:length(X)/2);          
    f_ints = 0:N/2-1;               
    f = x_samplingFrequency * f_ints/N;
end


