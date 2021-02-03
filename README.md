# PhaseMatchedError
MATLAB functions for plotting/computing NUDFT and splitting error between non-uniform time series into magnitude and phase.

Phase matched error is the difference between 2 time series x1(t) & x2(t)
when the phase difference of the fundamental frequencies is removed.
This allows error to be split into 2 components: a constant phase error, 
and a time varying amplitude error (which is smaller than the total error). 

Removing the phase difference requires taking the discrete-fourier-transform (DFT)
of (non-uniformly sampled) x1(t) & x2(t) which are first resampled to have constant time step. 
Combining these 2 operations is an equivalent implemention of the 
non-uniform DFT (NUDFT).

