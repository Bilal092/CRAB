function [UT] = UT(A, B)

% final value of Unitary evolution operator during each round 
% of optimization is computed and stored
global self
self.A = A;
self.B = B;

uv0 = self.U0(:);
[~,uv] = ode45(@(t,uv) Evolution(t,uv, A , B), self.tspan, uv0);

UTv = uv(self.steps,:);
UT = reshape(UTv, 4, 4);
self.UT = UT;
end

