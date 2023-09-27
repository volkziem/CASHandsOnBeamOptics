% ex32.m, include sector dipoles in the straight sections
clear all; close all

L=2;
F=2;    
fodo0=[2,   1,    0,  2*F;    
       1,  20, L/20,  0;      
       2,   1,    0, -F;      
       1,  20, L/20,  0;      
       2,   1,    0,  2*F];

F=2.057;
phi=5/10;  % ten slices
fodo1=[2,   1,    0,  2*F;    
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0, -F;      
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0,  2*F];

F=2.262;
phi=10/10;   % ten slices
fodo2=[2,   1,    0,  2*F;    
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0, -F;      
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0,  2*F];

F=6.05;
phi=20/10;   % ten slices
fodo3=[2,   1,    0,  2*F;    
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0, -F;      
       1,   5, L/20,  0; 
       4,  10, 0.1,   phi;     
       1,   5, L/20,  0;      
       2,   1,    0,  2*F];

beamline=fodo3;                  % <----- select FODO cell here
nmat=sum(beamline(:,2))+1;
[Racc,spos]=calcmat2(beamline);  % calculate matrices
Rturn=Racc(:,:,end);             % full turn matrix
[Q,alpha0,beta0,gamma0]=R2beta(Rturn);
Q=Q      % display the tune, should be 1/6

%.....just observe the betafunctions
eps0=1;
sigma0=eps0*[beta0, -alpha0; -alpha0,gamma0]
for k=1:nmat
   sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
   beta(k)=sigma(1,1)/eps0;
end
plot(spos,beta); xlabel('s [m]'); ylabel('\beta [m]')
