function [nonlinear_var] = type_of_activation(linear_var, active_type)

if active_type == 1
    % Activation of sigmoig
    nonlinear_var = 1./(1+exp(-linear_var));
    
elseif active_type == 2
    % Activation of tanh
    nonlinear_var = 2./(1+exp(-(2*linear_var)));
    
else
    % Activation of Relu
    nonlinear_var = max(0, linear_var);
end

end

