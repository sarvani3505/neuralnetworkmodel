%regression model
clc
clear all; 
close all;
%*******************************************
load BlackRiverData;
% ut = xxt(:,1:4);
% yt = xxt(:,5);
% us = xxs(:,1:4);
% ys = xxs(:,5);

% load Temp-Data;
format short g;
nntwarn off
n=length(xx)
[x,y,nx,ny]=Train_Test_Gen(xx,0.7);
Num=length(y);
Rep=length(ny);
timeT=1:Num;
timeV=Num+1:Rep+Num;
%trainig data
k1=ones(1,Num);
fil=[k1;x'];
A=inv(fil*fil')*fil*y
ypredtrain=fil'*A;
%testing session
k2=ones(1,Rep);
fi2=[k2;nx'];
ypredtest=fi2'*A;
%drawing the results
close all;
x1='{\bf Observed and Estimated Black river flow Using GP - Training Case}';
x2='{\bf Observed and Estimated Black river flow Using GP - Testing Case}';
draw_train_test(y,ypredtrain,ny,ypredtest,x1,x2);
%*******************************************
% Scattered Plot
%*******************************************
ScatteredPlot_Alaa(y,ypredtrain,ny,ypredtest);
%*******************************************
% Evaluation criterion
%*******************************************
disp('--------Training Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(y,ypredtrain)

disp('--------Testing Results---------');
[Vaf,MSE,MAPE,R,R2] = EvalFunctionAlaa2(ny,ypredtest)

%*******************************************
