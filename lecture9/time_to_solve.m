function time = time_to_solve(N)
% function name = main(input)
% 3 comments after a function decl like this one, is the documentation.
% help ___.m 
% tic starts a stopwatch
% toc stops a stopwatch and tells how long it has been since tic.
% pause(#) pauses for # seconds.


A = rand(N);
b = rand(N,1);

tic
A\b;
time = toc;
end
