function [ return_args ] = f( input )
%F Summary of this function goes here
%   Detailed explanation goes here
    
    theta = input(1,1);
    r = input(2,1);
    
    constant = (sqrt(2)/(81 * sqrt(pi)) );
    
    return_args = (abs( constant .* (6.*r - r.^2) .* exp(-r/3) .* cos(theta) )).^2;
    return_args = -1 * return_args;
    
end

