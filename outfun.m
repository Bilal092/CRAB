function stop = outfun(x,optimValues,state)
global self;
stop = false;
switch state
    case 'init'
        hold on
    case 'iter'
         % Concatenate current point and objective function
         % value with history. x must be a row vector.
         self.infidelity = [self.infidelity; optimValues.fval];
         self.iter = [self.iter; x];
         % Concatenate current search direction with 
         % searchdir.
%          self.searchdir  = [self.searchdir ;... 
%                     optimValues.searchdirection'];
    case 'done'
        hold off
    otherwise
end
 end