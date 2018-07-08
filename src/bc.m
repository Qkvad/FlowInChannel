function res = bc(ya,yb)
  %res = ex8bc(ya,yb,A,R)
%EX8BC  Boundary conditions for Example 8 of the BVP tutorial.
R=100;
res = [ya(1)
       ya(2)
       yb(1) - 1
       yb(2)
       ya(4)
       yb(4)
       ya(6)
       yb(6) - 1];
