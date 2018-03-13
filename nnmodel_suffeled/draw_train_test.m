function draw_train_test(yt,ypredtrain,ys,ypredtest,x1,x2);

figure;
subplot(211); plot(yt,'b','LineWidth',1,'MarkerEdgeColor','k',...
      'MarkerFaceColor','g','MarkerSize',1);hold on; 
plot(ypredtrain,'r-.','LineWidth',1,'MarkerEdgeColor','k',...
      'MarkerFaceColor','g','MarkerSize',1); 
title(x1,'FontSize',9,'FontWeight','bold');
xlabel('{\bf Days}','FontSize',9,'FontWeight','bold');
legend('{\bf Observed}','{\bf Estimated}'); grid;

subplot(212); plot(ys,'b','LineWidth',1,'MarkerEdgeColor','k',...
      'MarkerFaceColor','g','MarkerSize',1);hold on; 
plot(ypredtest,'r-.','LineWidth',1,'MarkerEdgeColor','k',...
      'MarkerFaceColor','g','MarkerSize',1); 
title(x2,'FontSize',9,'FontWeight','bold');
xlabel('{\bf Days}','FontSize',9,'FontWeight','bold');
legend('{\bf Observed}','{\bf Estimated}'); grid

