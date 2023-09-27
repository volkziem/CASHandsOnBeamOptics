% ex11.m, verify imaging equation
clear all; close all
g=2;
f=0.5;
b=1/(1/f-1/g);  % imaging equation
optics=[ 1, 1, g, 0;
         2, 1, 0, f;
         1, 1, b, 0];
beamline=optics;
[Racc,spos,nmat,nlines]=calcmat(beamline);
x0=[0; 0.001];        % <----------initial angle
data=zeros(1,nmat);   % allocate memory
for k=1:nmat          
  x=Racc(:,:,k)*x0;
  data(k)=x(1);       % <------------ position
end
plot(spos,1e3*data,'k','LineWidth',2);
xlabel('s [m]'); ylabel(' x [mm]'); xlim([spos(1),spos(end)])
