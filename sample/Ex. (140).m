a = distribution(3, 21);
disp(a);

function t = distribution(start, stop)
    t = "";
    for i = start:(stop-1)
        t = t + compute(i) + newline;
    end
end

function result = compute(x)
    result = x + x / x - x * x;
end

% Ex. (140) – A simple scanner to find the output distribution.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.