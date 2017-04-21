clear all; close all;

% orthonogal matrix.
Q = [0.458195 0.642812 0.618533;0.613496 -0.727308 0.307643;0.647621 0.240445 -0.72302];
Q.'*Q; % identity matrix
Q*Q.'; % identity matrix

% help svd.
% Singular Value Decomposition = svd(X) such that X + U*S*V'

A = rand(5);
[U,S,V] = svd(A);
U.'*U;
U*U.'; % orthongal matrix

S; % diagonal

V.'*V;
V*V.'; % orthogonal matrix 

U*S*V.'; % = A due to SVD.

% Doing algebra + proofs using SVD

A*A.';;
V*S^2*V.';
U*S^2*U.';
% All equal (A.'*A)

A = [4.96 0.64;1.32 3.22];

[U,S,V] = svd(A);

x = linspace(0,2*pi,100);
unit_circle = [cos(x);sin(x)];
plot(unit_circle(1,:),unit_circle(2,:),'.');

transforms_to = zeros(size(unit_circle));
for i = 1:100
    transforms_t0(:,i) = A*unit_circle(:,1);
end
hold on
plot(transforms_to(1,:),transforms_to(2,:),'r.');


hold on;
major_axis = [zeros(1,2);S(1,1)*U(:,1).'];
minor_axis = [zeros(1,2);S(2,2)*U(:,2).'];

A*V(:,1);
S(1,1) * U(:,1);
A*V(:,2);
S(2,2)*U(:,2);

our_pick = unit_circle(:,17);
c1 = our_pick .' * V(:,1);
c2 = our_pick.' * V(:,2);
A* our_pick;
c1 * S(1,1) * U(:,1) + c2*S(2,2) * U(:,2);



