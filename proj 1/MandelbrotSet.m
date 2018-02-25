function [] = MandelbrotSet()
%generate the MandelBrot set
numColor = 20; %number of different colors
N = zeros(numColor,3);
for i = 1: numColor %generate the matrix for colormap with varying colors
    colorValue = i * (1/numColor);
    N(i,:) = [colorValue colorValue colorValue];
end

colormap(N); %create the colormap
inc = 0.005;
iteration = 3/inc + 1;%the range of x and y are both 3

M = 2*ones(iteration, iteration);

for i = 1:iteration
    x = -2 + (i-1) * inc; %x(real) from -2 to 1
    for j = 1:iteration
        y = -1.5 + (j-1) * inc; %y(imaginary) from -1.5 to 1.5
        [count, connected] = orbit(x,y); %computes the connectivity
        if(connected)%connected, set to black
            M(j,i) = 1;
        else %not connected, set to corresponding color
            M(j,i) = count;
            
        end
    end
    
end
    figure(1);
    image([-2, 1],[-1.5,1.5],M);
	set(gca,'XTick',[]) % Remove the ticks in the x axis!
	set(gca,'YTick',[]) % Remove the ticks in the y axis
	%set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
	saveas(gcf,'mand','jpg');% generate png for dimension use
    
end

function [count, connected] = orbit(x,y)
%count: the number of iterations it takes to diverge
%connected : 0 if not connected, 1 if connected
z = x + 1i*y;
count = 1;
connected = 0; %counter for number of iterations
while abs(z) < 100 %assume divergence occurs when |z| > 100
   count = count + 1;
   z = z^2 + x + 1i *y; %z_{n+1} = z_n^2 + c
   if (count >= 500) %after 500 iterations, still not diverge
       connected = 1;
       break;
   end
end
end