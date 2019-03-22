%Initialization
close all;
clc;

%=====Loading Data==========
pkg load io
dat = xlsread ('Travelpac2017.xlsx', 'Numeric 2017');
% quarter   mode     age      duration   budget
X=[dat(:,2) dat(:,4) dat(:,8) dat(:,10)];
y = [dat(:,5)] - 9;

%======Training Data========
lambda = 0.1;
num_labels = 83
[all_theta] = oneVsAll(X, y, num_labels, lambda);
