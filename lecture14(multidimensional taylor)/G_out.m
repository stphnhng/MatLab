function [ G_out ] = G_out( v )
%G_OUT Summary of this function goes here
%   Detailed explanation goes here

    x = v(1);
    y = v(2);

    derivativeFuncTheta = ( 4*e^(-2r/3)*(6*r-r^2)^2*sin(theta)*cos(theta) ) / (6561 * pi);
    
    G_out = zeros(2,1);
    G_out(1) = 4*(x-1)^3;
    G_out(2) = 4*(y-1)^3;
    
end

