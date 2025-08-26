global p_percent;

a = num2cell([
    [1, 0, 1, 1, 1, 1, 0, 1, 1, 1];
    [1, 0, 1, 0, 1, 1, 0, 0, 1, 1];
    [1, 1, 1, 0, 1, 1, 0, 0, 0, 1];
    [0, 0, 0, 0, 1, 0, 0, 0, 0, 1];
    [1, 1, 1, 0, 1, 1, 1, 0, 1, 0];
    [1, 0, 1, 1, 1, 1, 0, 0, 0, 0];
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1];
    [1, 0, 1, 1, 1, 1, 0, 1, 1, 1];
    [1, 1, 0, 0, 0, 0, 0, 0, 0, 1]
    ]);

for i = 1:numel(a)
    if a{i} == 0
        a{i} = '0';
    else
        a{i} = '1';
    end
end

b = [
    [+1, 0];  % right.
    [-1, 0];  % left.
    [0, +1];  % up.
    [0, -1];  % down.
    [+1,+1];  % up-right.
    [-1,-1];  % down-left.
    [+1,-1];  % down-right.
    [-1,+1]   % up-left.
    ];

q = {'*','#','%','&','@','$','!','+','^'};
p = zeros(1, numel(q));
p_percent = cell(1, length(q));

[a, p] = SCAN(a, b, q, p);
num_islands = length(p(p > 0));

fprintf('Islands = %d\n\n', num_islands);
fprintf('%s\n', SMC(a));

for i = 1:num_islands
    fprintf('%c %d (%s)\n', ...
             q{i}, p(i), p_percent{i});
end

function [a, p] = d(a,i,j,n,m,c,b,q,p)

    if i < 1 || j < 1 || i > n ...
            || j > m || ~strcmp(a{i,j}, '1')
        return;
    end
    
    a{i,j} = q{c};
    p(c) = p(c) + 1;
    
    for k = 1:size(b,1)
        [a, p] = ...
        d(a, i+b(k,1), j+b(k,2),n,m,c,b,q,p);
    end
end

function [a, p] = SCAN(a, b, q, p)

    global p_percent;

    c = 0;          % Island count.
    n = size(a, 1); % Number of rows.
    m = size(a, 2); % Number of columns.
    
    for i = 1:n
        for j = 1:m
            if strcmp(a{i,j}, '1')

                c = c + 1;

                if c > numel(q)
                    error('Not enough labels');
                end

                p(c) = 0;
                [a, p] = d(a,i,j,n,m,c,b,q,p);

                p_percent{c} = [num2str( ...
                round(100 * p(c) / (n*m)) ...
                ), '%'];
            
            end
        end
    end
end

function r = SMC(m)
    r = '';
    for i = 1:size(m,1)
        for j = 1:size(m,2)
            r = [r, m{i,j}, ' '];
        end
        r = [r, newline];
    end
end

% Ex. (213) - Count islands and calculate their percentage coverage.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.