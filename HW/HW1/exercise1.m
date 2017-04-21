clear all;
close all;

A = [-1,3;2,1];
B = [5,-4;1,-3];
C = [1,1,6;1,-9,-4];
D = [1,-4;1,-3;-2,3];
x = [2;0];
y = [0;-1];
z = [-2;4;1];

varA = A-B;
varB = (4*x) - (2*y);
varC = (A*y);
varD = A * (y + x);
varE = D * x;
varF = (D * y) + z;
varG = A * B;
varH = B * A;
varI = A * C;
varJ = C * D;

% (g) and (h) are not equal this is because when multiplying matrices
% together, the order in which they are multiplied matters.

save('A1.dat','varA','-ascii');
save('A2.dat','varB','-ascii');
save('A3.dat','varC','-ascii');
save('A4.dat','varD','-ascii');
save('A5.dat','varE','-ascii');
save('A6.dat','varF','-ascii');
save('A7.dat','varG','-ascii');
save('A8.dat','varH','-ascii');
save('A9.dat','varI','-ascii');
save('A10.dat','varJ','-ascii');

varK = C(:,2);
varL = D(2:3,:);
varM = C(2,1:2);

save('A11.dat','varK','-ascii');
save('A12.dat','varL','-ascii');
save('A13.dat','varM','-ascii');

x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;

for i=1:20000
    x1 = x1 + 0.1;
end

x1 = abs(2000 - x1);

for i=1:16000
    x2 = x2 + 0.125;
end

x2 = abs(2000 - x2);

for i=1:10000
    x3 = x3 + 0.2;
end

x3 = abs(2000 - x3);

for i=1:8000
    x4 = x4 + 0.25;
end

x4 = abs(2000 - x4);

xResult = [x1 x2 x3 x4].';

save('A14.dat','xResult','-ascii');

