function v_final = jacobi( A,b,initial_guess,tol )
%JACOBI
%  Solves Ax = b using Jacobi iteration with initial guess as a starting
%  point and tolerance tol.
    
    D = diag(diag(A));
    T = A - D;
    
    [vectors,values] = eig(-D\T);
    
    max_eig = max(abs(diag(values)));
    
    if max_eig > 1:
        disp('Jacobi will not complete');
    end

    err = tol + 1;
    % difference between old and new x
    
    x = initial_guess;

    while(err > tol)
        x_new = D\(b-T*x);
        
        err = norm(x - x_new,inf);
        x = x_new
    end
   
end

