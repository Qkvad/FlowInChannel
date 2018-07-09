function dydx = ode(x,y,A,R)
   %  ODE function 
P = 0.7*R;
dydx = [ y(2)
         y(3)
         R*(y(2)^2 - y(1)*y(3)-A)
         y(5)
        -R*y(1)*y(5) - 1
         y(7)
        -P*y(1)*y(7) ];
