% show_beam.m
function show_beam(beam,xbins,ybins)
subplot(2,2,1); contour(xbins,ybins,hist3(beam',{xbins,ybins})');
xlabel('x [mm]'); ylabel('x'' [mrad]');
subplot(2,2,2); histogram(beam(2,:),ybins); xlabel('x'' [rad]'); camroll(90)
title(['Mean = ',num2str(mean(beam(2,:)),2),' \pm ',num2str(std(beam(2,:)),2)])
subplot(2,2,3); histogram(beam(1,:),xbins); xlabel('x [m]');
title(['Mean = ',num2str(mean(beam(1,:)),2),' \pm ',num2str(std(beam(1,:)),2)])
subplot(2,2,4); hist3(beam',{xbins,ybins}); 
xlabel('x [mm]'); ylabel('x'' [mrad]');