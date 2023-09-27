% ex12.m, calculate angular divergence of ensemble of particles
clear all; close all;
Npart=10000;
beam=randn(2,Npart);
sigx=1; x0=0;
sigxp=0.5; xp0=1;
beam(1,:)=sigx*beam(1,:);
beam(2,:)=sigxp*beam(2,:)+xp0;
angular_divergence=std(beam(2,:))
