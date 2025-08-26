b = [3, 6, 2, 78, 99, 1, 4];
n = length(b);

% Initialize array a with 
% zeros up to the maximum 
% value in b.

a = zeros(1, max(b));

% Fill a using values 
% from b as indices.

for i = 1:n
    a(b(i)) = b(i);
end

% Compact a back into b, 
% effectively sorting it r = 1;

for j = 1:length(a)
    if a(j) ~= 0
        b(r) = a(j);
        r = r + 1;
    end
end

% Truncate b to the new 
% size r - 1 to remove 
% trailing zeros.

b = b(1:r-1);

disp(b);

% Ex. (189) - Low level native sort and eliminate duplicates (I).

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.