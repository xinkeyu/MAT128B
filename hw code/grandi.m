n =3;
curr = 0;
for i = 1:1000
    x(i) = 1-1/i;
    y(i) = (-1)^i;
end
plot(x,y);
ylim([-1.2 1.2]);