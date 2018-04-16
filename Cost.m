function Fbar = Cost(X)
global self;

% X is set fourier coefficients in CRAB type optimization
% it constitutes the set of fourier coefficients to be 
% optimized

Y = reshape(X, 2 * self.num_har, self.num_c);
A = Y( 1: self.num_har, 1:self.num_c );
B = Y( self.num_har + 1 : end ,  1:self.num_c);

self. A = A;
self. B = B;

U= UT(A, B);
Fbar  = 1 - 1/16 *abs((trace(self.Uf' * U)))^2;


end

