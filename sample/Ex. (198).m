% Generate a random array of n 
% numbers between 0 and 99.
n = 9;
a = floor(rand(1, n) * 100);

disp(SMC(chart(a)));
disp(newline + mat2str(a)); 

function t = chart(a)
    m = 9;
    max_val = max(a);
    t = cell(m, length(a));

    for j = 0:(m-1)
        for i = 1:length(a)
            f = floor((m / max_val) * a(i));
            t{m-j, i} = char(9617); 
            if j < f
                t{m-j, i} = char(9619); 
            end
        end
    end
end

function r = SMC(a)
    [n, m] = size(a);
    r = '';

    for i = 1:(n+2)
        for j = 1:m

            if i <= n
                % Chart characters.
                r = [r a{i, j}];
            elseif i == (n+1)
                % Horizontal axis.
                r = [r '|'];
            else
                % Column numbers.
                r = [r num2str(j)];
            end
        end

        if i == (n+1)
            % Newline after the 
            % horizontal axis.
            r = [r newline];
        elseif i <= n
            % Row numbers 
            % and newline.
            r = [r '_' num2str(n-i+1) newline];
        end
    end
end

% Ex. (198) - Vertical chart from array with random values at each run.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.