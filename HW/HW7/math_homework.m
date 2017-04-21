clear all; close all;

dy_dt = @(t,y) 5-3*sqrt(y);
y_0 = 2;
end_time = 1;
dt = 0.05;

[t,y, result] = forward_euler_test(dy_dt,y_0, end_time, dt)
