function [ root ] = bisect( fun, left, right, tolerance )
% function [output] = functionname(input)

%BISECT Summary of this function goes here
%   Bisect algorithm to find root of a function.
    while (abs(right-left) > tolerance)
        midpoint = (left + right)/2;
        if fun(left) * fun(midpoint) > 0
            left = midpoint;
        else
            right = midpoint;
        end
    end
    
end

