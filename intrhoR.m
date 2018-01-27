%scripts for rho R
function rhoR=intrhoR(FLASH, var, i, timeinterval)
rhoR= zeros(i+1,2);
rhoR(:,1)=0:timeinterval:i*timeinterval;
for j=0:i
    rhoR(j+1,2)=trapz(FLASH.([var,num2str(j,'%04i')])(:,1),...
        FLASH.([var,num2str(j,'%04i')])(:,2));
end
figure;plot(rhoR(:,1),rhoR(:,2));
xlabel('Time (ns)');
ylabel('\rho R (g/cm^2)')
title(inputname(1))
ax=gca;
ax.FontSize=14;
ax.XGrid='on';
ax.YGrid='on';
saveas(gcf,['rhoR_',inputname(1),'.fig']);
saveas(gcf,['rhoR_',inputname(1),'.png']);

end