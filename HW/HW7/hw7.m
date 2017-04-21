clear all; close all;

% 1a.)

k_1 = 2;
k_2 = 0.25;
k_3 = 1.5;
h = 0.1;
X_0 = 1;

C = @(X) X / (k_2 + X);

dX_dt = @(t,X) -k_1 * C(X) * X + k_3 * sin(pi * t);

[t_out, y_out] = forward_euler(dX_dt,X_0,1,h);

y_out = y_out.';

save('A1.dat','y_out','-ascii');

% 1b.)

[t_ode45, out_ode45] = ode45(dX_dt, (0:h:1) , 1);

save('A2.dat','out_ode45','-ascii');

% 1c.)
h = 0.01;
[t2_out, y2_out] = forward_euler(dX_dt,X_0,1,h);
y2_out = y2_out.';
[t2_ode45, out2_ode45] = ode45(dX_dt, (0:h:1) , 1);

c_result = [y2_out,out2_ode45];

save('A3.dat','c_result','-ascii');

% 1d.)

[t_d, X_d] = ode45(dX_dt,[0;1],1);

d_result = [t_d,X_d];
save('A4.dat','d_result','-ascii');


% 2a.)

g = -10;
L = 8;
delta = 3;

A = [0 1;g/L -delta];

save('A5.dat','A','-ascii');

% 2b.)

A6 = 0.8;
save('A6.dat','A6','-ascii');

%2c.)

dt = 0.8 * A6;
initial = [1;0];

[t_out, output] = linear_forward_euler(A,initial,50,dt);
x_t = output(1,:);

save('A7.dat','x_t','-ascii');

% 2d.)

dt = 1.05 * A6;

[t2_out, output2] = linear_forward_euler(A,initial,50,dt);
x_t2 = output2(1,:);

save('A8.dat','x_t2','-ascii');

% 2e.)

[t_e, A10] = ode45(@(t,x) A*x,[0 50],initial);
x_e = A10(:,1);
v_e = A10(:,2);
save('A9.dat', 'x_e', '-ascii')
save('A10.dat', 'v_e', '-ascii' )



