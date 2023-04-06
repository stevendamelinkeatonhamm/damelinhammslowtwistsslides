clear all; close all; clc;
%create some points
A = mat2gray(double(imread('cameraman.tif')));
imshow(A)
x = reshape(A,[256^2 1]);

g = @(t) exp(-1*abs(t));

y = x+g(x);

s = reshape(y,[256 256]);
figure;
imshow(mat2gray(s))


