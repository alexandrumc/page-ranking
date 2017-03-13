function [y] = Putere(A,y,eps)
  z=A*y;
  y1=z/norm(z,1);
  lambda=y1'*A*y1;
  while norm(y1-y,2)>eps
    y=y1;
    z=A*y1;
    y1=z/norm(z,1);
    lambda=y1'*A*y1;
  endwhile
endfunction

