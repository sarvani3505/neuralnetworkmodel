function [Vaf,RMSE,ED,MD,MMRE]= Alaaevalfunction(y,ym);

n = length(y);
r = y-ym;

Vaf  = vaf(y,ym);
RMSE = sqrt(mean((y - ym).^2));
MSE  = sum(r.^2)/n;
ED   = sqrt(sum(r.^2));
MD   = sum(abs(r))/n;

for k=1:n
    error(k) = abs(y(k)-ym(k))/y(k);
end

MMRE = (1/n)*sum(error);

% sprintf('Vaf = %0.5g, ED = %0.5g',Vaf,ED);
sprintf('Vaf = %0.5g, MSE = %0.5g, ED = %0.5g',Vaf,RMSE,ED);
sprintf('MD = %0.5g, MMRE = %0.5g',MD,MMRE);

% sprintf('Vaf= %0.5g',Vaf);
% sprintf('MSE= %0.5g',MSE);
% sprintf('ED= %0.5g',ED);
% sprintf('MD= %0.5g',MD);     
% sprintf('MMRE= %0.5g',MMRE);       


