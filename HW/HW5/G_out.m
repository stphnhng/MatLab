function [ G_out ] = G_out( v )
%G_OUT Summary of this function goes here
%   Detailed explanation goes here

    TH = v(1);
    R = v(2);
    
    G_out = zeros(2,1);
    G_out(1) = (-4.*exp(-2/3.*R).* (6.*R - R.^2).*cos(TH).*sin(TH))/(6561*pi);
    G_out(2) = (-4.*exp(-2/3.*R).*(R-6).*R.*(R.^2-12.*R+18).*(cos(TH)).^2)/(19683*pi);
    
end

