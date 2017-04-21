% (1) 
% Find parabolic equation such that it includes the points (-1,9), (1,5),
% and (2, 12).

% 1. Plug in 3 points into parabolic general equation, ax^2 + bx + c = y.
% 2. Create matrix and solve with it.

A = [1,-1,1
    1,1,1
    4,2,1];

b = [9;5;12];

% Ax = b, where x = [a;b;c], gives the coefficients for parabolic general
% equation.
x = A\b;

% Since x = [3;-2;4].
% Thus, parabola = y = 3x^2 - 2x + 4.

% (2)
% A vending machine has $41.25 in it. It has 455 coins in it and all are
% either nickels, dimes, or quarters. There are twice as many dimes as
% nickels. How many of each coin are there?

% N = ?
% D = ?
% Q = ?

%  5N + 10D + 25Q = 4125.
% -2N +   D       = 0.
%   N +   D +   Q = 455.

A = [5 10 25
    -2 1 0
    1 1 1];
b = [4125
    0
    455];

x = A\b;

% N = 145
% D = 290
% Q = 20

% LU Decomposition.

% Ax = b
% A = LU
% LUx = b
% Ux = c
% Lc = b
% solve for c 
% c = L\b
% Ux = c
% solve for x
% x = U\c
% Ax = b, solved.



