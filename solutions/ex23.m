% periodic_beam.m, ex23.m
beamoptics;    % adjust for one cell, (beamline=fodo)
[Q,alpha,beta,gamma]=R2beta(Racc(:,:,end));
data=zeros(nmat,1);  % allocate memory for display
eps=1; % set emittance to unity
sigma0=eps*[beta, -alpha;-alpha,gamma]
for k=1:nmat
  sigma=Racc(:,:,k)*sigma0*Racc(:,:,k)';
  data(k,1)=sqrt(sigma(1,1));
end
plot(spos,data(:,1),'k') 
% inspect the values in array data
sigma=sigma
