format long e;
x_qr = zeros(11,1);
x_nrm = zeros(11,1);
t = 0:0.02:0.98;
b = cos(4*t)';
A = [ones(50,1), t', (t.^2)',(t.^3)',(t.^4)',(t.^5)',(t.^6)',(t.^7)',(t.^8)',(t.^9)',(t.^10)'];
%solving x using different method
poly_fit = flipud(polyfit(t,b',10)')
x_qr = A\b;
x_nrm = (A'*A)\(A'*b);
diff = x_qr - x_nrm;
diff_poly_qr = poly_fit - x_qr;
diff_poly_norm = poly_fit - x_nrm
cond(A);