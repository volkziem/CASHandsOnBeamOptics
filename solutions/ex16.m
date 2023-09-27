% ex16.m, compare position and angular divergence with two methods
beamoptics;   % prepare lattice with 5 cells
Npart=10000;
beam=randn(2,Npart);
sigx=1; x0=0;
sigxp=0.5; xp0=1;
beam(1,:)=sigx*beam(1,:)+x0;
beam(2,:)=sigxp*beam(2,:)+xp0;
beam0=beam;
data=zeros(nmat,2);
for k=1:nmat    % propagate all the particles
  beam=Racc(:,:,k)*beam0;
  data(k,1)=std(beam(1,:));
end
X0=[x0;xp0];   
sigma0=[sigx^2,0;0,sigxp^2];
for k=1:nmat    % propagate the sigma matrix
  X=Racc(:,:,k)*X0;
  sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
  data(k,2)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k',spos,data(:,2),'*')  % plot both
xlabel('s [m]'); ylabel('\sigma_x [mm]')
