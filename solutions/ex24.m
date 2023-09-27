% ex24.m, 15 cells with periodic beta functions
clear all; close all;
F=2.5;   % focal length of the quadrupoles
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
	     2,  1,  0.0,  F;    % QF
       1,  5,  0.2,  0];   % 5* D(L/10) 
beamline=fodo;  % beam line with one cell to determine sigma0
[Racc,spos,nmat,nlines]=calcmat(beamline);
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
eps=1;
sigma0=eps*[beta, -alpha;-alpha,gamma]; % initial sigma matrix
%.............now build the beam line with 15 cells
beamline=repmat(fodo,15,1);
[Racc,spos,nmat,nlines]=calcmat(beamline);
data=zeros(nmat,1);
for k=1:nmat
  sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
  data(k,1)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k') 
xlabel('s [m]'); ylabel('\beta [m]')