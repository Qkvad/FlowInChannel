function res = bc(ya,yb)
  
%   Boundary conditions

res = [ya(1)
       ya(2)
       yb(1) - 1
       yb(2)
       ya(4)
       yb(4)
       ya(6)
       yb(6) - 1];
