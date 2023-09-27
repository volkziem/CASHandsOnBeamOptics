% propagate_beam.m
clear all; close all;
beamoptics;    % with beamline=repmat(fodo,5,1)
Npart=10000;
beam=randn(2,Npart);
x0=0; sigx=1;     % initial average position and width
xp0=1; sigxp=0.5; % initial angle and divergence
beam(1,:)=sigx*beam(1,:)+x0;
beam(2,:)=sigxp*beam(2,:)+xp0;
xbins=-4*sigx:0.5*sigx:4*sigx;      % binning for histogram
%ybins=-4*sigxp:0.5*sigxp:4*sigxp;
ybins=xbins;
beam0=beam;   % save for posterity
show_beam(beam0,xbins,ybins);    % Figure 1 left
pause(1); figure
R=[1,1;0,1]; beam=R*beam0; 
show_beam(beam,xbins,ybins);     % Figure 1 right
figure
data=zeros(nmat,2);
for k=1:nmat                     % propagate particles
  beam=Racc(:,:,k)*beam0;
  data(k,1)=std(beam(1,:));
end
X0=[x0;xp0];                     % initial centroids
sigma0=[sigx^2,0;0,sigxp^2];     % and sigma0
for k=1:nmat
  X=Racc(:,:,k)*X0;              % Equation 7
  sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
  data(k,2)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k',spos,data(:,2),'*')
xlabel('s [m]'); ylabel('\sigma_x [mm]')
