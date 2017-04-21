function [t,y] = nonlinear_backward_euler(f,grad_f,y0,t_end, dt)
    
    t = 0:dt:t_end;
    
    y = zeros(length(y0),length(t));
    y(:,1) = y0;
    
    for i = 1:length(t)-1
        G = @(x) x - y(:,i) - dt*f(x);
        DG = @(x) eye(length(y0)) - dt*grad_f(x);
        x_list = newton(G,DG,y(:,i),1e-6);
        
        y(:,i+1) = x_list(:,end);
    end
    
    
end