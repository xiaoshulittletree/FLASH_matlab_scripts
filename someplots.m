%% change filename, var, unit in ylabel, 

filename='edens_1_5ns.curve';
[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=[denex0x, denex0y];
var='Electron density';
figure1 = figure;
%disp(scale);
axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','log',...
    'FontSize',12);
ylabel([var, ' (cm^{-3})'],'FontSize',14);
    title(var,'FontSize',14);
    
 xlim(axes1,[-0.25 0.05]);
%% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[1e+18 1e+24]);
box(axes1,'on');
hold(axes1,'on');

% Create ylabel

% Create xlabel
xlabel({'Axial Position (cm)'},'FontSize',14);

% Create title

plot(denex0x-0.4, denex0y,'DisplayName',var);

%legend1 = legend(axes1,'show');

saveas(figure1, [filename(1:end-5), 'png']);