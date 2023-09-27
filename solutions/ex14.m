% ex14.m, average position and angular divergence along beamline
beamoptics;    % with beamline=repmat(fodo,5,1)
Npart=10000;
beam=randn(2,Npart);
sigx=1; x0=0;
sigxp=0.5; xp0=1;
beam(1,:)=sigx*beam(1,:)+x0;
beam(2,:)=sigxp*beam(2,:)+xp0;
beam0=beam;   % store initial beam
data=zeros(nmat,2);
for k=1:nmat
  beam=Racc(:,:,k)*beam0;
  data(k,1)=mean(beam(1,:));  % (a) average position
  data(k,2)=std(beam(2,:));   % (b) angular divergence
end
subplot(2,1,1); plot(spos,data(:,1))
xlabel('s [m]'); ylabel('x [mm]')
subplot(2,1,2); plot(spos,data(:,2))
xlabel('s [m]'); ylabel('\sigma''_x [mm]')