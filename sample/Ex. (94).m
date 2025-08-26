% 3d scan - one for loop - no if then.

A = {
    {
        {'a', 55, 146},
        {'b', 34, 124},
        {'c', 96, 564},
        {100, 12, 'd'}
    },
    {
        {'e', 88, 146},
        {'f', 34, 124},
        {'g', 96, 564},
        {100, 12, 'h'}
    },
    {
        {'i', 88, 146},
        {'j', 34, 124},
        {'k', 96, 564},
        {100, 12, 'k'}
    },
    {
        {'m', 88, 146},
        {'n', 34, 124},
        {'o', 96, 564},
        {100, 12, 'p'}
    },
    {
        {'q', 88, 146},
        {'r', 34, 124},
        {'s', 96, 564},
        {100, 12, 't'}
    }
};

t = "";

s = size(A, 1);        % 5 matrices
m = size(A{1}, 1);     % 4 rows
n = size(A{1}{1}, 2);  % 3 columns

q = n * m * s;

for v = 0:(q-1)

    k = mod(v, m * n);

    j = mod(v, n) + 1;
    i = (k - j + 1) / n + 1;
    d = (v - k) / (m * n) + 1;

    t = t + sprintf('%d A{%d}{%d}{%d}=%s\n', ...
    v, d, i, j, mat2str(A{d}{i}{j}));
end

disp(t);


% Ex. (94) – 3D traversal with one for-loop using only arithmetic operators.

%References
%Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
%Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
%Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.