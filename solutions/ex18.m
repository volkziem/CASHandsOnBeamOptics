% ex18.m, change X0 and look at phase space plots
beamoptics;       % with beamline=fodo
Nturn=100; data=zeros(Nturn,2);
x=[1;-1];    % <-----play with these numbers
for k=1:Nturn
  x=Racc(:,:,end)*x;
  data(k,1)=x(1);
  data(k,2)=x(2);
end
plot(data(:,1),data(:,2),'.')
xlabel( 'x [mm]'); ylabel('x'' [mrad]')

