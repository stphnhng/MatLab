% Demonstration of function + tic/toc. (1)

% 2.^(1:13) shows list of 2 exponentials.
% 
% N_list = 2.^(1:13);
% 
% time_list = zeros(length(N_list),1)
% for i = 1:length(N_list)
%     time_list(i) = time_to_solve(N_list(i));
% end

% Jacboi Iteration (2.a)
%  3x  + y -  z = 3
%       5y + 2z = 1
% -3x  - y + 12 = -5

example_matrix = [3,1,-1;0,5,2;-3,-1,12;];
example_b = [3;1;-5];

% x = (3-y+z)/3
% y = (1-2z) /5
% z = (-5 + 3x + y) /12

% current_guess = [x_k,y_k,z_k]
% new_guess = [x_k+1,y_k+1,z_k+1]
% 
% v_ans = example_matrix\example_b
% 
% v_current = [1;1;1];
% 
% for i = 1:10
%     x = v_current(1);
%     y = v_current(2);
%     z = v_current(3);
%     
%     x_new = (3-y+z)/3;
%     y_new = (1 - 2*z) /5;
%     z_new = (-5 + 3*x + y)/12;
%     
%     v_current = [x_new;y_new;z_new]
%     % similar to example_matrix\example_b
% end
% 
% % v = D\(b-T*v) (2.b)

D = diag(diag(example_matrix)) % empty matrix with only diagonal from example_matrix
T = example_matrix - D;

v_current = [1;1;1];

for i = 1:10
    v_current = D\(example_b-T*v_current)
end


