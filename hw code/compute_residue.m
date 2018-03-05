function res = compute_residue(A,x,b)
new_b = A*x;
res = sum((new_b - b).^2);
res = sqrt(res);
end