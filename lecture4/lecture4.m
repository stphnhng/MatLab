% clear all;
% close all;
% 
% 
% % if_variable = 6;
% % 
% % if if_variable == 5
% %     disp('Yes, it is equal to five');
% %     % disp prints strings.
% % else 
% %     disp('No, it is not equal to five');
% % end
% 
% random_list = rand(10,1); %rand generates a matrix of random numbers from 0 to 1.
% 
% for i = 1:length(random_list)
%     random_list(i)
%     if random_list(i) > 0.5 % adding ... to if statement means next line counts as part of the if operator.
%         disp('The number above this line is greater than 0.5');
%     else
%         disp('The number above this line is less than 0.5');
%     end
% end
% 
% % elseif statement is an else if statement...



% Bisection Method (root finding method)
% -------------------
% choose positive point on graph and next negative point on graph and
% identify where the graph hits 0.

clear all;
close all;

fun = @(x) exp(x) - 1;
% defines a function where @(x,y,z) are the parameters and the following
% lines are the functions.

tolerance = 0.0001;

left = -1;
right = 0.5;

while abs(right-left) > tolerance

    midpoint = (left + right) / 2;
    
    if fun(left)*fun(midpoint) > 0
        left = midpoint;
    else
        right = midpoint;
    end
    
    fun(midpoint)
end
