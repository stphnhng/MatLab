clear all; close all; clc;

% Gauss - Seidel

%  3x  + y -    z = 3
%  5x  +       2z = 1
% -3x  - y +  12z = -5

% x_k+1 = (3-y_k + z_k)/3
% y_k+1 = (1-2*z_k) / 5
% z+k+1 = (5+3x_k+1 + y_k+1)/12

% 3x_k+1 = 3 - y_k + z_k
% 5y_k+1 = 1 - 2z_k
% -3x_k+1 - y_k+1 + 12z_k+1 = -5

L = [3 0 0
          0 5 0
          -3 -1 12];

vector = [3;1;-5];
T = [0 -1 1
     0 0 -2
     0 0 0];
             
% L * [x_k+1;y_k+1;z_k+1] = vector + T * [x_k;y_k;z_l];

% L = lower
% T = -1 * upper




