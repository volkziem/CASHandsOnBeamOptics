% ex08.m, plot x' vs s
clear all; close all
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];
F=2.5;   % focal length of the quadrupoles
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
       2,  1,  0.0, -F;    % QD
       1, 10,  0.2,  0;    % 10* D(L/10)  
       2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10)  
beamline=fodo;               % name must be 'beamline' 
[Racc,spos,nmat,nlines]=calcmat(beamline);
x0=[0; 0.001];        % <------------1 mrad angle at start
data=zeros(1,nmat);   % allocate memory
for k=1:nmat          
  x=Racc(:,:,k)*x0;
  data(k)=x(2);       % <------------store the angle
end
plot(spos,1e3*data,'k','LineWidth',2);
xlabel('s [m]'); ylabel(' x'' [mrad]'); xlim([spos(1),spos(end)])
