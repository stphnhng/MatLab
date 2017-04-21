clear all;close all;

% can do i = 1:10 (1,2,3,4,5,6,7,8,9,10)
% can do i = 1:2:11 (1,3,5,7,9,11)
for i = [1,3,-2,14,pi]
    current_iteration = i;
end

cumulative_sum = 0;
cumulative_sum_list = zeros(10,1);
for i = 1:10
    cumulative_sum = cumulative_sum + i;
    cumulative_sum_list(i) = cumulative_sum %variable indexing
end


% Multiple Loops

matrix_to_fill = zeros(5,5);
for i = 1:5
    for j = 1:5
        % Nested for loop i = row, j = column
        matrix_to_fill(i,j) = i
    end
end


