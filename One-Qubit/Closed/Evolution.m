  function [dMdt,H] = Evolution(t, M,  A, B, w)
% This function computes unitary evolution from shrodinger
% equation

global self

f  = 0 ; 

for k = 1 : self.num_har
    
    f = f + A(k,1) * sin( k * t.* w ) + B(k,1) * cos( k * t.* w ) ;
      
end

H = self.Ho +  f  * self.sx;
I4 = eye(4);

Lt = kron(I4,Liouvillian(H));

dMdt(1:16,1) = -1j * Lt * M(1:16,1);

 end


