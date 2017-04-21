f = @(x) exp(x);
x = linspace(0,1,10);
y = f(x);
h = x(2) - x(1);
dy_dx_f = (y(2:end) - y(1:end-1) )/ h;

% exact answer
y(1:end-1);

% real plot.
plot(x,y)
hold on;
% approximation
plot(x(1:end-1),dy_dx_f,'r')

dy_dx_b = dy_dx_f;
y(2:end); % y(2:end) should be approximate to dy_dx_b.
plot(x(2:end),dy_dx_b,'k')

% getting the error of forward differentiation.
N = [10,100,1000,10000,100000];
err_f = zeros(length(N),1);
for i = 1:length(N)
    [dy_dx,x_f] = forward_diff(f,0,1,N(i));
    exact = f(x_f);
    err_f(i) = norm(exact - dy_dx,2);
end

% Getting the error of backwards differentiation.
err_b = zeros(length(N),1);
for i = 1:length(N)
    [dy_dx,x_b] = backward_diff(f,0,1,N(i));
    exact = f(x_b);
    err_b(i) = norm(exact - dy_dx,2);
end

% Getting the error using central difference.
err_c = zeros(length(N),1);
for i = 1:length(N)
    [dy_dx,x_c] = central_diff(f,0,1,N(i));
    exact = f(x_c);
    err_c(i) = norm(exact - dy_dx,2);
end

% Error(C) > Error(F) = Error(B) 
% O(h^2)   > O(h)     = O(h)

err_f
err_b
err_c

close
plot(x,y)
hold on
[forward_deriv,x_f] = forward_diff(f,0,1,1000);
[backward_deriv,x_b] = backward_diff(f,0,1,1000);
[central_deriv,x_c] = central_diff(f,0,1,1000);
plot(x_f,forward_deriv,'r');
plot(x_b,backward_deriv,'k');
plot(x_c,central_deriv,'g');

% Wed. lecture 16 = numerical differentiation, solve for f''(x) to
% approximate 2nd derivative.
% - combine differentiations to make better approximations.
