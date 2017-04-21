clear all; close all;

N = 256;
x = linspace(0,2*pi*(N-1)/N,N);
signal = @(x) 6*sin(3*pi*x) - 2*sin(5*pi*x) + 4*sin(17*pi*x);
% signal = @(x) 6*sin(3*x) - 2*sin(5*x) + 4*sin(17*x);

figure
subplot(2,2,1);
plot(x,signal(x));

transformed_signal = fft(signal(x));
subplot(2,2,2);
plot(abs(transformed_signal));

noise_size = 25;
noisy_signal = signal(x) + noise_size * (rand(size(x)) - 0.5);
% rand = - 12.5 to 12.5

subplot(2,2,3);
plot(x,noisy_signal);
% added noise to regular (x,signal(x)) plot.

subplot(2,2,4);
transformed_noisy = fft(noisy_signal);
plot(abs(transformed_noisy));

% random noise adds stuff to every different frequency 
% (both low and high).

A = rand(3,3);
% A(A < 0.5) = 0
A(A < 0.5) = pi;
% Sets everything less than 0.5 to pi

filtered = transformed_noisy;
filtered(abs(filtered) < 300) = 0;
close;
subplot(3,1,1);
plot(abs(transformed_signal));
subplot(3,1,2);
plot(abs(transformed_noisy));
subplot(3,1,3);
plot(abs(filtered));
% signal vs noisy vs filtered.

close
plot(x,signal(x));
hold on
plot(x,ifft(filtered),'r');
% filtered vs exact.
close

load('handel');
soundsc(y,Fs);
% handel (hallalujah song)

noisy = y + 0.1*(rand(size(y))-0.5);
soundsc(noisy,Fs);
% handel + white noise.

original = fft(y);
figure(1);
plot(abs(original));
noisy_freq = fft(noisy);
figure(2);
plot(abs(noisy_freq));

filitered = noisy_freq;
filitered( abs(filtered) < 50) = 0;
figure(3);
plot(abs(filitered));

high_pitch = original;
n = length(original);
high_pitch((n+1)/2 - 5000:(n+1)/2) = 500*(rand(5001,1)-0.5).*rand(5001,1);

