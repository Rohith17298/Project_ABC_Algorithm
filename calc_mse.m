%% Defining the function for the error using y_calculate and d_given

function [error] = calc_mse(y,d)

D = abs(y-d).^2;
r = numel(d);
error = (1/2)*(1/r)*sum(D(:));
end