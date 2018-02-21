
f = @(z) z^3 -1;                    
fprime = @(z) 3*z^2;
phi = @(z) z - f(z)/fprime(z); %fixed point iteration

M = zeros(200);
flag = 0;
hold on
for x = 1:400
    for y = 1:400
           z = 0.01*(x-1)- 2 - 0.01i*(y-1) + 2i;
           count = 1;
           flag = 0;
        while abs(z) < 100 && count < 1500
           count = count+1;
           % the fixed point function can be modified here
           temp = phi(z);
           
           if(abs(temp - z) <= 10^-8)
               flag = flag + 1;
           end
           z = temp;
           
           if(flag >= 10)
               M(x,y) = ceil(0.7*count);
               break;
           end
           
           if(abs(z) >= 100)
            M(x,y) = 300;
            break
           end
        end

    end
end
figure
image([-2 2], [-2 2], M')
