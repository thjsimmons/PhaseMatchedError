%======================================================================
% Github: https://github.com/thjsimmons
% Date: 1/3/2021
%======================================================================

 % left/right non-circular array shift:
function x_shift = shift(x, idx)
    x_shift = zeros(1, length(x));
    if idx >= 0 % shift left
        for i = 1:length(x)-idx
            x_shift(i) = x(i + idx);
        end
    else        % shift right 
        for i = 1-idx:length(x)
            x_shift(i) = x(i + idx);
        end
    end
end
