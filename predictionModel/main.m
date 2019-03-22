%Initialization
close all;
clc;

%=====Loading Data=========
pkg load io
dat = xlsread ('Travelpac2017.xlsx', 'Numeric 2017');
% quarter   mode     age      duration   budget
X=[dat(:,2) dat(:,4) dat(:,8) dat(:,10)];
y = [dat(:,5)] - 9;