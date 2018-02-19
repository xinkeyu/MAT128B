function [color] = color(x,y)
%returns the RGB triplet for divergent orbit
%if convergent, black
z = x + 1i*y;
count = 1;

while abs(z) < 100

   count = count+1;
   z = z^2 + x + 1i *y;
   if (count >= 100) %after 100 iterations, still not diverge
       color = [0 0 0];
       return;
   end
end

if(count <= 8) %most time count is less than 8
   color = [0 0 0.1*count];
else 
   color = [0 0 0.1*(8+(2/92)*(count-8))]
end

end