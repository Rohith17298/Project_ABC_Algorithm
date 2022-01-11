function [activ_deriv] = get_activ_deriv(activ_type, linear_z)
% This function returns the activated derivation using a specified method

nl=length(linear_z);
activ_deriv=cell(1,nl);

if activ_type == 1
%     fprintf('Using activation type sigmoid...\n')
    for nh=1:nl
        activ_deriv{nh} = exp(-linear_z{nh}) ./ (1+exp(-linear_z{nh})) .^2;
    end %for
elseif activ_type == 2
%     fprintf('Using activation type tanh...\n')
    for nh=1:nl
        activ_deriv{nh} = 4*exp(-2*linear_z{nh}) ./ (1+exp(-2*linear_z{nh})) .^2;
    end %for   
else %If activ_type == 3
%     fprintf('Using activation type ReLU...\n')
    for nh=1:nl
        activ_deriv{nh} = max(0,linear_z{nh});
    end %for
end %if