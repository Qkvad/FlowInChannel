function bvp

%   differential equations
%
%      f''' - R*[(f')^2 - f*f''] + R*A = 0
%      h'' + R*f*h' + 1 = 0
%      theta'' + P*f*theta' = 0
%
%   boundary conditions
%
%      f(0) = f'(0) = 0
%      f(1) = 1
%      f'(1) = 0
%      h(0) = h(1) = 0
%      theta(0) = 0
%      theta(1) = 1
%
%   R,P...known constants
%   A...determined by the boundary conditions
%
%   boundary layer at x=0



% The solution is first sought for R = 10.
R = 10;

options = [];    % place holder

% A crude mesh of 10 equally spaced points and a constant 1 
% for each solution component is used for the first value of R.
% The unknown parameter A is guessed to be 1.

solinit = bvpinit(linspace(0,1,10),ones(7,1),1);

sol = bvp4c(@ode,@bc,solinit,options,R);

fprintf('For R = %5i, A = %4.2f.\n',R,sol.parameters);
clf reset
lines = {'k-.','r--','b-','g-.'};
plot(sol.x,sol.y(2,:),lines{1});
axis([-0.1 1.1 0 1.7]);
title('Fluid injection problem');
xlabel('x');
ylabel('f'' (x)');
drawnow

% The solution is computed for larger R by continuation, i.e.,
% the solution for one value of R is used as guess for the next.
hold on
for i=2:4
  R = R*10;
  sol = bvp4c(@ode,@bc,sol,options,R);
  fprintf('For R = %5i, A = %4.2f.\n',R,sol.parameters);
  plot(sol.x,sol.y(2,:),lines{i});
  drawnow
end
legend('R =     10','R =    100','R =   1000','R = 10000'); 
hold off
