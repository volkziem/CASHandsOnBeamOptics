% trak_single_particle.m
beamoptics;       % define beam line here
Nturn=100; data=zeros(Nturn,2);
x=[1;0];    % initial condition, 1 mm, no angle
for k=1:Nturn
  x=Racc(:,:,end)*x;
  data(k,1)=x(1);
  data(k,2)=x(2);
end
plot(data(:,1),data(:,2),'.')
xlabel( 'x [mm]'); ylabel('x'' [mrad]')

