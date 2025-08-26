a = [5, 2, 8, 4, 6, 22, 8, 9];
m = 15;
t = '';

maxVal = max(a);
n = length(a);

for i = 1:n
    f = floor((m / maxVal) * a(i));
    
    for k = 1:m
        if k <= f
            t = [t '▮'];
        else
            t = [t '▯'];
        end
    end
    
    t = [t '\n'];
end

fprintf(t);

% Ex. (85) - Horizontal chart with UTF characters proportional with max array.

% References
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.