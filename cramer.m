function x = cramer(A,b)

[n,n] = size(A);
for j = 1:n
   B = A;
   B(:,j) = b;
   x(j) = det(B)/det(A);
end
x = x';