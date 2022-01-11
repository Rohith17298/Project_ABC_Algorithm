function [new_v, delta_v] = update_v(alpha,active_z,old_v,y,d, activ_deriv)
% Updating weight v with different hidden layer and hidden neurons
%Pre-allocated
num_layers=size(old_v,2); 
delta_layer=cell(1,num_layers);
delta_v=cell(1,num_layers);
new_v=cell(1,num_layers);

%Run for the number of hidden layer
for i=1:num_layers
    %middle hidden layer
    if num_layers>1
        delta_layer{num_layers} = (y(i,:) - d(i,:)) .* (exp(-y(i,:)) ./ (1 + exp(-y(i,:))).^2);
        for nh=num_layers-1:-1:1
            delta_layer{nh} = (delta_layer{nh+1} * old_v{nh+1}(1:end,2:end)) .* (activ_deriv{nh+1})';
            delta_v{nh} = ([1; active_z{nh}] * delta_layer{nh})';
        end
    else
        delta_layer{num_layers} = y(i,:) - d(i,:);
    end
    % Final hidden layer
    delta_v{num_layers} = ([1; active_z{num_layers}] * delta_layer{num_layers})';
    new_v{i} = old_v{i} - alpha * delta_v{i};
end
end