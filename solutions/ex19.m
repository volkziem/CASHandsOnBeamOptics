% ex19.m, display position once-per-turn for 100 turns
% beamoptics;       % with beamline=fodo
%.........this replaces the call to beamoptics
clear all; close all;  
F=2.5;   
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
 	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
 	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10) 
beamline=fodo;  % or repmat(fodo,n,1)
[Racc,spos,nmat,nlines]=calcmat(beamline);
%..............................................
Nturn=100; data=zeros(Nturn,2);
x=[1;0];    % <-----play with these numbers
for k=1:Nturn
  x=Racc(:,:,end)*x;
  data(k,1)=x(1);
  data(k,2)=x(2);
end
plot(data(:,1))    % <----- only plot position vs turn number
xlabel( 'Turns'); ylabel('x [mrad]')


