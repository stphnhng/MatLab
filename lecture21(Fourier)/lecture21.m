clear all; close all;

N = 10;
theta = linspace(0,2*pi*(N-1)/N,N);
exponential = exp(1j*theta);

% 1j or 1i = 'i' as in imaginary number.

% real(X) only take real #s of X.
% real(exponential);
% hold on;
% plot(theta,real(exponential));
% % cos theta
% 
% plot(theta,imag(exponential));
% % sin theta
% 
% plot(real(exponential),imag(exponential));
% % unit circle-> cos(theta) + i sin(theta)

% Discrete Fourier Transform
% help fft

fft_of_sine = fft(sin(theta));
% DFT of sine.

k = 1:N;
eval = @(x) 1/N*sum(exp(1j*x*(k-1)).*fft_of_sine);

inverse = zeros(length(theta),1);
for i = 1:length(theta)
    inverse(i) = eval(theta(i));
end

% plot(theta,inverse);

inverse_error = inverse - ifft(fft_of_sine.');
% ifft = inverse DFT.

% Both fft & ifft are fast

N = 256;
x = linspace(0,2*pi*(N-1)/N,N);
signal = @(x) 6*sin(3*pi*x) - 2*sin(5*pi*x) + 4*sin(17*pi*x);
figure;
subplot(2,2,1)
plot(x,signal(x));

transformed_signal = fft(signal(x));
k = 0:255;
subplot(2,2,2);
plot(k,abs(transformed_signal));

noise_size = 10;
noisy_signal = signal(x) + noise_size*(rand(size(x)) - 0.5);
subplot(2,2,3);
plot(x,noisy_signal);

transformed_noisy_signal = fft(noisy_signal);
subplot(2,2,4);
plot(k,abs(transformed_noisy_signal));

% From noisy signal we can identify a similar plot to regular
% transformed signal.
% Can use filtering to remove noise.

