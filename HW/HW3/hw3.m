clc; clear all; close all;

% Setting up A_50 and p vector
main_vector = repmat(2,1,50);
main_matrix = diag(main_vector);

second_vector = repmat(-1,1,49);
second_matrix = diag(second_vector,1);

third_matrix = diag(second_vector,-1);

main_matrix = main_matrix + second_matrix + third_matrix;

p_vector = zeros(50,1);

for i=1:50
    p_vector(i,1) = 2 * (1-cos(23*pi/51)) * sin(23*pi*i/51);
end

% 1a.)
b_2 = p_vector ./ diag(main_matrix);
x = [0;0;0];

M = zeros(size(main_matrix));

for i = 1:size(main_matrix)
    row = main_matrix(i,:);
    rowSize = size(row);
    rowSize = rowSize(1,2);
    rowDiag = row(i); % diag
    for j = 1:rowSize
        row(j) = row(j) / (rowDiag*-1);
    end
    row(i) = 0;
    M(i,:) = row;
end

M = [M,b_2];

save('A1.dat','M','-ascii');

% 1b.)
x = ones(1,50).' ;

D = diag(diag(main_matrix));
T = main_matrix - D;

err = 0.0001 + 1;

number_of_iterations = 0;

while(err > 0.0001)
    number_of_iterations = number_of_iterations + 1;
    x_new = D\(p_vector-T*x);

    err = norm(x - x_new,inf);
    x = x_new;
end

save('A2.dat','x','-ascii');
save('A3.dat','number_of_iterations','-ascii');

% 1c and 1d.)

% S = lower triangular
% T = everything else.

% M = -inv(S) * T
% c = inv(S) * b

S = tril(main_matrix);
T = main_matrix - S;

matrix_M_2 = (-1 * inv(S)) * T;

vector_c = inv(S) * p_vector;

matrix_M_2 = [matrix_M_2,vector_c];

save('A4.dat','matrix_M_2','-ascii');

L = tril(main_matrix);
T = main_matrix - L;

[vectors,values] = eig(-L\T);

max_eig = max(abs(diag(values)));

if max_eig > 1
    error('Jacobi will not complete');
end
tol = 1e-4;
err = tol + 1;
% difference between old and new x

x = ones(50,1);
b = p_vector;

iteration = 0;

while(err > tol)
    iteration = iteration + 1;
    x_new = L\(b-T*x);
    err = norm(x - x_new,inf);
    x = x_new;
end

save('A5.dat','x','-ascii');
save('A6.dat','iteration','-ascii');

% 2a.)

D = diag(diag(main_matrix));
U = triu(main_matrix) - D;
L = tril(main_matrix) - D;
omega = 1.5;

c = inv(D + (omega * L)) * omega * p_vector;
M = -1 * inv(D + (omega * L)) * ( (omega*U) + (omega-1)*D);
M = [M,c];

save('A7.dat','M','-ascii');

% 2b.)

x_new;
x = ones(50,1);
M = -1 * inv(D + (omega * L)) * ( (omega*U) + (omega-1)*D);
err_new = ones(50,1);

a_result = [];

smallest_omega = 0;
smallest_eig = 9999;

for i = 1:.01:1.99
  x_new = M*x + c;
  err_k = x - x_new;
  
  B = (D + i * L) \ (-1 * ( i * U + D * i - D));
  
  b_eig = abs(eig(B));
  
  a_result = [a_result,b_eig];
  
  max_eig = max(b_eig);
  
  if(max_eig < smallest_eig)
      smallest_eig = max_eig;
      smallest_omega = i;
  end
  
  err_new = err_k;
  x = x_new;
end

a_result = a_result.';

a9_result = [smallest_omega;smallest_eig];

save('A8.dat','a_result','-ascii');
save('A9.dat','a9_result','-ascii');


% 2c.)

c_result = [];

for i = 1:0.01:1.99
    x_new = zeros(50,1);
    x = ones(50,1);
    c = inv(D + (i * L)) * i * p_vector;
    M = -1 * inv(D + (i * L)) * ( (i*U) + (i-1)*D);
    for j = 1:200
        x_new = M*x + c;
        x = x_new;
    end
    residual = main_matrix * x - p_vector;
    norm_result = norm(residual);
    c_result = [c_result;norm_result];
end

save('A10.dat','c_result','-ascii');

omega = 1.89;
tol = 1e-4;
err = 1 + tol;
x = ones(50,1);

c = inv(D + (omega * L)) * omega * p_vector;
M = -1 * inv(D + (omega * L)) * ( (omega*U) + (omega-1)*D);

iteration = 0;

while(err > tol)
    iteration = iteration + 1;
    x_new = M * x + c;
    err = norm(x - x_new,inf);
    x = x_new;
end

save('A11.dat','x','-ascii');
save('A12.dat','iteration','-ascii');


