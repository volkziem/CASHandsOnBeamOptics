% periodic_beam.m
beamoptics;
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
eps=1; % set emittance to unity
sigma0=eps*[beta, -alpha;-alpha,gamma];
for k=1:nmat
  sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
  data(k,1)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k') 
