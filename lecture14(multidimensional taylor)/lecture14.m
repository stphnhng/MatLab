x = linspace(0,1,100);

y = @(x) x.*(x-0.25).*(x-0.75);

plot(x,y(x));

fminsearch(y,0.4);

% @(x) G_out(x)
% 
% G_in_workspace([0;0]) 
% 
% ??? Look this up??

f = [-36;-72];
A = [7 8; 5 10;3 4;-1 0;0 -1];
b = [2000;1000;700;0;0];

linprog(f,A,b)

% result is 148 and 26 means you need 148 infantry and 26 armor to 
% maximize force.

