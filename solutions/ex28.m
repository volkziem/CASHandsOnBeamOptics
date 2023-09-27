% ex28.m, match 60 to 90 degree lattice
clear all; close all

F=2;       % for 60 degrees
fodo60=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	       2,  1,  0.0, -F;    % QD
	       1, 10,  0.2,  0;    % 10* D(L/10)  
	       2,  1,  0.0,  F;    % QF/2
         1,  5,  0.2,  0];   % 5* D(L/10)  
beamline=fodo60;
[Racc,spos,nmat,nlines]=calcmat(beamline);
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
eps=1; sigma60=eps*[beta, -alpha;-alpha,gamma];  % <-- sigma60
%return

F=sqrt(2);  % for 90 degree
fodo90=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10) 
beamline=fodo90;
[Racc,spos,nmat,nlines]=calcmat(beamline);
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
eps=1; sigma90=eps*[beta, -alpha;-alpha,gamma];  % <-- sigma90

beamline=[fodo60;fodo90]
beamline=[fodo60;fodo60;repmat(fodo90,10,1)];
%return
%..............vary the focal length of the following two quadrupole
beamline(7,4)=-2.03;   % QD in second cell  
beamline(9,4)=1.66;  % QF in second cell
[Racc,spos,nmat,nlines]=calcmat(beamline);
data=zeros(nmat,1);
for k=1:nmat
  sigma=Racc(:,:,k)*sigma60*Racc(:,:,k)';
  data(k,1)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k') 
xlabel('s [m]'); ylabel('\beta [m]')