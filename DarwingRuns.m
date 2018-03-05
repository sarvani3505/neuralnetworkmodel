clc
clear all;
close all;
for i=5:1:10
    
load(sprintf('results%d',i));
semilogy(tr.epoch,tr.perf,'LineWidth',2);
hold on;
end

xlabel('{\bf Epochs}'); grid;
ylabel('{\bf MSE}');
title('{\bf NN convergence over 5 runs}');
