clear all;
close all;

A = [55,-10,-20;-10,30,-15;-20,-15,65];
[L,U,P] = lu(A);
aResult = [A,P,L,U];
save('A1.dat','aResult','-ascii');

% The voltage doesn't matter for LU decomposition. 

bResult = [];

for i=1:100
    bVector = [50,0,i].';
    d = P*bVector;
    yVector = L\d;
    xVector = U\yVector;
    bResult = [bResult,xVector];
end

save('A2.dat','bResult','-ascii');

aInverse = inv(A);

cResult = [];

for i=1:100
    b = [50;0;i];
    xVector = aInverse * b;
    cResult = [cResult,xVector];
end

cResult = abs(bResult - cResult);

s = sqrt(2)/2;

save('A3.dat','cResult','-ascii');

A_2 = [-s,1,0,0,0,0,0,0,0,s,0,0,0
        -s,0,0,0,0,0,0,0,-1,-s,0,0,0
        0,-1,1,0,0,0,0,0,0,0,0,0,0
        0,0,0,0,0,0,0,0,0,0,-1,0,0
        0,0,-1,s,0,0,0,0,0,0,0,-s,0
        0,0,0,-s,0,0,0,0,0,0,0,-s,-1
        0,0,0,-s,-1,0,0,0,0,0,0,0,0
        0,0,0,0,1,-1,0,0,0,0,0,0,0
        0,0,0,0,0,0,0,0,0,0,0,0,1
        0,0,0,0,0,1,-1,0,0,-s,0,s,0
        0,0,0,0,0,0,0,0,0,s,1,s,0
        0,0,0,0,0,0,1,-1,0,0,0,0,0
        0,0,0,0,0,0,0,0,1,0,0,0,0];
    
bVector_2 = [0;0;0;0;0;0;0;0;5;0;5;0;5];

[L_2,U_2,P_2] = lu(A_2);

d = P_2*bVector_2;
yVector_2 = L_2\d;
xVector_2 = U_2\yVector_2;

save('A4.dat','yVector_2','-ascii');
save('A5.dat','xVector_2','-ascii');

xVector_3 = A_2\bVector_2;

save('A6.dat','xVector_3','-ascii');

loopCondition = true;
loopCounter = 0;

while(loopCondition)
    loopCounter = loopCounter + 0.01;
    bVector_3 = [0;0;0;0;0;0;0;0;5;0;loopCounter+5;0;5];
    xVector_4 = A_2\bVector_3;
    if norm(xVector_4,Inf) >= 30
        loopCondition = false;
    end
end

loopCounter = loopCounter + 5;

save('A7.dat','loopCounter','-ascii');

