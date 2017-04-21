clear all; close all;

% Rossler attractor & Chaos theory.

% changing a = 0.2 to a = 0.3, causes a significant difference.
a = 0.2;
b = 0.2;
c = 5.7;

dv_dt = @(t,v) [-v(2)-v(3); v(1) + a*v(2) ; b+v(3)*(v(1)-c) ]; 
% 
% [t1,v1] = ode45(dv_dt,[0,100],[.1;.1;.1]);
% [t2,v2] = ode45(dv_dt,[0,100],[.11;.11;.11]);
% 
% 
% plot3(v1(:,1),v1(:,2),v1(:,3),'b');
% hold on;
% plot3(v2(:,1),v2(:,2),v2(:,3),'r');

dt = 0.1;
t = 0:dt:100;

v3 = zeros(3,length(t));
v4 = zeros(3,length(t));

v3(:,1) = [.1;.1;.1];
v4(:,1) = [.11;.11;.11];

figure

for i = 1:length(t)-1
    
    v3(:, i+1) = v3(:,i) + dt*dv_dt(t(i),v3(:,i));
    v4(:, i+1) = v4(:,i) + dt*dv_dt(t(i),v4(:,i));
    
    plot3(v3(1,i:i+1),v3(2,i:i+1),v3(3,i:i+1),'b');
    hold on;
    plot3(v4(1,i:i+1),v4(2,i:i+1),v4(3,i:i+1),'r');
    drawnow;
end

