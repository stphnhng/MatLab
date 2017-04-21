function v_final = gauss_seidel( A,b,initial_guess,tol )
%Gauss Seidel
%  Solves Ax = b using Gauss Seidel iteration with initial guess as a starting
%  point and tolerance tol.
    
    L = tril(A);
    % Jacobi = diag(A);
    T = A - L;
    
    %[vectors,values] = eig(-L\T);
    
    %max_eig = max(abs(diag(values)));
    
    eigenvalues = eig(L\T)
    if norm(eigenvalues,inf) > 1
        error('method will not converge');
    end

    err = tol + 1;
    % difference between old and new x
    
    x = initial_guess;
    iterations = 0;

    while(err > tol)
        iterations = iterations + 1;
        %x_new = L\(b-T*x);
        x_new = L\b - L\(T*x)
        
        err = norm(x - x_new,inf);
        x = x_new
    end
   
end

