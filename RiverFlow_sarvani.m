
clc
clear all; 
close all;


load BlackriverData;
[xx, mu, sigma] = featureNormalize(xx);

[ut,yt,us,ys] = Train_Test_Gen(xx,0.7);
% X = xx(:,1:4);
% Y = xx(:,5);

% load Temp-Data;
format short g;
nntwarn off
 for hn=5:10
% ------------------------------
%hn  = 6;  % Number of hidden nodes
net = ...
    newff(ut',yt',[hn 1],{'tansig' 'purelin'},'trainlm','learngdm','mse');
net.trainParam.goal         = 1e-25;
net.trainParam.max_fail     = 5000; 
net.trainParam.show         = 5;
net.trainParam.mu_dec       = 1e-5;
net.trainParam.mu_inc       = 2;
net.divideParam.trainRatio = 0.9;
net.divideParam.valRatio = 0.1;
%net.trainParam.mu_max       = 10000;
%net.trainParam.min_grad     = 1e-5;
% net.trainParam.mu         = 1e-25;
% net.trainParam.min_grad   = 1e-10;
% net.trainParam.mu         = 1e-10;
% ****************************************************
% Training the Net
% ****************************************************
net      = init(net);
[net,tr] = train(net,ut',yt');

% ****************************************************
% Simulation and calculating error
% ****************************************************
ypredtrain   = sim(net,ut')';
ypredtest    = sim(net,us')';
% ****************************************************

% ****************************************************
% NN convergence
% ****************************************************
figure(3)
semilogy(tr.epoch,tr.perf,'LineWidth',2);
xlabel('{\bf Epochs}'); grid;
ylabel('{\bf MSE}');
title('{\bf NN convergence}');
%*******************************************
% Drawing the results
%*******************************************
%close all;
x1='{\bf Observed and Estimated Black river flow Using ANN - Training Case}';
x2='{\bf Observed and Estimated Black river flow Using ANN - Testing Case}';
draw_train_test(yt,ypredtrain,ys,ypredtest,x1,x2);


%*******************************************
% Evaluation criterion
%*******************************************
disp('--------Training Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(yt,ypredtrain)

disp('--------Testing Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(ys,ypredtest)
 save(sprintf('results%d',hn))
 end


%*******************************************


