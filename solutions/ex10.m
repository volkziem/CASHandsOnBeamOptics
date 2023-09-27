% ex10.m, plot for 100 cells and make lattice unstable
clear all; close all
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];
F=1.0001; %2.5;   % focal length of the quadrupoles
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
       2,  1,  0.0, -F;    % QD
       1, 10,  0.2,  0;    % 10* D(L/10)  
       2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10)  
beamline=repmat(fodo,100,1);   % <----------define longer beamline
[Racc,spos,nmat,nlines]=calcmat(beamline);
x0=[0; 0.001];        % <----------initial values
data=zeros(1,nmat);   % allocate memory
for k=1:nmat          
  x=Racc(:,:,k)*x0;
  data(k)=x(1);       % <------------store position(1) or angle (2)
end
plot(spos,1e3*data,'k','LineWidth',2);
xlabel('s [m]'); ylabel(' x [mm]'); xlim([spos(1),spos(end)])
