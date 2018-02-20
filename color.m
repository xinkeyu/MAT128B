function [mycolor,z,bounded] = color(x,y)
%returns the RGB triplet for divergent orbit
%if convergent, black
z(1) = x + 1i*y;
count = 1;
%colormap([zeros(100,1),zeros(100,1),[0.01:0.01:1]']);
while abs(z(count)) < 100
   count = count+1;
   z(count) = z(count-1)^2 + x + 1i *y;
   if z(count) == z(count-1) 
       bounded = true;
       return
   end
   if (count >= 100) %after 100 iterations, still not diverge
       bounded = true;
       mycolor = [zeros(100,1) zeros(100,1) ones(100,1)];
       return;
   end
end

mycolor = zeros(count,3);
if(count <= 8) %most time count is less than 8
    for i = 1:count
        mycolor(i,:) = [0 0 (1-0.1*i)];
    end
else
   for i = 1:8
        mycolor(i,:) = [0 0 1-0.1*i];
   end
   for i = 9:count
        mycolor(i,:) = [0 0 1 - 0.1*(8+(2/92)*(count-8))];
   end
end

end