%changing value of n
n = 5;

%Gaussian
A1 = matgen(n,1);
A2 = matgen(n,10^4);
A3 = matgen(n,10^8);
A4 = matgen(n,10^12);
A5 = matgen(n,10^30);
xtrue = randn(n,1);
b1 = A1*xtrue;
b2 = A2*xtrue;
b3 = A3*xtrue;
b4 = A4*xtrue;
b5 = A5*xtrue;
x1 = A1\b1;
x2 = A2\b2;
x3 = A3\b3;
x4 = A4\b4;
x5 = A5\b5;

rel_err(1) = norm(x1-xtrue)/norm(xtrue);
rel_res(1) = norm(b1) - norm(A1*x1)/(norm(A1)*norm(x1));
rel_err(2) = norm(x2-xtrue)/norm(xtrue);
rel_res(2) = norm(b2) - norm(A2*x2)/(norm(A2)*norm(x2));
rel_err(3) = norm(x3-xtrue)/norm(xtrue);
rel_res(3) = norm(b3) - norm(A3*x3)/(norm(A3)*norm(x3));
rel_err(4) = norm(x4-xtrue)/norm(xtrue);
rel_res(4) = norm(b4) - (norm(A4*x4)/(norm(A4)*norm(x4)));
rel_err(5) = norm(x5-xtrue)/norm(xtrue);
rel_res(5) = norm(b5) - (norm(A5*x5)/(norm(A5)*norm(x5)));
% The relative errors are bounded by conditional number of matrix A

%inv matrix method
A1inv = inv(A1);
A2inv = inv(A2);
A3inv = inv(A3);
A4inv = inv(A4);
A5inv = inv(A5);
xi1 = A1inv*b1;
xi2 = A2inv*b2;
xi3 = A3inv*b3;
xi4 = A4inv*b4;
xi5 = A5inv*b5;
i_rel_err(1) = norm(xi1-xtrue)/norm(xtrue);
i_rel_res(1) = norm(b1) - norm(A1*xi1)/(norm(A1)*norm(xi1));
i_rel_err(2) = norm(xi2-xtrue)/norm(xtrue);
i_rel_res(2) = norm(b2) - norm(A2*xi2)/(norm(A2)*norm(xi2));
i_rel_err(3) = norm(xi3-xtrue)/norm(xtrue);
i_rel_res(3) = norm(b3) - norm(A3*xi3)/(norm(A3)*norm(xi3));
i_rel_err(4) = norm(xi4-xtrue)/norm(xtrue);
i_rel_res(4) = norm(b4) - norm(A4*xi4)/(norm(A4)*norm(xi4));
i_rel_err(5) = norm(xi5-xtrue)/norm(xtrue);
i_rel_res(5) = norm(b5) - norm(A5*xi5)/(norm(A5)*norm(xi5));


%Cramer's rule
xc1 = cramer(A1,b1);
xc2 = cramer(A2,b2);
xc3 = cramer(A3,b3);
xc4 = cramer(A4,b4);
xc5 = cramer(A5,b5);
c_rel_err(1) = norm(xc1-xtrue)/norm(xtrue);
c_rel_res(1) = norm(b1) - norm(A1*xc1)/(norm(A1)*norm(xc1));
c_rel_err(2) = norm(xc2-xtrue)/norm(xtrue);
c_rel_res(2) = norm(b2) - norm(A2*xc2)/(norm(A2)*norm(xc2));
c_rel_err(3) = norm(xc3-xtrue)/norm(xtrue);
c_rel_res(3) = norm(b3) - norm(A3*xc3)/(norm(A3)*norm(xc3));
c_rel_err(4) = norm(xc4-xtrue)/norm(xtrue);
c_rel_res(4) = norm(b4) - norm(A4*xc4)/(norm(A4)*norm(xc4));
c_rel_err(5) = norm(xc5-xtrue)/norm(xtrue);
c_rel_res(5) = norm(b5) - norm(A5*xc5)/(norm(A5)*norm(xc5));
