function [] = color( phi)
%phi is function handler,i.e., phi = @(z) z^3+1
%returns the RGB triplet for divergent orbit
%if convergent, black
count = 1;

M = zeros(200);
for x = 1:400
    for y = 1:400
           z = 0.01*(x-1)-2 - 0.01i*(y-1) + 2i;
           count = 1;
           bounded = false;
        while abs(z) < 100 & count < 1500
           count = count+1;
           % the fixed point function can be modified here
           z = phi(z);
           if(abs(z) >= 100)
            M(x,y) = 10*count;
           end
        end

    end
end
figure
image([2 -2],[-2:2],M')
end