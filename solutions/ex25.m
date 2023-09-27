% ex25.m, verify that all matrices have unit deteminant
F=2.5;   % focal length of the quadrupoles
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10) 
beamline=fodo;  % beam line with one cell to determine sigma0
[Racc,spos,nmat,nlines]=calcmat(beamline);
data=zeros(nmat,1);
for k=1:nmat
  data(k,1)=det(Racc(:,:,k));
end
plot(spos,data,'*');
xlabel('s [m]'); ylabel('det(R)'); ylim([0,2]);