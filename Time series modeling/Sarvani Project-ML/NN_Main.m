clear all
clc
close all
nntwarn off

setdemorandstream(491218382);

% load dataset -> Two Variables will be in your workspace. -> 1. Data   2. Target 
% Uncomment to use other dataset 

%load('bodyfat_dataset.mat'); 
%load('abalone_dataset.mat');
load('weekly.mat');

% newff arguments: newff(Data,Target, [S1 S2...SNl],{TF1 TF2...TFNl},BTF,BLF,PF)
% Data - input elements.
% 
% Target - required output
%
% Si - Size of ith layer, for Nl layers.
% 
% TFi - Transfer function of ith layer, default = 'tansig'.
% 
% BTF - Backprop network training function, default = 'traingdx'/ 'trainlm'.
% 
% BLF - Backprop weight/bias learning function, default = 'learngdm'.
% 
% PF - Performance function, default = 'mse'. 
    
net = newff(Data,Target,[25 15 5 1],{'tansig' 'tansig' 'tansig' 'purelin'},'trainlm','learngdm','mse');


net.trainParam.goal=1e-25;              % Set Performance goal 
net.trainParam.max_fail=5000;           % Maximum validation failures
net.trainParam.show=5;                  % Epochs between showing progress
net.trainParam.mu_dec=1e-5;             
net.trainParam.mu_inc=2;
%net.trainParam.mu_max=10000;
net.trainParam.min_grad=1e-5;
net.trainParam.epochs = 500;             % Maximum number of epochs to train 

% Initialize The Network
net=init(net);

% Train on Training Dataset
[net,tr]=train(net,Data,Target);

figure1 = figure;
semilogy(tr.epoch,tr.perf,'LineWidth',2);
xlabel('{epochs}');grid;
ylabel('{MSE}');
saveas(figure1,'MSE.jpg')

%disp('Please enter the Space button to move forward: ');
%pause;


Ypredict_Train=sim(net,Data);
figure2 = figure;
x = 1:length(Target);
plot(x,Target,'-');
hold on
plot(x,Ypredict_Train,'-');
xlabel('{X}');grid;
ylabel('{function(X)}');
title('Original Vs Predicted Outputs Graph');
legend('Target(x)','Predicted(x)')
saveas(figure2,'Original Vs Predicted Graph.jpg')




%Ypredict_Test=sim(net,TestX);

%Err = TestX - Ypredict_Test;
%figure2 = figure;
%ploterrhist(Err)
%saveas(figure2,'ErrorHistogram.jpg')

% View Your Trained Network
%view(net)

% Trained Network Weights
Weights = net.LW;

% Trained Network Bias values
Biases = net.b;


