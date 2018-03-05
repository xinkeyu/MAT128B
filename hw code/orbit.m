function [vec, bounded] = orbit(x,y)
%returns the orbit of 0 for phi(x) = x^2 + (x+iy)
z = x + 1i*y;
count = 1;
bounded = 0;
while abs(z) < 100
   vec(count) = z;
   count = count+1;
   z = z^2 + x + 1i *y;
   if (count >= 500)
       bounded = 1;
       break;
   end
end
end