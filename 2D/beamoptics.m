% beamoptics.m, 
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
%beamline=[fodo;fodo];
%beamline=repmat(fodo,5,1);
nlines=size(beamline,1);      % number of lines in beamline
nmat=sum(beamline(:,2))+1;    % sum over repeat-count in column 2
Racc=zeros(2,2,nmat);         % matrices from start to element-end
Racc(:,:,1)=eye(2);           % initialize first with unit matrix
spos=zeros(nmat,1);           % longitudinal position
ic=1;                         % element counter
for line=1:nlines             % loop over input elements
  for seg=1:beamline(line,2)  % loop over repeat-count 
     ic=ic+1;                 % next element          
     Rcurr=eye(2);            % matrix in next element
     switch beamline(line,1)  
       case 1   % drift
          Rcurr=D(beamline(line,3));
       case 2   % thin quadrupole
          Rcurr=Q(beamline(line,4));   
       otherwise
          disp('unsupported code')
     end		  
     Racc(:,:,ic)=Rcurr*Racc(:,:,ic-1);    % concatenate 
     spos(ic)=spos(ic-1)+beamline(line,3); % position of element   
  end
end
x0=[0.001;0];         % 1 mm offset at start
data=zeros(1,nmat);   % allocate memory
for k=1:nmat          
  x=Racc(:,:,k)*x0;
  data(k)=x(1);       % store the position
end
plot(spos,1e3*data,'k','LineWidth',2);
xlabel('s [m]'); ylabel(' x [mm]'); xlim([spos(1),spos(end)])
