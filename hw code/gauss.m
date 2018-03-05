function [a, b] = gauss(A,B)
n = length(B);
a = A;  b = B;                         
for j = 1:n
  for i = (j+1):n
    mult = a(i,j) / a(j,j);        
    a(i,:) = a(i,:) - mult * a(j,:); 
    b(i) = b(i) - mult * b(j);
  end
end

