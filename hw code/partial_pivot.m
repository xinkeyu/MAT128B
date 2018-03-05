function [piv,Z] = partial_pivot(A,b)
n = length(b);
piv = [1:n];
for curr_col_pos = 1:n-1
  max_abs = 0;
  pivoting_row = 0;
  for m = curr_col_pos:n
    if abs(A(m,curr_col_pos)) > max_abs
      max_abs = abs(A(m,curr_col_pos));
      pivoting_row = m;
    end
  end

  %swap row
  tmp_row = A(curr_col_pos,:);
  A(curr_col_pos,:) = A(pivoting_row,:);
  A(pivoting_row,:) = tmp_row;
  %storing piv
  piv(curr_col_pos) = pivoting_row;
  piv(pivoting_row) = curr_col_pos;
  %swap b va;ue
  btmp = b(curr_col_pos);
  b(curr_col_pos) = b(pivoting_row);
  b(pivoting_row) = btmp;
  
  for curr_row_pos = curr_col_pos+1:n
    mult = A(curr_row_pos,curr_col_pos) / A(curr_col_pos,curr_col_pos);
    A(curr_row_pos,curr_col_pos) = 0;
    for k = curr_col_pos+1:n
      A(curr_row_pos,k) = A(curr_row_pos,k) - mult * A(curr_col_pos,k);
    end
    b(curr_row_pos) = b(curr_row_pos) - mult * b(curr_col_pos);
  end
end

% back-substitution stage = Alg. 7.2
x = zeros(n,1);
if A(n,n) == 0, error('zero in pivot (diagonal) position [bs stage]'), end
x(n) = b(n) / A(n,n);
count = count + 1;
for i = n-1:-1:1   % loop through rows backwards
  axsum = A(i,i+1) * x(i+1);
  count = count + 1;
  for j = i+2:n
    axsum = axsum + A(i,j) * x(j);
    count = count + 2;
  end
  if A(i,i) == 0, error('zero in pivot (diagonal) position [bs stage]'), end
  x(i) = (b(i) - axsum) / A(i,i);
  count = count + 2;
end


