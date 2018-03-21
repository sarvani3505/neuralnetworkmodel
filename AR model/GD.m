clear ; close all; clc

%% ================ Linear Regression with Gradient Descent ================

fprintf('Solving with normal equations...\n');

format shortG

%% Load Data
%data = csvread('ex1data2.txt');
load BlackRiverDaily;
[xx mu sigma] = featureNormalize(xx);
X = xx(:,1:5);
X = [ones(size(X,1),1) X];
y = xx(:,6);

[Xtrain,Ytrain,Xtest,Ytest] = Train_Test_Gen(X,0.7);
b = regress(Ytrain,Xtrain)

Ytrain_predict = Xtrain * b;
Ytest_predict = Xtest * b;

trainMSE = mse(Ytrain,Ytrain_predict)
testMSE = mse(Ytest,Ytest_predict)

%*******************************************
% Drawing the results
%*******************************************
%close all;
x1='{\bf Observed and Estimated Black river flow Using Linear Regression - Training Case}';
x2='{\bf Observed and Estimated Black river flow Using Linear Regression - Testing Case}';
draw_train_test(Ytrain,Ytrain_predict,Ytest,Ytest_predict,x1,x2);



%*******************************************
% Evaluation criterion
%*******************************************
disp('--------Training Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytrain,Ytrain_predict)

disp('--------Testing Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(Ytest,Ytest_predict)

