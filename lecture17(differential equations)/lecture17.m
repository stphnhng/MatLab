clear all; close all;

dy_dt = @(y) -2*y;
% derivative
y0 = 1;
% initial condition
dt = 0.1;
% steps
t = 0:0.1:1;
% time vector.
y = zeros(1,length(t));
% output vector = length of t.
y(1) = 1;
% y corresponding to t = 0.
for i = 1:length(t)-1
    % fills in every value of y.
    y(i+1) = y(i) + dt * dy_dt(y(i));
end

% plot(t,y,'b');
% hold on;
% plot(t,exp(-2*t),'r');
close;
figure;
hold on;
[t,y] = forward_euler(dy_dt,1,1,.1);
plot(t,y,'b');
[t,y] = forward_euler(dy_dt,1,1,.01);
plot(t,y,'r');
[t,y] = forward_euler(dy_dt,1,1,.001);
plot(t,y,'g');
plot(t,exp(-2*t),'k');

format long;
err_vec = zeros(3,1);

[t,y] = forward_euler(dy_dt,1,1,.1);
err_vec(1) = abs(y(end) - exp(-2));
[t,y] = forward_euler(dy_dt,1,1,.01);
err_vec(2) = abs(y(end) - exp(-2));
[t,y] = forward_euler(dy_dt,1,1,.001);
err_vec(3) = abs(y(end) - exp(-2));

err_vec;
% Forward Euler is Order 1 (O(1)) scheme since err decreases by factor of
% 10 as step decreases by a factor of 10.
% 
% dy_dt2 = @(t,y) cos(t);
% close;
% figure;
% hold on;
% [t,y] = forward_euler(dy_dt2,0,2*pi,.1);
% plot(t,y,'b');
% [t,y] = forward_euler(dy_dt2,0,2*pi,.01);
% plot(t,y,'r');
% [t,y] = forward_euler(dy_dt2,0,2*pi,.001);
% plot(t,y,'g');
% plot(t,sin(t),'k');

close;

A = [3 0; 0 -2];
dy_dt3 = @(t,y) A*y;

% figure(1); hold on; figure(2); hold on;
% 
% [t,y] = forward_euler(dy_dt3,[1;1],1,0.1); figure(1);plot(t,y(1,:),'b');figure(2);plot(t,y(2,:),'b');
% [t,y] = forward_euler(dy_dt3,[1;1],1,0.01); figure(1);plot(t,y(1,:),'r');figure(2);plot(t,y(2,:),'r');
% [t,y] = forward_euler(dy_dt3,[1;1],1,0.001); figure(1);plot(t,y(1,:),'k');figure(2);plot(t,y(2,:),'k');
% 
% figure(1);plot(t,exp(3*t),'g');
% figure(2);plot(t,exp(-2*t),'g');
% 
close all;
figure(1); hold on; figure(2); hold on;

[t,y] = backward_euler(A,[1;1],1,0.1); figure(1);plot(t,y(1,:),'b');figure(2);plot(t,y(2,:),'b');
[t,y] = backward_euler(A,[1;1],1,0.01); figure(1);plot(t,y(1,:),'r');figure(2);plot(t,y(2,:),'r');
[t,y] = backward_euler(A,[1;1],1,0.001); figure(1);plot(t,y(1,:),'k');figure(2);plot(t,y(2,:),'k');

figure(1);plot(t,exp(3*t),'g');
figure(2);plot(t,exp(-2*t),'g');
