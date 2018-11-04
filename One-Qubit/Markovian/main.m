% using struct self
clc;
clear all;
close all;
%%
format long 
global self
self.sx = [0 1;
          1 0];

self.sy = [0 -1i;
          1i 0];

self.sz = [1  0;
          0  -1];

self.gamma1 = 1e-3;
self.gamma2 = 1e-3;
rng(1)

self.sminus = self.sx - self.sy;
self.sigma = [0 1; 0 0];
self.I  = eye(2);

self.Ho = 0.1 * self.sz;

self.num_har = 8;
self.num_c =1;
% rng(0);
 
 
self.r  = rand(self.num_har,self.num_c);
self.w  = rand(self.num_c);

self.ti  = 0;
self.tf = 2;
self.steps = 10000;
self.tspan = linspace(self.ti, self. tf, self.steps);
% self.tspan = [0 8]


self.Uv  = zeros(length(self.tspan),4);
self.H = zeros(2, 2, length(self.tspan));

self.Controls = {self.sx};
self.L = {kron(eye(2),self.sx)};

self.U0 = eye(2);
%self.UT = eye(2);


self.A = 1*(rand(size(self.r))-0.5);
self.B = 1*(rand(size(self.r))-0.5);

self.Uf = 1j* [0 1;
               1 0];
self.G0 = kron(self.U0, conj(self.U0));
self.Gf = kron(self.Uf, conj(self.Uf));
                       
                       
% optimization variable dumping in                        
self.iter = [];
self.state = [];
self.infidelity = [];
self.searchdir = [];
                       
self.X = 1*(rand(2 * self.num_har, self.num_c)-0.5);
X = self.X(:);
X  = cat(1, X, self.w);

%[y,t] 

% U = eye(2);
% M0=self.G0(:);
% opt = odeset('RelTol',1e-10,'AbsTol',1e-11,'Stats','on');
% [t,M] = ode45(@(t,M) Evolution(t, M, self.A ,self.B, self.w), self.tspan, M0,opt);


%%
options = optimset('PlotFcns',@optimplotfval, 'MaxIter', 1000,...
    'MaxFunEvals',10000,'Display','iter','OutputFcn',@outfun);
[x,fval,exitflag,output] = fminsearch(@Cost,X,options);
%[x,fval,exitflag,output] = fmisearch(@Cost,X,options);


% options = optimset('MaxIter', 5000,...
%     'MaxFunEvals',10000,'OutputFcn',@outfun,'SpecifyObjectiveGradient',true);
% options = optimoptions('fsolve','Display','iter','PlotFcn',@optimplotfirstorderopt,...
%     'SpecifyObjectiveGradient',true, 'FunctionTolerance', 1e-9);
% [x,fval,exitflag,output] = fsolve(@Cost,X,options);

%%
close all
A = self.A;
B = self.B;
w = self.w;
t = self.tspan;

u = zeros(1,length(self.tspan));

for k=1:length(A)
    u = u + A(k)  * sin(k * w * t) + B(k)  * cos(k * w * t);
end

figure;
plot(t,u,'r','LineWidth',2);
figure;
semilogy(self.infidelity,'k-.','LineWidth',2)

%%
save('CRAB_1Q_open_5', 'self')
 
