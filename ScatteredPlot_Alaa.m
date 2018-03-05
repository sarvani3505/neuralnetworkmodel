function ScatteredPlot(y,ym1,ye,ym2);

Rt    = corr2(y,ym1);
Rs    = corr2(ye,ym2);

figure('name','Developed Model','numbertitle','off');

subplot(1,2,1);
minval = min([y;ym1]);
maxval = max([y;ym1]);
scatter(y,ym1);
axis ([minval maxval minval maxval]);
l1 = line([minval maxval], [minval maxval]);
set(l1,'color','black');
box on;grid on;
ylabel('{\bf Estimated}');
xlabel('{\bf Observed}');
title(['{\bf R for Training data:} ' num2str(Rt) '']);

subplot(1,2,2);
minval = min([ye;ym2]);
maxval = max([ye;ym2]);
scatter(ye,ym2);
axis ([minval maxval minval maxval]);
l1 = line([minval maxval], [minval maxval]);
set(l1,'color','black');
box on;grid on;
ylabel('{\bf Estimated}');
xlabel('{\bf Observed}');
title(['{\bf R for Testing data:} ' num2str(Rs) '']);

