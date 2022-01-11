function [train_error, test_error, y_train, y_test, d_train, d_test]= ...
    run_ann(x, d, active_type, threshold, alpha, training_method, hidden_neurons, hidden_layers)

T=100;
c=0.9;
k=1.38064852*10^(-23);

test_samples = 10;
num_samples = size(x,1);

% Splits the training and testidation samples
num_test = ceil((test_samples / 100) * num_samples);

% Shuffling the rows of samples
random_rows = randperm(num_samples);

% Training and testidation rows
test_rows   = random_rows(1: (num_test-1));
train_rows = random_rows(num_test:end);

% Training and testidation rows of x and d
x_train = x(train_rows,:); d_train = d(train_rows,:);
x_test= x(test_rows, :);  d_test= d(test_rows, :);

% Pre-allocating sizes of y_training and y_testidation
y_train = zeros(size(d_train));
y_test = zeros(size(d_test));

%% Training ANN
[~,y_train,u,v] = ...
    train_ann(x_train, d_train, active_type, threshold, alpha, training_method, hidden_neurons, hidden_layers);
train_error = calc_mse(y_train, d_train);

%% testidation ANN
for ns=1:length(test_rows)
%     [y_test(ns,:),~,~] = calc_ann(x_test,u,v,ns,active_type);
    [y_test(ns,:),~,~]=update_by_abc(x_test,d,u,v,ns,hidden_neurons,active_type,T,c,k);
end
test_error = calc_mse(y_test, d_test);

end