clear all; close all;
% make initial cube.
% each edge 0.4 long with spacing 0.05.
% centered at (0.3,2,12).

edge_x = 0.1:0.05:0.5;
edge_y = 1.8:0.05:2.2;
edge_z = 11.8:0.05:12.2;

edge = 0:0.05:0.4;

% use with meshgrid to create 3D array.
[X,Y,Z] = meshgrid(edge_x,edge_y,edge_z);

% unravel 3d arry to sotre into smaller array
data = [X(:) Y(:) Z(:)];




