function dydx = ode(x,y)
  %dydx = ex8ode(x,y,A,R);
%EX8ODE  ODE function for Example 8 of the BVP tutorial.
R=100;
P = 0.7*R;
dydx = [ y(2)
         y(3)
         R*(y(2)^2 - y(1)*y(3))
         y(5)
        -R*y(1)*y(5) - 1
         y(7)
        -P*y(1)*y(7) ];