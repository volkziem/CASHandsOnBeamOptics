% SB.m, sector bend
function out=SB(L,phi);
out=eye(2);
if abs(phi)<1e-8
  out(1,2)=L;
else
  rho=L/phi;
  out=[cos(phi),rho*sin(phi); -sin(phi)/rho,cos(phi)];
end
