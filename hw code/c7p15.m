h = [0.282;0.564;0.752;0.940];
sqrt_h = sqrt(h)
d = [0.752;1.102;1.248;1.410];
A = [ones(size(h)),sqrt_h];
c = A\d
cc = flipud(c);

%%%plot
plot(sqrt_h,d,'b*'), title('Least Square Linear Fit for sqrt'), hold
xlabel('sqrt(release height)'), ylabel('horizontal distance')

%%%
hmin = min(sqrt_h); hmax = max(sqrt_h);h1 = [hmin:(hmax-hmin)/100 : hmax];
plot(h1,polyval(cc,h1),'r'),axis tight
c0 = cc(2), c1 = cc(1)
residual_norm = sqrt(sum((d - (c(1) + c(2)*sqrt_h)).^2))