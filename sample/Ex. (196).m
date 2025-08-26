a = [6, 8, 10];
b = [12, 10, 20];

disp(p(a,b));

function r = p(a, b)
    n = length(a);
    m = zeros(1,2);
    
    for i = 1:n
        m(1) = m(1) + a(i);
        m(2) = m(2) + b(i);
    end

    m(1) = m(1) / n; % mean a.
    m(2) = m(2) / n; % mean b.

    s0 = 0;
    s1 = 0;
    s2 = 0;
    
    for i = 1:n
        s0 = s0 + (a(i)-m(1)) * (b(i)-m(2));
        s1 = s1 + (a(i)-m(1))^2;
        s2 = s2 + (b(i)-m(2))^2;
    end

    r = s0 / sqrt(s1 * s2);
end

% Also, a MATLAB built-in version would be:

a = [6, 8, 10];
b = [12, 10, 20];

m = corrcoef(a, b);
r = m(1,2);

disp(r);

% Ex. (196) - Pearson correlation coefficient.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.