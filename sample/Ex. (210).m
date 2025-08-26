c = {
    [1, 1, 1, 1, 1, 1, 0, 1, 1, 1];
    [1, 2, 1, 0, 1, 3, 1, 0, 1, 1];
    [1, 1, 2, 0, 1, 3, 0, 1, 0, 1];
    [0, 1, 0, 2, 1, 3, 1, 0, 0, 1];
    [1, 1, 1, 0, 2, 3, 1, 0, 1, 0];
    [1, 0, 1, 1, 1, 3, 0, 0, 0, 0];
    [1, 0, 3, 3, 3, 3, 0, 0, 0, 1];
    [1, 0, 1, 1, 1, 0, 0, 9, 9, 9];
    [1, 1, 0, 0, 0, 0, 1, 9, 0, 9]
    };

b = matrix_alphabet(c);
t = decompose(c, b);

for k = 1:numel(b)
    disp(SMC(t, k));
end

disp(b);

function c = replace_with_nan(c, r)
    for i = 1:numel(c)
        for j = 1:numel(c{i})
            if ischar(c{i}(j)) && c{i}(j) == r
                c{i}(j) = NaN;
            end
        end
    end
end

function a = matrix_alphabet(c)
    a = [];
    for i = 1:numel(c)
        for j = 1:numel(c{i})
            if all(~ismember(a, c{i}(j)))
                a = [a, c{i}(j)];
            end
        end
    end
    a(isnan(a)) = [];
end

function d = decompose(c, a)
    [n, ~] = size(c);
    d = cell(n, numel(a));
    for i = 1:n
        for k = 1:numel(a)
            d{i, k} = '';
            for j = 1:numel(c{i})
                if isnumeric(c{i}(j)) && ...
                             c{i}(j) == a(k)
                    d{i, k} = [d{i, k}, ...
                               num2str(c{i}(j))];
                else
                    d{i, k} = [d{i, k}, ' '];
                end

            end
        end
    end
end


function r = SMC(m, k)
    r = sprintf('M%d\n', k);
    [n, ~] = size(m);
    for i = 1:n
        r = sprintf('%s|', r);
        for j = 1:numel(m{i, k})
            r = sprintf('%s%s', r, m{i, k}(j));
        end
        r = sprintf('%s|\n', r);
    end
end

% 11.1.4 Ex. (210) - Decompose a matrix into multiple matrices based on unique values.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.