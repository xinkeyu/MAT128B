function [vec, connected] = orbit(x,y)
%vec: the orbit of 0 for phi(x) = x^2 + (x+iy)
%connected : 0 if not connected, 1 if connected
z = x + 1i*y;
count = 1;
connected = 0;
while abs(z) < 100
   vec(count) = z;
   count = count+1;
   z = z^2 + x + 1i *y;
   if (count >= 500) %after 500 iterations, still not diverge
       connected = 1;
       break;
   end
end
end

