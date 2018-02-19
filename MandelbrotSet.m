function [] = MandelbrotSet()
%generate the MandelBrot set
colormap([1 0 0; 1 1 1]);
inc = 0.01;

iteration = 3/inc + 1;

M = 2*ones(iteration, iteration);

for i = 1:iteration
    x = -2 + (i-1) * inc;
    for j = 1:iteration
        y = -1.5 + (j-1) * inc;
        if(orbit(x,y))
            M(j,i) = 1;
        end
    end
    end
    image([-2, 1],[-1.5,1.5],M);
    axis xy
    
end

function [connected] = orbit(x,y)
%vec: the orbit of 0 for phi(x) = x^2 + (x+iy)
%connected : 0 if not connected, 1 if connected
z = x + 1i*y;
count = 1;
connected = 0;
while abs(z) < 100
   %vec(count) = z;
   count = count+1;
   z = z^2 + x + 1i *y;
   if (count >= 500) %after 500 iterations, still not diverge
       connected = 1;
       break;
   end
end
end
