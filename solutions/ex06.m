% ex06.m, beamline for imaging equation
clear all; close all
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];

% need to define later
b=
g=
f=

optics=[ 1, 1, g, 0;
         2, 1, 0, f;
         1, 1, b, 0];

 
