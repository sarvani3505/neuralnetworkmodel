function [ut,yt,us,ys] = Train_Test_Gen(xx,t);

[n m] = size(xx);

Train_Size = t;

ut = xx(round(1:Train_Size*n),1:m-1);
yt = xx(round(1:Train_Size*n),m);

us = xx(round(Train_Size*n+1:n),1:m-1);
ys = xx(round(Train_Size*n+1):n,m);