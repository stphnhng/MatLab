function [ DG_out ] = DG_out( v )
%DG_out Summary of this function goes here
%   Detailed explanation goes here

    TH = v(1);
    R = v(2);

    DG_out = zeros(2,2);
    DG_out(1,1) = (4.*exp(-2/3.*R).* (6.*R - R.^2).*(sin(TH)).^2)/(6561*pi)-(4.*exp(-2/3.*R).* (6.*R - R.^2).*(cos(TH)).^2)/(6561*pi);
    DG_out(1,2) = (8.*exp(-2/3.*R).* (6.*R - R.^2).*(sin(TH).*cos(TH))/(19683*pi)) - ((8.*exp(-2/3.*R).*(6-2.*R).*(6.*R - R.^2).*(sin(TH).*cos(TH)))/(6561*pi));
    DG_out(2,1) = (8.*exp(-2/3.*R).*(R-6).*R.*(R.^2-12.*R+18).*cos(TH).*sin(TH))/(19683*pi);
    DG_out(2,2) = (8.*exp(-2/3.*R).*(R.^4-24.*R.^3+171.*R.^2-378.*R+162).*(cos(TH)).^2)/(59049*pi);
end

