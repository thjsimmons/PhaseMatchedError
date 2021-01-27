%======================================================================
% Github: https://github.com/thjsimmons
% Date: 1/3/2021
%======================================================================

% Resamples x(t) to have N uniform time steps:
% New time step = (total elapsed time in t) / nSamples
function [x_res, t_res] = genResample(x, t, nSamples)
    x_res = zeros(1, nSamples);
    
    % Create uniformly stepped time array:
    t_res = zeros(1, nSamples);
    t_step = (t(end) - t(1)) / nSamples;

    for i = 1:nSamples
       t_res(i) =  i * t_step;
    end
    
    % Endpoints of resampled x(t) = original:
    x_res(1) = x(1);
    x_res(end) = x(end);
    
    % Sample the interpolated lines connecting points in x(t) at
    % uniform time steps:
    count = 1;
    for i = 1:length(t)-1
        slope = (x(i+1)-x(i)) / (t(i+1)-t(i));
        while t_res(count) < t(i+1)
            x_res(count) = x(i) + slope*(t_res(count) - t(i));
            count = count + 1; 
        end
    end
end

