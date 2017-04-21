clc; clear all; close all;

A = [4,-1,1;
    4, -8, 1;
    -2 1 5;
    ];
b = [7;-21;15];
x = [2;4;3];
LU_sol = A\b;

% jacobi(A,b,[0;0;0],0.1);
% 
% M = [0,1/4,-1/4
%     1/2,0,1/8
%     2/5,-1/5,0];
% 
% b_2 = [7/4;21/8;3];
% 
% x = [0;0;0];
% 
% for i = 1:10
%     x = (M*x) + b_2;
% end

b_2 = b ./ diag(A);
x = [0;0;0];

M = zeros(size(A));

for i = 1:size(A)
    row = A(i,:);
    rowSize = size(row);
    rowSize = rowSize(1,2);
    diag = row(i); % diag
    for j = 1:rowSize
        row(j) = row(j) / (diag*-1);
    end
    row(i) = 0;
    M(i,:) = row;
end



% 
% A_5 = diag([2;2;2;2;2]);
% 
% second_vector = repmat(-1,1,4);
% second_matrix = diag(second_vector,1);
% 
% third_matrix = diag(second_vector,-1);
% 
% A_5 = A_5 + second_matrix + third_matrix
% 
% p_vector = zeros(5,1);
% 
% for i=1:5
%     p_vector(i,1) = 2 * (1-cos(23*pi/51)) * sin(23*pi*i/51);
% end
% 
% jacobi(A_5,p_vector,[0;0;0;0;0],0.001)
% 
% A_5\p_vector


