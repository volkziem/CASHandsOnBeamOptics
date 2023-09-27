% ex20.m, display turn-by-turn data for 100 turns
F=-2.5;   % <----- reverse polarity
%....the original FODO cell
fodo=[ 1,  5,  0.2,  0;    % 5* D(L/10)
 	     2,  1,  0.0, -F;    % QD
	     1, 10,  0.2,  0;    % 10* D(L/10)  
 	     2,  1,  0.0,  F;    % QF/2
       1,  5,  0.2,  0];   % 5* D(L/10) 
beamline=fodo;
[Racc,spos,nmat,nlines]=calcmat(beamline);
Nturn=100; data=zeros(Nturn,2);
x=[1;0];    % <-----play with these numbers
for k=1:Nturn
  x=Racc(:,:,end)*x;
  data(k,1)=x(1);
  data(k,2)=x(2);
end
plot(data(:,1),data(:,2),'.')
xlabel( 'x [mm]'); ylabel('x'' [mrad]')

