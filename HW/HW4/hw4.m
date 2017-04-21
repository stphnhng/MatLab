clear all; close all; clc;

load salmon_data.csv;

t = (1:length(salmon_data)).';

% plot(t,salmon_data);
% hold on;
% Comment this before turning in.

Q = zeros(2,2);
Q(1,1) = sum(t.^2);
Q(1,2) = sum(t);
Q(2,1) = sum(t);
Q(2,2) = length(salmon_data);

R = zeros(2,1);
R(1,1) = sum(t .* salmon_data);
R(2,1) = sum(salmon_data);

P = Q\R;

save('A1.dat','Q','-ascii');
save('A2.dat','R','-ascii');
save('A3.dat','P','-ascii');

coeff_2 = polyfit(t,salmon_data,2)
coeff_5 = polyfit(t,salmon_data,5);
coeff_8 = polyfit(t,salmon_data,8);

save('A4.dat','coeff_2','-ascii');
save('A5.dat','coeff_5','-ascii');
save('A6.dat','coeff_8','-ascii');

poly_2 = polyval(coeff_2,78);
poly_5 = polyval(coeff_5,78);
poly_8 = polyval(coeff_8,78);

A7_result = [poly_2;poly_5;poly_8];

save('A7.dat','A7_result','-ascii');

coarse_time = 1:4:length(salmon_data);
coarse_time = coarse_time.';
coarse_salmon = salmon_data(1:4:length(salmon_data));

save('A8.dat','coarse_salmon','-ascii');

A9_result = interp1(coarse_time,coarse_salmon,t,'nearest');
A10_result = interp1(coarse_time,coarse_salmon,t,'linear');
A11_result = interp1(coarse_time,coarse_salmon,t,'cubic');
A12_result = interp1(coarse_time,coarse_salmon,t,'spline');

save('A9.dat','A9_result','-ascii');
save('A10.dat','A10_result','-ascii');
save('A11.dat','A11_result','-ascii');
save('A12.dat','A12_result','-ascii');

nearest_err = sqrt( 1/length(salmon_data) * sum((salmon_data - A9_result).^2) );
linear_err = sqrt(1/length(salmon_data) * sum((salmon_data - A10_result).^2));
cubic_err = sqrt(1/length(salmon_data) * sum((salmon_data - A11_result).^2));
spline_err = sqrt(1/length(salmon_data) * sum((salmon_data - A12_result).^2));

A13_result = [nearest_err;linear_err;cubic_err;spline_err];

save('A13.dat','A13_result','-ascii');

