%======================================================================
% Github: https://github.com/thjsimmons
% Date: 1/3/2021
%======================================================================

% Resamples x(t) to have uniform time steps
% new time step =  average time step found in 't'
function [x_avg, t_avg] = avgResample(x, t)
    x_avg = zeros(1, length(t));
    
    % Create uniformly stepped time array:
    t_avg = zeros(1, length(t));
    t_step = (t(end) - t(1)) / length(t);

    for i = 1:length(t)
       t_avg(i) =  i * t_step;
    end
    
    % Endpoints of resampled x(t) = original:
    x_avg(1) = x(1);
    x_avg(end) = x(end);
    
    % Sample the interpolated lines connecting points in x(t) at
    % uniform time steps:
    count = 1;
    for i = 1:length(t)-1
        slope = (x(i+1)-x(i)) / (t(i+1)-t(i));
        while t_avg(count) < t(i+1)
            x_avg(count) = x(i) + slope*(t_avg(count) - t(i));
            count = count + 1; 
        end
    end
end



