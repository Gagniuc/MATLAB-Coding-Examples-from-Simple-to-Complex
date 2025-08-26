a = [
    [1, 1, 1];
    [0, 1, 0];
    [0, 1, 0]
    ];

b = [
    [0, 1, 0];
    [1, 1, 1];
    [0, 1, 0]
    ];

c = zeros(size(a));
n = size(a, 1);
m = size(a, 2);
r = '';

for i=1:n
    r = strcat(r, '\n');
    for j=1:m
        c(i,j) = g(a(i,j), b(i,j), 6);
        r = strcat(r, int2str(c(i,j)), " ");
    end
end

fprintf(r);

% A B
% t = 1 = AND
% t = 2 = NAND
% t = 3 = OR
% t = 4 = NOR
% t = 5 = XOR
% t = 6 = XNOR

function result = g(a, b, t)
    % Truth table
    h = [ % A  B  1  2  3  4  5  6
           [0, 0, 0, 1, 0, 1, 0, 1];
           [0, 1, 0, 1, 1, 0, 1, 0];
           [1, 0, 0, 1, 1, 0, 1, 0];
           [1, 1, 1, 0, 1, 0, 0, 1]
        ];
    
    n = size(h, 1);
    
    for i=1:n
        if a == h(i,1) && b == h(i,2)
            result = h(i,t+2);
            return;
        end
    end
end
 
%{
________________________________
|       |   | N |   |   |   | X |
| Input | A | A |   | N | X | N |
|       | N | N | O | O | O | O |
| a | b | D | D | R | R | R | R |
---------------------------------
| 0 | 0 | 0 | 1 | 0 | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 0 | 0 | 1 | 1 | 0 | 1 | 0 |
| 1 | 1 | 1 | 0 | 1 | 0 | 0 | 1 |
---------------------------------
%}

% Ex. (209) - The general logic gate based on a map.

% References

% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Python, Springer, 2024, pp. 1-245.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in MATLAB, Springer, 2024, pp. 1-255.
% Paul A. Gagniuc. Coding Examples from Simple to Complex - Applications in Javascript, Springer, 2024, pp. 1-240.