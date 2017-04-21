function [ x_list ] = newton( f, f_prime, x_0, tol )
%NEWT
%   Newton's Method
%   Given an initial guess of x_0 and the function f and f_prime.
%   tol is the tolerance for error.
%   Does Newton's Method using the Givens.

err = tol + 1;
x = x_0;
x_list = x_0;

while err > tol
    
    change = f(x) / f_prime(x);
    x = x - change;
    err = abs(change/x);
    % If the change of the guess is small that means
    % the function is pretty much done.
    x_list = [x_list;x];
end

end

