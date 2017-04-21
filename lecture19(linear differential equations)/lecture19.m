clear all; close all; clc

% Harmonic Oscillator

% Consider the simple harmonic oscillator:
% dx/dt = -y
% dy/dt = x
% x0 = 1. y0 = 0
% Solution: x(t)= cos(t), y(t) = sin(t)

harmonic_oscillator = @(t, input) [-input(2);input(1)];
x0 = 1;y0 = 0;
initial = [x0; y0];
% subplot(2,2,1);
[t_out, forward] = forward_euler(harmonic_oscillator,initial,100,0.01);
% plot(forward(1, :),forward(2,:));


% subplot(2,2,2);
A = [0 -1 ;1 0];
[t_out, backward] = linear_backward_euler(A,initial,100,0.01);
% plot(backward(1,:),backward(2,:));

% Symplectic Integrator
% Designed for problems that has something conserved.
% For this example: x^2 + y^2 = 1
% y_k+1 = y_k + dt * x_k
% x_k+1 = x_k - dt * y_k+1 (use the velocity)

dt = 0.01;
t = 0:dt:100;
symplectic = zeros(2,length(2));
symplectic(:,1) = initial;
for i = 1:length(t - 1);
    symplectic(2,i+1) = symplectic(2,i) + dt * symplectic(1,i);
    symplectic(1, i+1) = symplectic(1,i) - dt * symplectic(2, i+1);
end

plot(symplectic(1,:),symplectic(2,:));

% compare against ode45
close();
figure();
subplot(2,2,1);
[t_ode45,out_ode45] = ode45(harmonic_oscillator,[0,100],initial);
plot(out_ode45(:,1),out_ode45(:,2));

subplot(2,2,2);
[t_ode45,out_ode45] = ode45(harmonic_oscillator,[0,1000],initial);
plot(out_ode45(:,1),out_ode45(:,2));

subplot(2,2,3);
[t_ode45,out_ode45] = ode45(harmonic_oscillator,[0,10000],initial);
plot(out_ode45(:,1),out_ode45(:,2));

% It's important to construct methods for your specific problem.
% numerical solution of ODE is a huge field.

