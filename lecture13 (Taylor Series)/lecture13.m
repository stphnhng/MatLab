% Taylor Series

% Given a function f(x) and a reference point a.
% Let x be near a. 
% Then f(x) ~= f(a) + f'(a) * (x-a) + f''(a)/2! * (x-a)^2 + ...
% Useful becuse:

% (1) Given f, and we cant find a point, but we know a point nearby, we can use
% this to find it.
% Saves calculating f if f is hard to calculate.

% (2) It converts a function that is a generic function into a polynomial.
% easy to solve, integrate, etc.

% Rest on notes.

clear all; close all; clc;

x = linspace(0,1,100);
y = @(x) x.*(x-0.25).*(x-0.75);
plot(x,y(x));

y_prime = @(x) 3*x.^2 - 2*x + 3/16;

newton(y,y_prime,0.6,1e-4);
% Does newton's method using y & y_prime 
% with an initial guess of 0.6.

hold on;
newton_solve = newton(y,y_prime,0.6,1e-4);
plot(0.75,y(0.75),'r.','markersize',24);
for i = 1:length(newton_solve)
    plot(newton_solve(i),y(newton_solve(i)),'b.','markersize',24);
    pause(0.5);
end

error = newton_solve - 0.75;

y_prime2 = @(x) 6*x - 2;

x_min = (2 + sqrt(4 - 4*3*3/16))/(2*3);
x_max = (2 - sqrt(4 - 4*3*3/16))/(2*3);
% quadratic solved for max & min.

newton_max = newton(y_prime,y_prime2,0.1,1e-4);
% finds max
newton_min = newton(y_prime,y_prime2,0.6,1e-4);
% finds min

