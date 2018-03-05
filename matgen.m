function A = matgen(n, condno)

[U,R] = qr(randn(n,n));
[V,R] = qr(randn(n,n));

Sigma = zeros(n,n);
for i=1:n 
    Sigma(i,i) = condno^(-(i-1)/(n-1)); 
end
A = U*Sigma*V';