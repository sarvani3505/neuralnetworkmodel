% x=load('results1.mat','hn')
% y=load('results1.mat','MSE')
% plot(x.hn,y.MSE,'r*');
% hold on;
% 
% 
% x=load('results2.mat','hn')
% y=load('results2.mat','MSE')
% plot(x.hn,y.MSE,'r*');
% hold on;
% 
% x=load('results2.mat','hn')
% y=load('results2.mat','MSE')
% plot(x.hn,y.MSE,'r*');
% hold on;
% 
% x=load('results3.mat','hn')
% y=load('results3.mat','MSE')
% plot(x.hn,y.MSE,'r*');
% hold on;
% 
% x=load('results4.mat','hn')
% y=load('results4.mat','MSE')
% plot(x.hn,y.MSE,'r*');
% hold on;

x=load('results5.mat','hn')
y=load('results5.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;
x=load('results6.mat','hn')
y=load('results6.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;
x=load('results7.mat','hn')
y=load('results7.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;
x=load('results8.mat','hn')
y=load('results8.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;
x=load('results9.mat','hn')
y=load('results9.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;
x=load('results10.mat','hn')
y=load('results10.mat','MSE')
plot(x.hn,y.MSE,'r*');
hold on;

xlabel('{\bf neurons}'); grid;
ylabel('{\bf MSE}');
title('{\bf NN convergence over 10 runs}');

%*******************************************


