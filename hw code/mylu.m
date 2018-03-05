function [L,U,piv,b] = mylu(A,b)
n = size(A,1);
L = zeros(n);
piv =[1:n];
for j = 1:n-1
      max_abs = 0;
  pivot = j;
  for i = j:n
    if abs(A(i,j)) > max_abs
      max_abs = abs(A(i,j));
      pivot = i;
    end
  end
  %swap
  temp = A(j,:);
  A(j,:) = A(pivot,:);
  A(pivot,:) = temp;
  btemp = b(j);
  b(j) = b(pivot);
  b(pivot) = btemp;
  
  temppiv = piv(j);
  piv(j) = piv(pivot);
  piv(pivot) = temppiv;
  
  
    for i = j+1:n
        mult = A(i,j)/A(j,j);
        A(i,j+1:n) = A(i,j+1:n) - mult*A(j,j+1:n);
        A(i,j) = 0;
        L(i,j) = mult;
    end
end
for i = 1:n
    L(i,i) = 1;
end
U = A;