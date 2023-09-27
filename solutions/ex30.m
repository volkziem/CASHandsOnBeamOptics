% ex30.m, replace short by long quadrupoles
clear all; close all

L=2;
F=2;    
fodo0=[	1,  5, L/10,  0;      % thin lens
	2,  1,    0, -F;      
	1, 10, L/10,  0;      
	2,   1,   0,  F;
  1,  5, L/10,  0; ];

K1=2.588;  % fiddle until the tunes are right 0.2 m value
fodo1=[ 1,  9, L/20,    0;   % thick lens lattice
	5,  1,  0.2, -K1;       
	1, 18, L/20,    0;      
	5,  1,  0.2,  K1;       
  1,  9, L/20,  0; ];

K1=1.343;  % fiddle until the tunes are right 0.4 m value
fodo2=[ 	1,  8, L/20,    0;  
	5,  2,  0.2, -K1;       
	1, 16, L/20,    0;      
	5,  2,  0.2,  K1;       
  1,  8, L/20,  0; ];

K1=0.613;  % fiddle until the tunes are right 1.0 m value
fodo3=[ 	1,  5, L/20,    0;  
	5,  5,  0.2, -K1;       
	1, 10, L/20,    0;      
	5,  5,  0.2,  K1;       
  1,  5, L/20,  0; ];

beamline=fodo3;                  % <--------select FODO cell here
[Racc,spos]=calcmat2(beamline);  % calculate matrices
Rturn=Racc(:,:,end);             % full turn matrix

[Q,alpha,beta,gamma]=R2beta(Rturn);
beta=beta
Q=Q      % display the tune, should be 1/6
