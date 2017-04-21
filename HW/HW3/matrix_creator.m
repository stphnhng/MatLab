function [ main_matrix ] = matrix_creator( length )
%MATRIX_CREATOR Summary of this function goes here
%   Detailed explanation goes here

    main_vector = repmat(2,1,length);
    main_matrix = diag(main_vector);

    second_vector = repmat(-1,1,length-1);
    second_matrix = diag(second_vector,1);

    third_matrix = diag(second_vector,-1);
    
    main_matrix = main_matrix + second_matrix + third_matrix;

end

