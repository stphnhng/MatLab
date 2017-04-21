
% 1a)
[TH,R] = meshgrid(0:0.05*pi:2*pi,0:0.5:20);

constant = (sqrt(2)/(81 * sqrt(pi)) );
    
F = (abs( constant .* (6.*R - R.^2) .* exp(-R/3) .* cos(TH) )).^2;
   

[X,Y] = pol2cart(TH,R);

surf(X,Y,F);

save('A1.dat','X','-ascii');
save('A2.dat','Y','-ascii');
save('A3.dat','F','-ascii');

% 1b)
A4 = fminsearch('f',[0;1]).';
A5 = fminsearch('f',[0;10]).';
A6 = fminsearch('f',[pi;1]).';
A7 = fminsearch('f',[pi;10]).';

save('A4.dat','A4','-ascii');
save('A5.dat','A5','-ascii');
save('A6.dat','A6','-ascii');
save('A7.dat','A7','-ascii');

% 1c)

A8 = newton(@(v) G_out(v), @(v) DG_out(v),[0;1],1e-4);
A9 = newton(@(v) G_out(v), @(v) DG_out(v),[0;10],1e-4);
A10 = newton(@(v) G_out(v), @(v) DG_out(v),[pi;1],1e-4);
A11 = newton(@(v) G_out(v), @(v) DG_out(v),[pi;10],1e-4);

save('A8.dat','A8','-ascii');
save('A9.dat','A9','-ascii');
save('A10.dat','A10','-ascii');
save('A11.dat','A11','-ascii');

%2a)

f = [22.4 
     26.29 
     39.88];
save('A12.dat','f','-ascii');

%2b)

A = [0.1  0.23  0.31
     0.22 0.25  0.38
    -0.1 -0.23 -0.31
     0.37 0.42  0.65
     0    0     0.27
    -1    0     0
     0   -1     0
     0    0    -1];
b = [5
     7
    -4
     15
     2
    -2
    -3
    -1];

save('A13.dat','A','-ascii');
save('A14.dat','b','-ascii');

A15 = round( linprog(-f,A,b), 0);

save('A15.dat','A15','-ascii');
