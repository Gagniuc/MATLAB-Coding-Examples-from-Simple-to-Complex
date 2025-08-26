a = [5, 1, 8, 4, 6, 2, 8, 9];

b = stat(a);
disp(b);

function r = stat(a)
    n = length(a);
    b = 0;
    e = 0;

    % Initialize the results array
    r = zeros(1, 3); % AV, SD, CV

    % Calculate the sum of 
    % the array elements.

    for j=1:n
        b = b + a(j);
    end

    % Calculate the arithmetic 
    % mean (AV).

    r(1) = b/n;

    % Calculate the standard 
    % deviation (SD).

    for j=1:n
        e = e + (a(j) - r(1))^2;
    end

    r(2) = sqrt(e/(n-1));

    % Calculate the coefficient 
    % of variation (CV).

    r(3) = r(2)/r(1);
end

% Ex. (195) - Average, standard deviation and coefficient of variation.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.
