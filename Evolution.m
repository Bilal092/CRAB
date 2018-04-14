function duvdt = Evolution(t, uv,  A, B)
% This function computes unitary evolution from shrodinger
% equation


global self

duvdt = zeros(16,1);


f1  = 0 ; 
har = self.num_har;

for k = 1 : har
    f1  = f1 + A(k,1)*sin(k * t.* self.w  + self.r(k,1)) + ...
          B(k,1)*cos(k * t.* self.w  + self.r(k,1));
end

f2  = 0 ; 
for k = 1 : self.num_har
    f2  = f2 + A(k,2)*sin(k * t.* self.w  + self.r(k,2)) + ...
          B(k,2)* cos(k * t.* self.w  + self.r(k,2));
end

f3  = 0 ; 
for k = 1 : self.num_har
    f3  = f3 + A(k,3) * sin(k * t.* self.w  + self.r(k,3)) + ...
          B(k,3) * cos(k * t.* self.w  + self.r(k,3));
      
end

L = -1i * kron(eye(4), self.Ho + f1 * self.siy +...
         f2 * self.szi + f3 * self.siz)*uv;
 
duvdt = L(:);



end

