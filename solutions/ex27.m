% ex27.m, match tune to 1/6 and 1/4
clear all; close all
F=2;       % for 60 degrees, Q=1/6
F=sqrt(2); % for 90 degrees, Q=0.25
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10)  
beamline=fodo;
[Racc,spos,nmat,nlines]=calcmat(beamline);
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
Q=Q