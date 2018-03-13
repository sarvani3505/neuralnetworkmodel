function [ut,yt,us,ys] = Train_Test_Gen(xx,t);

[n m] = size(xx);

Train_Size = t;

ut = xx(round(1:Train_Size*n),1:m-1);
yt = xx(round(1:Train_Size*n),m);

us = xx(length(yt):n,1:m-1);
ys = xx(length(yt):n,m);