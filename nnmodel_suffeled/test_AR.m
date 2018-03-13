clear all, close all, clc

load river_dataset

index = cell2mat(riverTargets)
month = 1:264;
figure;
plot(month,index);
title('River Flow Index');
ylabel('Index');
xlabel('Months');

model = ar(index,131, 'ls', 'Ts', 1,'IntegrateNoise', true);

compare(index',model,1) % 1 step ahead prediction

