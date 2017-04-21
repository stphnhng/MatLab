function [ t,y ] = forward_euler( dy_dt,y0,end_time,dt)
%FORWARD_EULER Summary of this function goes here
%   Calculates differential equation using forward euler method.

    t = 0:dt:end_time;
    % time vector.
    y = zeros(length(y0),length(t));
    % output vector = length of t.
    y(:,1) = y0;
    % y corresponding to t = 0.
    for i = 1:length(t)-1
        % fills in every value of y.
%         y(i+1) = y(i) + dt * dy_dt(y(i));
        % Uses value of both t(i) and y(i)
        % Depends on either t, y, or both.
        y(:,i+1) = y(:,i) + dt * dy_dt(t(i),y(:,i));

    end

end

