% QQ.m, quadrupole
function out=QQ(L,k1)
ksq=sqrt(abs(k1));
if abs(k1) < 1e-6
    out=[1,L;0,1];
elseif k1>0
  out=[cos(ksq*L),sin(ksq*L)/ksq; -ksq*sin(ksq*L),cos(ksq*L)];    
else
  out=[cosh(ksq*L),sinh(ksq*L)/ksq; ksq*sinh(ksq*L),cosh(ksq*L)];
end
