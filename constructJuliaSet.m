function [] = constructJuliaSet(x,y)
%construct the Julia set for c = x+iy
numofIt = 100; %number of iterations
rangeUpper = 301; %determines the number of z_n's
increment = 4/(rangeUpper-1);
c = x+1i*y;
phi1 = @(z) sqrt(z-c);
phi2 = @(z) -sqrt(z-c);%positive and negative values of function to be chosen randomly
figure
hold on
for i = 1: rangeUpper
    x_co = -2 + (rangeUpper-1)*increment;
    for j = 1: rangeUpper 
       y_co = -2 + (rangeUpper-1)*increment;
       zn = x_co + y_co * 1i;
       k = 0;
       znew = zn;
       while k <= numofIt
           k = k + 1;
           randNum = round(rand()); %random number that determines which path to pursue
           if (randNum == 1)
              znew = phi1(znew);
           else %randNum == 0
              znew = phi2(znew);
           end
       end
       plot(real(znew), imag(znew),'.');
       
    end
    
end

end

