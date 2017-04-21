% Plotting in matlab;

clear all;
close all;

% x = linspace(0,1,100);
x = [0:0.01:1];
y1 = exp(x) - 1;
% plot(x,y,'-');                 % Graph of a line.
% plot(x,y,'--');                % Graph of a dotted line.
% plot(x,y,'--r','Linewidth',5); % Graph of thick dotted lines.
% hold on;                       % Keeps graph so it isnt overwritten by next plot

% y1 = zeros(size(x));
% plot(x,y1,'Linewidth',5);    % Plots a solid line on the x axis.

y2 = cos(x);
y3 = x.^2;   % '.' means element wise operation.

plot(x,y1,'Linewidth',3); 
hold on; % needs 'hold off;' to stop holding.
plot(x,y2,'.r','Linewidth',3); % '.r' creates a dotted red line (thickness 3)
plot(x,y3,'*g','Linewidth',3); % '*g' creates a *'ed green line (thickness 3)

title('A few functions','Fontsize',16); % (title, fontsize, param for fontsize)

xlabel('the x-axis','Fontsize',16); % labels x axis.
ylabel('the y-axis','Fontsize',16); % labels y axis.

legend('e^x-1','cos(x)','x^2','location','northwest') 
% Creates a legend for each graph in order.