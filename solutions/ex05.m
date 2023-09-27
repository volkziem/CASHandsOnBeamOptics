% ex05.m, parallel rays cross axis at focal point
clear all; close all
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];

x0=[1;0];  % initial ray, parallel

F=3;   % focal length
L=F;   % drift space
xout=D(L)*Q(F)*x0     % xout(1) should be zero
