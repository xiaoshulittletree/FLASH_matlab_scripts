function comparisonint(scale,varname, flashx,flashvar,hrcm30,h30,hrcm40,h40, hrcm50,h50,hrcm60,h60,hrcm100,h100)

% Create figure
figure1 = figure;
disp(scale);
switch varname
    case('dene')
    axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','log',...
    'FontSize',12);
    ylabel({'Electron Density (cm^{-3})'},'FontSize',14);
    title(strcat('Electron Density Comparison between Hyades and FLASH'),'FontSize',14);
    case('rho')
    axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','log',...
    'FontSize',12);
    ylabel({'Mass Density (g/cm^{3})'},'FontSize',14);
    title(strcat('Mass Density Comparison between Hyades and FLASH'),'FontSize',14);
    case('te')
    axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','linear',...
    'FontSize',12);
    ylabel({'Electron Temperature (keV)'},'FontSize',14);
    title(strcat('Electron Temperature Comparison between Hyades and FLASH'),'FontSize',14);
        

end
%% Uncomment the following line to preserve the X-limits of the axes
 xlim(axes1,[-0.25 0.05]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[1e+18 1e+24]);
box(axes1,'on');
hold(axes1,'on');

% Create ylabel

% Create xlabel
xlabel({'Axial Position (cm)'},'FontSize',14);

% Create title

plot(flashx, flashvar,'DisplayName','FLASH 2.5ns');
plot(hrcm30, h30,'DisplayName','Hyades 30%');

plot(hrcm40, h40,'DisplayName','Hyades 40%');

plot(hrcm50, h50,'DisplayName','Hyades 50%');
plot(hrcm60, h60,'DisplayName','Hyades 60%');
plot(hrcm100, h100,'DisplayName','Hyades 100%');

legend1 = legend(axes1,'show');



