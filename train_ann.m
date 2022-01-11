function [error,y,u,v] = train_ann(x,d,active_type, threshold, alpha, training_method, hidden_neurons, hidden_layers)
%Trains and calculates the neural network
%   Trains and calculates the neural network

%% X and D
[d_row,d_col]=size(d);
[x_row,x_col]=size(x);

% Initialize nh,ni
hidden_neurons=[hidden_neurons d_col];%Hidden Neurons matrix + output layer
ni=size(x,2); %number of rows in x

% Initialize Weights
for i=1:hidden_layers %V
    v{i}=ones(hidden_neurons(i+1),hidden_neurons(i)+1);
end
u=ones(hidden_neurons(1),x_col+1); %U

% Initialize error, y, and new weight vectors
prev_error=inf;
error=realmax;

y=zeros(size(d));

old_weights = combine_weights(u,v);
old_g=zeros(size(old_weights));


T=100;
c=0.9;
k=1.38064852*10^(-23); %Boltzmann's Constant

%% Main loop
while (error < prev_error) && (error > threshold)
    for i = 1:x_row
        if training_method == 1 % Gradient Descent
        [y(i,:),~,linear_z,active_z]=calc_ann(x,u,v,i,active_type);
        activ_deriv = get_activ_deriv(active_type, linear_z);
        [u, delta_u]=update_u(u,alpha,x,v,y,d,i,activ_deriv);
        [v, delta_v]=update_v(alpha,active_z,v,y,d,activ_deriv);
            
        elseif training_method == 2 %Quasi Newton
            [~, ~, old_g] = ...
            update_by_qn(x, d, u, v, old_g,alpha, hidden_neurons, delta_u, delta_v);
        
        elseif training_method == 3
            [y(i,:),u,v]=update_by_abc(x,d,u,v,i,hidden_neurons,active_type,T,c,k);
        else
            quit(0,'Invalid Training Method'); %If training_method isn't 1,2 or 3
        end   
    end
    prev_error=error;
    error=calc_mse(y,d);
end
if error > prev_error
    error=prev_error;
end
end