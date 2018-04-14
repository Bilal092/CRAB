% using struct self
global self
self.sx = [0 1;
          1 0];

self.sy = [0 -1i;
          1i 0];

self.sz = [1  0;
          0  -1];
  
self.I  = eye(2);

self.siy = kron(self.I, self.sy);
self.szi = kron(self.sz, self.I);
self.siz = kron(self.I, self.sz);
self.szz = kron(self.sz, self.sz);
J  = 0.1;
self.Ho = 0.1 * self.szz;

self.num_har = 6;
self.num_c =3;
rng(1);
self.r  = rand(self.num_har,self.num_c);
self.w  = 1 ;

self.ti  = 0;
self.tf = 8;
self.steps = 1000;
self.tspan = linspace(self.ti, self. tf, self.steps);

self.U0 = eye(4);
self.UT = eye(4);
self.U = [self.iter, 4 , 4];
self.result = [];

self.A = zeros(size(self.r));
self.B = zeros(size(self.r));
self.Uf = exp(1i*pi*4) * [1 0 0 0;
                           0 1 0 0;
                           0 0 0 1;
                           0 0 1 0];
                       
self.X = rand(2*self.num_har,self.num_c);
X = self.X(:);
options = optimset('PlotFcns',@optimplotfval, 'MaxIter', 10000,'Display','iter');
[x,fval,exitflag,output] = fminsearch(@Cost,X,options);

                       
             



















