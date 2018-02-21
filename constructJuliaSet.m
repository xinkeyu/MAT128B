function [] = constructJuliaSet(x,y)
%construct the Julia set for c = x+iy
numofIt = 200; %number of iterations
rangeUpper = 41; %determines the number of z_n's
increment = 4/(rangeUpper-1);
c = x+1i*y;

plotvecx = zeros(1,rangeUpper^2);%vectors that store the points
plotvecy = zeros(1,rangeUpper^2);

index = 1;
for i = 1: rangeUpper %choose initial values from -2 to 2
    x_co = -2 + (rangeUpper-1)*increment;%real part
    for j = 1: rangeUpper 
       y_co = -2 + (rangeUpper-1)*increment;%imaginary part 
       rnew = sqrt(sqrt((x_co-x)^2+(y_co-y)^2));
       theta = atan((y_co-y)/(x_co-x));
       if(x_co-x)<0
           theta = theta + pi;
       end
       xnew = rnew * cos(theta/2);
       ynew = rnew * sin(theta/2);
       k = 0;

       while k <= numofIt
           k = k + 1;
           randNum = round(rand()); %random number that determines which branch to pursue
           if (randNum == 1)%positive branch
              rnew = sqrt(sqrt((xnew-x)^2+(ynew-y)^2));
              theta = atan((ynew-y)/(xnew-x));
              if(xnew-x)<0
                theta = theta + pi;
              end
              xnew = rnew * cos(theta/2);
              ynew = rnew * sin(theta/2);
           else %randNum == 0, negative branch
              rnew = sqrt(sqrt((xnew-x)^2+(ynew-y)^2));
              theta = atan((ynew-y)/(xnew-x));
              if(xnew-x)<0
                theta = theta + pi;
              end
              
              xnew = -rnew * cos(theta/2);
              ynew = -rnew * sin(theta/2);
           end
       end

       plotvecx(index)= xnew;%store points in vector
       plotvecy(index)= ynew;
       index = index+1;
    end
    
end


figure %plotting!
plot(plotvecx, plotvecy, '.k')
axis off
end

