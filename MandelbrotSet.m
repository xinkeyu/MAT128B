function [] = MandelbrotSet()
%generate the MandelBrot set
colormap([0 0 0; 0 0 0.1; 0 0 0.15
    0 0 0.2; 0 0 0.25; 0 0 0.3; 
    0 0 0.35; 0 0 0.4; 0 0 0.45;
    0 0 0.5; 0 0 0.55; 0 0 0.6; 
    0 0 0.65; 0 0 0.7; 0 0 0.75;
    0 0 0.8 ; 0 0 0.85; 0 0 0.9; 
    0 0 0.95;0 0 1]);
inc = 0.01;

iteration = 3/inc + 1;

M = 2*ones(iteration, iteration);

for i = 1:iteration
    x = -2 + (i-1) * inc;
    for j = 1:iteration
        y = -1.5 + (j-1) * inc;
        [count, connected] = orbit(x,y);
        if(connected)%connected, set to black
            M(j,i) = 1;
        else %not connected, set to corresponding color
            M(j,i) = count;

        end
    end
    
end
    image([-2, 1],[-1.5,1.5],M);
    axis xy
    
end

function [count, connected] = orbit(x,y)
%count: the number of iterations it takes to diverge
%connected : 0 if not connected, 1 if connected
z = x + 1i*y;
count = 1;
connected = 0;
while abs(z) < 100

   count = count+1;
   z = z^2 + x + 1i *y;
   if (count >= 100) %after 500 iterations, still not diverge
       connected = 1;
       break;
   end
end
end
