clear all; close all;

% 1a.)


[x,y,z] = meshgrid( 0.1:0.05:0.5 , 1.8:0.05:2.2 , 11.8:0.05:12.2 );
cube(1,:) = x(:);
cube(2,:) = y(:);
cube(3,:) = z(:);
%plot3(cube(1,:),cube(2,:),cube(3,:),'r.');
save('A1.dat','cube','-ascii');

% 1b.)

solution = zeros(701,3,729);
t = (0:0.01:7);
a = 16;
b = 5;
c = 10;
d = 6;
e = 18;
f = 0.05;
dy = @(t,v) [-a * v(1,:) + f * v(2,:) .* v(3,:);
             c * v(2,:) - d * v(1,:) .* v(3,:);
            -b * v(3,:) + e * (v(2,:)).^2;
            ];
for i = 1:701
    solution(i,:,:) = cube;
    cube = rk4singlestep( dy , 0.01, t(i) , cube);
end

A2 = squeeze(solution(:,1,:));
A3 = squeeze(solution(:,2,:));
A4 = squeeze(solution(:,3,:));
save('A2.dat','A2','-ascii');
save('A3.dat','A3','-ascii');
save('A4.dat','A4','-ascii');


% 2a.)

x_0 = 0.7;
a5 = zeros(31,4);
a5(1,:) = 0.7;

for i = 2:31
    a5(i,1) = 2.5 .* a5(i-1,1) .* (1- a5(i-1,1));
    a5(i,2) = 3.2 .* a5(i-1,2) .* (1- a5(i-1,2));
    a5(i,3) = 3.52 .* a5(i-1,3) .* (1- a5(i-1,3));
    a5(i,4) = 4 .* a5(i-1,4) .* (1- a5(i-1,4));
end


save('A5.dat','a5','-ascii');

a6_result = [1;2;4];
save('A6.dat','a6_result','-ascii');

% 2b.)
a7 = zeros(501,1501);
a7(1,:) = 0.7;
r7 = (2.5:0.001:4);
for i = 2:501
    a7(i,:) = r7.*a7(i-1,:).*(1-a7(i-1,:));
end
a7_save = a7(402:end,:);
save('A7.dat','a7_save','-ascii');

%plot(r7,a7_save,'k.','Markersize',1);




