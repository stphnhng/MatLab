clear all; close all;
% 1a.)
N = [ 7.24; 9.64; 12.87; 17.07; 23.19; 31.44; 38.56; 50.19; 62.98; ...
      76.21; 92.23; 106.02; 123.20; 132.16; 151.33; 179.32; 203.30; ...
      226.54; 248.71; 281.42; 307.75];
years = (1810:10:2010).';
t = (90:10:110).';

second_order = zeros(19,1);

second_order(1) = ( -3 * (N(1)) + 4*(N(2)) - (N(3)) ) / (2 * (years(2) - years(1)) );
for x = 2:length(N)-1
    second_order(x) = (N(x+1) - N(x-1)) / (years(x+1) - years(x-1));
end
second_order = [second_order; ( 3 * (N(end)) - 4*(N(end-1)) + (N(end-2)) ) / (2 * (years(2) - years(1)) )];
save('A1.dat','second_order','-ascii');

% 2a.)

r = (0.308:.017:0.478).';
T = [640;794;885;943;1034;1064;1114;1152;1204;1222;1239];

r_l = 0.308; % ft.
r_0 = 0.478; % ft.
theta_p = 0.7051; % radians.

f_1 = @(x) x .* T(round(x./0.017)-17) .* theta_p;
f_2 = @(x) x * theta_p;
n = 10;
h = (r_0 - r_l) / n;

top_simpsons = zeros(1,n/2);
for x = 1:((n/2))
    top_simpsons(x) = r(2*x - 1) * T(2*x -1) + 4*(r(2*x)*T(2*x)) + r(2*x + 1) * T(2*x + 1);
end
top_simpsons = sum(top_simpsons);
top_simpsons = h / 3 * top_simpsons * theta_p;

bottom_simpsons = zeros(1,n/2);
for x = 1:(n/2)
    bottom_simpsons(x) = r(2*x - 1) + 4*(r(2*x)) + r(2*x + 1);
end
bottom_simpsons = sum(bottom_simpsons);
bottom_simpsons = h / 3 * bottom_simpsons * theta_p;

T_simpsons = top_simpsons / bottom_simpsons;

save('A2.dat','top_simpsons','-ascii');
save('A3.dat','bottom_simpsons','-ascii');
save('A4.dat','T_simpsons','-ascii');

% 2b.)

top_trap = sum( trapz(r.*T)*h*theta_p );
bottom_trap = trapz(r)*h*theta_p;
T_trap = top_trap / bottom_trap;

save('A5.dat','top_trap','-ascii');
save('A6.dat','bottom_trap','-ascii');
save('A7.dat','T_trap','-ascii');



