dy_dt = @(y) -y.^2;
% [t_b,y_b] = nonlinear_backward_euler(dy_dt,@(y) -2*y,1,1,0.1);

% 
% hold on;
% plot(t_b,1./(1+t_b),'k');
dy_dt2 = @(t,y) -y.^2;
[t_f,y_f] = forward_euler(dy_dt2,1,1,0.1);

% plot(t_f,y_f,'r');

[t_ode45,y_ode45] = ode45(dy_dt2,[0,1],1);
% Solves Differential Equations.
% plot(t_ode45,y_ode45,'g')
% 
% U = @(x) x.^4 -2*x.^2;
% [t_ode45,y_ode45] = ode45('energy_landscape_ODE',[0,10],[0;0.5]);
% x_grid = linspace(-2,2,100);
% % grid for plotting.
% for i = 1:length(t_ode45)
%     plot(x_grid,U(x_grid));
%     hold on;
%     plot(y_ode45(i,1),U(y_ode45(i,1)),'.','markersize',16);
%     hold off;
%     pause(0.1);
% end

[t,y]=ode23s(@vdp1000,[0 3000],[2 0]);   
plot(t,y(:,1));




