% ex22.m, stability of FODO cells
clear all; close all;
F=-3:0.01:3;
data=zeros(length(F),1);
for k=1:length(F)
  fodo=[ 1,  5,  0.2,  0;       % 5* D(L/10)
 	       2,  1,  0.0, -F(k);    % QD
	       1, 10,  0.2,  0;       % 10* D(L/10)  
 	       2,  1,  0.0,  F(k);    % QF/2
         1,  5,  0.2,  0];      % 5* D(L/10) 
  beamline=fodo;
  [Racc,spos,nmat,nlines]=calcmat(beamline);
  [Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
  if (~isreal(Q)) data(k)=1; end
end
plot(F,data,'*');
xlabel('F [m]'); ylabel('unstable = 1'); ylim([0,1.1])