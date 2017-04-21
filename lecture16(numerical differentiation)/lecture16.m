f = @(x) exp(x);
format long;
exact = exp(1) - exp(0);
% Integral from 0 to 1.

x = linspace(0,1,10);
% Divide up interval into 10 sub intervals


% Left reimann sum.
y = f(x);
% Evalute function for intervals.
h = x(2) - x(1);

sum( h*y(1:end-1));
% Sum of reimann's left sum ~ integral.

N = [10,100,1000,10000,100000];
% Interval
left_err = zeros(length(N),1);
for i = 1:length(N)
    x = linspace(0,1,N(i));
    y = f(x);
    h = x(2) - x(1);
    left_int = sum(h*y(1:end-1));
    left_err(i) = abs(left_int - exact);
    % Error = left integral - exact integral.
end

% Order h : O(h) because every time it increments by 10, error goes down by 10.


% Right reimann sum.

right_err = zeros(length(N),1);
for i = 1:length(N)
    x = linspace(0,1,N(i));
    y = f(x);
    h = x(2) - x(1);
    right_int = sum(h*y(2:end));
    right_err(i) = abs(right_int - exact);
    % Error = left integral - exact integral.
end

% Also O(h) because error decreases by 10 as interval decreases by 10.

% Midpoint / Center reimann sum.
x = linspace(0,1,N(i));
h = x(2) - x(1);
x2 = x(1:end-1) + h/2;
y = f(x2);
mid_int = sum(h*y);
mid_err = zeros(length(N),1);
for i = 1:length(N)
    x = linspace(0,1,N(i));
    h = x(2) - x(1);
    x2 = x(1:end-1) + h/2;
    y = f(x2);
    mid_int = sum(h*y);
    mid_err(i) = abs(mid_int - exact);
    % Error = left integral - exact integral.
end

% O(h^2) because interval decreases by order of 10, error decreases by
% order of 100.

% Trapezoidal Rule.

% trapz(x, f(x));
%       x   y  coords.

trapz(x,f(x));
trapz(x,f(x)) - exact;
% Err of trapz

% Simpson's Rule

% quad(function, left interval, right interval);

quad(f,0,1);
% Automatically detects sub intervals.
quad(f,0,1) - exact;
% Simpson's Rule error.

% exp(-x.^2) is impossible to write down anti derivative, only possible to
% use matlab.
quad(@(x) exp(-x.^2),0,1)
trapz(x,exp(-x.^2));

