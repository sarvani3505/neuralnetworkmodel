% Jason Joseph Rebello
% Carnegie Mellon University (Jan 2012 - May 2013) 
% Masters in Electrical & Computer Engineering
% Linear Regression with Multiple Variables (Without Regularization)

% This program uses linear regression with multiple variables to predict
% housing prices. First feature (Column 1) is the size of the houses in sq
% feet. Second feature (Column 2) is no. of bedrooms. Housing prices is in 
% (Col 3). Please read the 'README.txt' file while executing the code. 

clear all;
clc;
close all;
format shortG
%% Load Data and Initialize Variables
load BlackRiverDaily;
[xx mu sigma] = featureNormalize(xx);
X = xx(:,1:5);
X = [ones(size(X,1),1) X];
y = xx(:,6);

[Xtrain,Ytrain,Xtest,Ytest] = Train_Test_Gen(X,0.7);
m = length(Ytrain); % Number of training examples
d = size(Xtrain,2); % Number of features.
theta = zeros(d+1,1); % Initialize thetas to zero.
alpha = 0.03; % Learning rate
numIters = 1000; % How long gradient descent should run for
fprintf('...done\n');

%% Calculate Theta from Normal Equation
% This serves as a good reference to make sure that you are getting the
% right price in the end. Note for Normal equation we need to add
% the column of 1's to X. However we do not need to normalize the features.
% I will be using XNormEqn to store X in order to avoid it replacing
% the X used in gradient descent.
fprintf('Calculating theta via normal equation');
XNormEqn = [ones(m,1) Xtrain];
thetaNormEqn = NormalEquation(XNormEqn,Ytrain);
fprintf('...done\n');

%% Compute the Cost Function
fprintf('Calculating theta via gradient descent');
XGD = [ones(m,1) Xtrain]; % Add a col of 1's for the x0 terms

[theta, CostHistory] = gradientDescent(XGD, theta, Ytrain, alpha, numIters);
fprintf('...done\n');

train_pred1 = XGD * theta;
train_pred2 = XNormEqn * thetaNormEqn;
mse(train_pred1,Ytrain)
mse(train_pred2,Ytrain)

mtest = length(Ytest);
Xtest = [ones(mtest,1) Xtest];
test_pred1 = Xtest * theta;
test_pred2 = Xtest * thetaNormEqn;
mse(test_pred1,Ytest)
mse(test_pred2,Ytest)


%*******************************************
% Drawing the results
%*******************************************
%close all;
x1='{\bf Observed and Estimated Black river flow Using Gradient Descent - Training Case}';
x2='{\bf Observed and Estimated Black river flow Using Gradient Descent - Testing Case}';
draw_train_test(Ytrain,train_pred1,Ytest,test_pred1,x1,x2);



%*******************************************
% Evaluation criterion
%*******************************************
disp('--------Training Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytrain,train_pred1)

disp('--------Testing Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytest,test_pred1)



