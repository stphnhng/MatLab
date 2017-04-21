clear all; close all;
% 1a.)

delta_t = 0.004;
delta_x = 0.01;
alpha = 0.1;
L = 1;
% length = L / delta_x = 100.
B = ( (alpha^2 * delta_t)/(delta_x^2) );
A = (1 - 2*(B));

M_center = diag(repmat(A,1,101));
M_top = diag(repmat(B,1,100),1);
M_bottom = diag(repmat(B,1,100),-1);
M = M_center + M_top + M_bottom;
M_save = M(1:99,1:99);
save('A1.dat','A','-ascii');
save('A2.dat','B','-ascii');
save('A3.dat','M_save','-ascii');

% 1b.)

max_eig = max(abs(eig(M)));
save('A4.dat','max_eig','-ascii');

% 1c.)

initial = @(x) exp(-200 .* (x-0.5).^2);
count = 1;
A5 = zeros(99,1);
for i = 0.01:delta_x:(L-0.01)
    A5(count) = initial(i);
    count = count + 1;
end

save('A5.dat','A5','-ascii');

% 1d.)

A6 = zeros(101,501);
count = 2;
A6(2:100,1) = A5;
A6(1,1) = 0;
A6(101,1) = 0;
for t = 0.004:delta_t:2
    
    A6(2:100,count) = M(2:100,:) * A6(:,count-1);
    A6(1,count) = 0;
    A6(101,count) = 0;
    count = count + 1;
end

save('A6.dat','A6','-ascii');

% 1e.)

% for j=1:(2/delta_t+1)
%    plot(linspace(0,L,L/delta_x+1)',A6(:,j));
%    axis([0,L,0,1]);
%    pause(delta_t);
% end

% 2a.)

[V,fr] = audioread('noisy_message.wav');

fft_audio = fft(V);

a7 = abs(fft_audio(1:1000));

save('A7.dat','a7','-ascii');

%2b.)

fft_audio_filtered = fft_audio;
fft_audio_filtered(abs(fft_audio_filtered) < 50) = 0;

a8 = abs(fft_audio_filtered(1:1000));

save('A8.dat','a8','-ascii');


fixed_audio = ifft(fft_audio_filtered);
a9 = fixed_audio(1:1000);
save('A9.dat','a9','-ascii');

% 2c.)

new_V = zeros(108680,1);

for i = 1:13585:length(V)
    section = V(i:i+13584);
    fft_section = fft(section);
    fft_filtered = fft_section;
    fft_filtered(abs(fft_filtered) < 3.2*mean(abs(fft_section)) ) = 0;
    
    new_V(i:i+13584) = ifft(fft_filtered);
end


a10 = new_V(1:1000);
save('A10.dat','a10','-ascii');








