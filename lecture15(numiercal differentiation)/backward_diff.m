function [ dy_dx,x_out ] = backward_diff( f,a,b,N )
%BACKWARD_DIFF Summary of this function goes here
%   Detailed explanation goes here
    x = linspace(a,b,N);
    % row vector with equally spaced points.
    h = x(2) - x(1);
    % step count
    y = f(x);
    % equation parsed for x.
    
    dy_dx = (y(2:end) - y(1:end-1)) / h;
    % Get derivative using forward differentiation.
    x_out = x(2:end);
    
end

