
f = @(z) z^3 -1;                    
fprime = @(z) 3*z^2;
phi = @(z) z - f(z)/fprime(z); %fixed point iteration
M = zeros(200);
flag = 0;
hold on
for x = 1:200
    for y = 1:200
           z = 0.01*(x-1)-1 + 0.01i*(y-1) - 1i;
           count = 1;
           flag = 0;
        while abs(z) < 100 && count < 1500
           count = count+1;
           % the fixed point function can be modified here
           temp = phi(z);
           if(abs(temp - z) <= 10^-10)
               flag = flag + 1;
           end
           z = temp;
           if(flag >= 10)
               M(x,y) = count;
               break;
           end
           
           if(abs(z) >= 100)
            M(x,y) = count;
            break
           end
        end

    end
end
figure
image(M)

