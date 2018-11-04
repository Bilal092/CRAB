function [GT] = Computations(A, B, w)

% final value of Unitary evolution operator during each round 
% of optimization is computed and stored

global self
self.A = A;
self.B = B;
self.w = w;

% G = eye(4);
% M0=G(:);

M0=self.G0(:);
opt = odeset('RelTol',1e-10,'AbsTol',1e-11,'Stats','off');
[~,M] = ode45(@(t,M) Evolution(t, M, self.A ,self.B, self.w), self.tspan, M0,opt);

self.Gv = M(:,1:16);
GTv = self.Gv(self.steps,:);
GT = reshape(GTv, 4, 4);
self.GT = GT;


end

