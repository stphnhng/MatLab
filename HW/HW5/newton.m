function [ x_list ] = newton( g, grad_g, x_0, tol )
%NEWT
%   Newton's Method
%   Given an initial guess of x_0 and the function f and f_prime.
%   tol is the tolerance for error.
%   Does Newton's Method using the Givens.

err = tol + 1;
x = x_0;
x_list = x_0;

while err > tol
    
    y = g(x);
    grad_y = grad_g(x);
    
    change = grad_y \ y;
    
    x = x - change;
    err = norm(change,2) / norm(x,2);
    % If the change of the guess is small that means
    % the function is pretty much done.
    x_list = x;
end

end

