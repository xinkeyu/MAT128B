function [Q R] = gram_schmidt_QR(A)
format long e;
[m n] = size(A);

R(1,1) = norm(A(:,1));
Q(1:m,1) = A(:,1)/R(1,1);

for j = 2:n
    qj = A(:,j);
    for i = 1:j-1
    R(i,j) = dot(A(:,j),Q(:,i));
    qj = qj - R(i,j)*Q(:,i);
    end
    Q(:,j) = qj/norm(qj);
    R(j,j) = norm(qj);
end
Q
R
[q r] = qr(A);
%since the qr gets negative result, use + to get difference
%diff_q = q+Q
%diff_r = r+R
new_A = Q*R
err_A = A - new_A
Q
