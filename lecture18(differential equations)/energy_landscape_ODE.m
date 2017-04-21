function [ dy_dt ] = energy_landscape_ODE( t,y )
%ENERGY_LANDSCAPE_ODE Summary of this function goes here
%   Detailed explanation goes here

    x = y(1);
    v = y(2);
    
    dy_dt = zeros(2,1);
    dy_dt(1) = v;
    dy_dt(2) = -4*x.^3+4*x;
    
end

