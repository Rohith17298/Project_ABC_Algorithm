%% Artificial Bee Colony Mid-term Project
clear all
close all
clc
% Imports
x=csvread('input_data.csv');
d=csvread('output_data.csv');
% Scanling input and output parameters
%x = scaling(x,1);
%d = scaling(d,2);
% sigmoid=1   tanh=2   relu=3
active_type=1;

% threshold and alpha rate
threshold = 0.01;
alpha=0.0001;

trials=1; %This is the number of trials
hidden_layers=3; %Must be greater than 0
hidden_neurons=[3 8 2];

%% Initialize output vectors for all methods
% gd_train=Inf(1,trials);
% gd_test=Inf(1,trials);
% qn_train=Inf(1,trials);
% qn_test=Inf(1,trials);
abc_train=Inf(1,trials);
abc_test=Inf(1,trials);

% %% Gradient Descent
% for i=1:trials
%     %
%     training_method=1; %GD
%     [train_error, test_error, y_train, y_test, d_train, d_test]= ...
%         run_ann(x, d, active_type, threshold, alpha, training_method, hidden_neurons, hidden_layers);
%     gd_train(1,i)=train_error;
%     gd_test(1,i)=test_error;
%     %}
% end

% %% Quasi Newton
% for i = 1:trials
%     %
%     training_method=2; %QN
%     [train_error, test_error, y_train, y_test, d_train, d_test]= ...
%         run_ann(x, d, active_type, threshold, alpha, training_method, hidden_neurons, hidden_layers);
%     qn_train(1,i)=train_error;
%     qn_test(1,i)=test_error;
%     %}
% end
%% Artificial bee colony
for i=1:trials
    training_method=3; %ABC
    [train_error, test_error, y_train, y_test, d_train, d_test]=...
        run_ann(x,d,active_type,threshold,alpha,training_method,hidden_neurons,hidden_layers);
    abc_train(1,i)=train_error;
    abc_test(1,i)=test_error;
end
    
%% Calculate mean of error vectors
% gd_train_error=mean(gd_train);
% gd_test_error=mean(gd_test);
% 
% qn_train_error=mean(qn_train);
% qn_test_error=mean(qn_test);

abc_train_error=mean(abc_train);
abc_test_error=mean(abc_test);

%% Write the output and error in a csv file
csvwrite('y_train.csv', y_train);
csvwrite('y_test.csv', y_test);

% csvwrite('gd_train_error.csv', gd_train_error);
% csvwrite('gd_test_error.csv', gd_test_error);
% 
% csvwrite('qn_train_error.csv', qn_train_error);
% csvwrite('qn_test_error.csv', qn_test_error);

csvwrite('abc_train_error.csv', abc_train_error);
csvwrite('abc_test_error.csv', abc_test_error);

%% Display the output and error in percentage
% fprintf('The gradient desc train error as a percent is: %.3g%% \n', gd_train_error*100);
% fprintf('The gradient desc testidation error as a percent is: %.3g%% \n', gd_test_error*100);
% disp('___________________________________________________________________________');
% fprintf('The Quasi Newton train error as a percent is: %.3g%% \n', qn_train_error*100);
% fprintf('The Quasi Newton testidation error as a percent is: %.3g%% \n', qn_test_error*100);

fprintf('The Artificial Bee colony train error as a percent is: %2.2f%% \n', abc_train_error*100);
fprintf('The Artificial Bee colony test error as a percent is: %2.2f%% \n', abc_test_error*100);