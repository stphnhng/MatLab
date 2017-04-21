x = 0:0.1:1;
y = [1.19 2.04 3.4 3.02 2.03 1.77 1.76 0.84 1.44 1.85 4.11];

plot(x,y,'.','markersize',24);

coeffs_linear = polyfit(x,y,1);
% polyfit(x, y, degree of polynomial)

y_linear = polyval(coeffs_linear,x);
% polyval evalutes the polynomial p(x)
% polyval([coefficients], [all x values])

hold on;
plot(x,y_linear,'r-');

sum((y_linear - y).^2);
% error of linear

coeffs_quad = polyfit(x,y,2);
y_quad = polyval(coeffs_quad,x);
plot(x,y_quad,'g-');
sum((y_quad - y).^2);
% error of quad

coeffs_cubic = polyfit(x,y,3);
y_cubic = polyval(coeffs_cubic,x);
plot(x,y_cubic,'k-');

sum((y_cubic-y).^2);
% error of cubic

% Smoother line by increasing number of data points.
x_fine = 0:0.01:1;
y_cubic_fine = polyval(coeffs_cubic,x_fine);
plot(x_fine,y_cubic_fine,'m-');
% Smoother cubic function.

coeffs_10 = polyfit(x,y,10);
y_10 = polyval(coeffs_10,x);
sum((y_10 - y).^2);

y_10_fine = polyval(coeffs_10,x_fine);
plot(x_fine,y_10_fine,'b-');

% Interpolation, devise a function that passes through
% data points but makes points in between make sense.

% interp1
hold off;
plot(x,y,'.','markersize',24);
hold on;
linear_interp = interp1(x,y,x_fine,'linear');
% interp1(x points, y points, query points(points in between), method);
plot(x_fine,linear_interp,'k-');

nearest_interp = interp1(x,y,x_fine,'nearest');
% nearest gets closest neighbor and ??
% Used for discrete data, always gets one of the data points.
plot(x_fine,nearest_interp,'r-');

splines_interp = interp1(x,y,x_fine,'splines');
plot(x_fine,splines_interp,'g-');

hold off;

close;
plot(x,y,'.','markersize',24);
hold on;
% Looks similar to sine/cosine wave.

A = zeros(3,3);
A(1,1) = sum(sin(2*pi*x).^2);
A(1,2) = sum(sin(2*pi*x).*cos(2*pi*x));

A(2,1) = sum(sin(2*pi*x).*cos(2*pi*x));

A(1,3) = sum(sin(2*pi*x));
A(3,1) = sum(sin(2*pi*x));

A(2,2) = sum(cos(2*pi*x).^2);
A(2,3) = sum(cos(2*pi*x));
A(3,2) = sum(cos(2*pi*x));
A(3,3) = 11;

b = zeros(3,1);
b(1) = sum(y.*sin(2*pi*x));
b(2) = sum(y.*cos(2*pi*x));
b(3) = sum(y);

trig_coeffs = A\b;

y_trig = trig_coeffs(1) * sin(2*pi*x_fine) + trig_coeffs(2) * cos(2*pi*x_fine)+ trig_coeffs(3);
plot(x_fine,y_trig,'c-');
