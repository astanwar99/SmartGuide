%Initialization
close all;
clc;

%=====Loading Data==========
pkg load io
dat = xlsread ('Travelpac2017.xlsx', 'Numeric 2017');
% quarter   mode     age      duration   budget
X=[dat(:,2) dat(:,4) dat(:,8) dat(:,10) dat(:,13)/1000];
y = [dat(:,5)] - 9;

budget = [X(:, 5)];
m = size(X, 1);
num = [0 0 0 0 0];
for i = 1:m,
  if budget(i) < 500,
    X(i, 5) = 1;
    num(1) = num(1) + 1;
  elseif budget(i) >= 500 && budget(i) < 1500,
    X(i, 5) = 2;
    num(2) = num(2) + 1;
  elseif budget(i) >= 1500 && budget(i) < 3000,
    X(i, 5) = 3;
    num(3) = num(3) + 1;
  elseif budget(i) >= 3000 && budget(i) < 5000,
    X(i, 5) = 4;
    num(4) = num(4) + 1;
  else,%     budget(i) >= 5000,
    X(i, 5) = 5; 
    num(5) = num(5) + 1;
  endif
endfor

%======Training Data========
lambda = 0.1;
num_labels = 83
[all_theta] = oneVsAll(X, y, num_labels, lambda);



pred = predictOneVsAll(all_theta, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

