function [t,f] = eulerIntegration(t0,f0,a,T,N_

   deltaT = T/N;
   t = linspace(t0,to+T,N+1);
   f = zeroes(1,N+1);

   # Euler Integration Method
    
   f(1) = f(0);   # Initial Condition
 
   for n = 1:N
       f(n+1) = f(n) + a(t(n),f(n))*deltaT;
   end