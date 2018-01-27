%%importdataandplot
time={'0.0','0.5','1.0','1.5','2.0','2.5','3.0','3.5','4.0','4.5','5.0'};
series=0:11;
series(9)=[];
variable={'edens','Tele'};

for i=1:11
    for j=1:2
        charvariable=char(variable(j));
        chartime=char(time(i));
        filename=strcat('Filamentation2nspulse',charvariable,chartime,'.curve');
        [denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
        denex0=[denex0x, denex0y];
        figure1 = figure;   
         
        switch charvariable
            case 'edens'
                
                
                axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','log',...
                    'FontSize',12);
                ylabel({'Electron Density (cm^{-3})'},'FontSize',14);
                title(strcat('Electron Density @',chartime,'ns'),'FontSize',14);
                ylim(axes1,[1e17 1e24]);
                %plot(denex0x-0.4, denex0y);

            case 'Tele'
                axes1 = axes('Parent',figure1,'YMinorTick','on','YScale','linear',...
                    'FontSize',12);
                ylabel({'Electron Temperature (keV)'},'FontSize',14);
                title(strcat('Electron Temperature @',chartime,'ns'),'FontSize',14);
                ylim(axes1,[0 1.8]);
              %  plot(denex0x-0.4, denex0y/11.6e6);
                denex0y=denex0y/11.6e6;
                        
        end
        xlim(axes1,[-0.4 0.05]); 
        xlabel({'Axial Position (cm)'},'FontSize',14);
        
        box(axes1,'on');
        hold(axes1,'on'); 
        grid on;
        plot(denex0x-0.4, denex0y);
        
        saveas(figure1, [filename(1:end-5), 'png']);
    end
end