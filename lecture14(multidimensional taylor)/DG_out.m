function [ DG_out ] = DG_out( v )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    x = v(1);
    y = v(2);

    DG_out = zeros(2,2);
    DG_out(1,1) = 12*(x-1)^2;
    DG_out(2,2) = 12*(y-1)^2;

end

