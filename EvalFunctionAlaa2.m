function [Vaf,MSE,MAPE,R,R2]= EvalFunctionAlaa2(y,ym);

n = length(y);
r = y-ym;

Vaf  = vaf(y,ym);
MSE  = sum(r.^2)/n;
MAPE = mae(r);
R    = corr2(y,ym);
% Compute R square
% Compute the residual values as a vector signed numbers:
yresid = y - ym;
% Square the residuals and total them 
% obtain the residual sum of squares:
SSresid = sum(yresid.^2);
% Compute the total sum of squares of y 
% by multiplying the variance of y by the 
% number of observations minus 1:
SStotal = (length(y)-1) * var(y);
% Compute R2 using the formula given in 
% the introduction of this topic:
R2 = 1 - SSresid/SStotal;

sprintf('Vaf = %0.5g, MSE = %0.5g, MAPE = %0.5g',Vaf,MSE,MAPE)
sprintf('R = %0.5g, R2 = %0.5g',R,R2)



