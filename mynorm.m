function [one_norm, two_norm, max_norm] = mynorm(A)
for i = 1:size(A,1)
    row_sum(i) = sum(abs(A(i,:)));
end
for j = 1:size(A,2)
    col_sum(i) = sum(abs(A(:,j)));
end
C = eig(A'*A);
C = C.^0.5;
one_norm = max(col_sum);
two_norm = max(C);
max_norm = max(row_sum);
end