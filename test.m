phi = @(z) z^3;                    
phi_prime = @(z) 3*z^2;

rt_1 = -1;                   
rt_2 = exp(1i*pi/3);
rt_3 = exp(-1i*5*pi/3);

orbit = 0;
colormap([1 0 0;0 1 0; 0 0 1; 1 1 1]);  
                                        
M = 2*ones(141,361);                    

for j=1:141            
  y = -0.7 + (j-1)*.01;   
  for i=1:361          
    x = -1.8 + (i-1)*.01; 
    z = x + 1i*y;
    orbit = z;
    
    flag1 = 0;          
    flag2 = 0;          
    flag3 = 0;
    iteration = 0;

    while iteration < 100 && flag1 < 5 && flag2 < 5 && flag3 < 5
      
      iteration = iteration + 1;
      
      orbit = orbit - phi(orbit)/phi_prime(orbit);    
      
      err1 = abs(orbit-rt_1);
      if err1 < 1.e-6      
         flag1 = flag1 + 1;
      else
         flag1 = 0;
      end
      
      err2 = abs(orbit-rt_2);
      if err2 < 1.e-6
         flag2 = flag2 + 1;
      else
         flag2 = 0;
      end
      
      err3=abs(orbit-rt_3);
      if err3 < 1.e-6
         flag3 = flag3 + 1;
      else
         flag3 = 0;
      end
      
    end

    if flag1 >=5 
        M(j,i) = 1;
    end
    
    if flag2 >=5
        M(j,i) = 2; 
    end
    
    if flag3 >=5
        M(j,i) = 3;
    end   

  end
end

image([-1 1],[-1 1],M),        
axis xy