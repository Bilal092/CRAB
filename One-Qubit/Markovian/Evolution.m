  function [dMdt,H] = Evolution(t, M,  A, B, w)
% This function computes evolution from vectorized Lindblad equation

global self

f  = 0 ; 

for k = 1 : self.num_har
    
    f = f + A(k,1) * sin( k * t.* w ) + B(k,1) * cos( k * t.* w ) ;
      
end

H = self.Ho +  f  * self.sx;
I4 = eye(4);

Lt = kron(I4,Liouvillian(H));
Lind = kron(I4,Lindbladian(self.sigma));

dMdt(1:16,1) = (-1j * Lt + self.gamma1 * Lind )* M(1:16,1);

 end


