function [Fbar] = Cost(Xv)
global self;

% X is set fourier coefficients in CRAB type optimization
% it constitutes the set of fourier coefficients to be 
% optimized

self.Xv = Xv;

A = Xv( 1: self.num_har );
B = Xv (self.num_har + 1 : 2 * self.num_har);
w = Xv( 2 * self.num_har + 1 : end ,  1:self.num_c);

self.A = A;
self.B = B;
self.w = w;

[GT] = Computations(A, B, w);
Fbar  = 1 - 1/4 *real(((trace(self.Gf' * GT))));
self.Infid = Fbar;
    
end

