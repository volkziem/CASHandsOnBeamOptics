% ex17.m, find periodic sigma-matrix 
clear all; close all;
beamoptics;   % with beamline=fodo
sigma0=[20,0;0,1];   %  <-----change this
sigma=Racc(:,:,end)*sigma0*Racc(:,:,end)'



