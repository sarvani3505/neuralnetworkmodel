% NN_ERROR = 0.04


clear ; close all; clc


%% ================ Normal Equations ================

fprintf('Solving with normal equations...\n');

format shortG

%% Load Data
%data = csvread('ex1data2.txt');
load BlackRiverDaily;

% y = xx(:,6);
% ind = ~(isoutlier(y,'quartile'));
% xx = xx(ind,:);

[data mu sigma] = featureNormalize(xx);

order = 5;

[Xtrain,Ytrain,Xtest,Ytest] = Train_Test_Gen(data,0.7);

Xtrain = Xtrain(:,order);
Xtest = Xtest(:,order);

m1 = length(Ytrain);
m2 = length(Ytest);


% Add intercept term to X
Xtrain = [ones(m1, 1) Xtrain];
Xtest = [ones(m2, 1) Xtest];

% Calculate the parameters from the normal equation
theta = normalEqn(Xtrain, Ytrain);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');


Ytrain_predict = Xtrain * theta;
Ytest_predict = Xtest * theta;

trainMSE = mse(Ytrain,Ytrain_predict)
testMSE = mse(Ytest,Ytest_predict)

%*******************************************
% Drawing the results
%*******************************************
%close all;
x1='{\bf Observed and Estimated Black river flow Using Normal Equation - Training Case}';
x2='{\bf Observed and Estimated Black river flow Using Normal Equation - Testing Case}';
draw_train_test(Ytrain,Ytrain_predict,Ytest,Ytest_predict,x1,x2);



%*******************************************
% Evaluation criterion
%*******************************************
disp('--------Training Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytrain,Ytrain_predict)

disp('--------Testing Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytest,Ytest_predict)

%*******************************************


% denorm = [X(:,2:end) predicted];
% denorm = featureDeNormalize(denorm,mu,sigma);
% 
% err2 = mse(xx(:,end),denorm(:,end))
% 
% denorm(1:5,:);
% xx(1:5,:);