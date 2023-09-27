% match_phase_advance.m
clear all; close all
F=1.414;   % focal length of the quadrupoles
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10)  
beamline=fodo;
[Racc,spos,nmat,nlines]=calcmat(beamline);
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
Q=Q