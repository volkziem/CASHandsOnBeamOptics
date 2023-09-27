% calcmat2.m, including long quadrupoles and sector bends
function [Racc,spos]=calcmat2(beamline)
N=2;    % we're dealing with 2x2 matrices
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];
nlines=size(beamline,1);
nmat=sum(beamline(:,2))+1;
Rcurr=zeros(2,2);
Racc=zeros(2,2,nmat); 
spos=zeros(nmat,1);
Racc(:,:,1)=eye(N); 

ic=1;
for line=1:nlines
  for seg=1:beamline(line,2)
     ic=ic+1;
     Rcurr=eye(2);
     switch beamline(line,1)  
     case 1   % drift
        Rcurr=D(beamline(line,3));
     case 2   % thin quad
        Rcurr=Q(beamline(line,4));
     case 4   % sector bend
        phi=beamline(line,4)*pi/180;   % to radians
        Rcurr=SB(beamline(line,3),phi);
     case 5   % thick quadrupole
        k1=beamline(line,4);
        Rcurr=QQ(beamline(line,3),k1);
     otherwise
        disp('unsupported code')
    end		  
    Racc(:,:,ic)=Rcurr*Racc(:,:,ic-1);
    spos(ic)=spos(ic-1)+beamline(line,3);
  end
end
