%too crowd, not useful

function []=EdenTelePlots(var1, var2, FLASH, xoffset, y1unit, y2unit, plottime)
figure;

if ~exist('xoffset','var')
    xoffset=0;
end
if ~exist('y1unit','var')
    y1unit=1;
end
if ~exist('y2unit','var')
    y2unit=1;
end

i=plottime(1);
%var1='dens';
%var2='tele'
x1=xoffset+FLASH.([var1,num2str(i,'%04i')])(:,1);
y1=FLASH.([var1,num2str(i,'%04i')])(:,2)./y1unit;
x2=xoffset+FLASH.([var2,num2str(i,'%04i')])(:,1);
y2=FLASH.([var2,num2str(i,'%04i')])(:,2)./y2unit;
[AX,hline1,hline2]=plotyy(x1,y1,x2,y2,'semilogy');
%hold on;
%surf(Z)
%axis tight manual

%AX(1).Box='off';
%AX(1).YScale='log';
%ax1_pos = AX(1).Position; % position of first axes
AX(1).YLim=[1e20 1e23];
AX(1).XLim=[-0.01 0.06];
AX(1).NextPlot = 'replaceChildren';
%after 2014b, it's OK, to use a dot to set properties.

AX(1).FontSize=14;
AX(1).YTickLabelMode='auto';
AX(1).YTickMode='auto';

%legend('Mass Density');
%hold(AX1, 'on');%hold only hold the current axis

xlabel('Position (cm)');
ylabel(AX(1),'Electron Density (cm^{-3})');


AX(2).YLim=[10 10000];
AX(2).XLim=AX(1).XLim;
AX(2).FontSize=AX(1).FontSize;
AX(2).YTickMode='auto';

%hline2=line(x2,y2,'Parent', ax2,'LineWidth',2);
AX(2).NextPlot = 'replaceChildren';
%hold( ax2,'on');
ylabel(AX(2),'Temperature (eV)');
title('Radial Electron Density and Electron Temperature at 0.00 ns');
hold(AX(1),'on');
hold(AX(2),'on');

%legend('Electron Temperautre');
if length(plottime)>1
    for nj = 2:length(plottime)
        j=plottime(nj);
        x1=xoffset+FLASH.([var1,num2str(j,'%04i')])(:,1);
        y1=FLASH.([var1,num2str(j,'%04i')])(:,2)./y1unit;
        x2=xoffset+FLASH.([var2,num2str(j,'%04i')])(:,1);
        y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./y2unit;
        title(['Radial Electron Density and Electron Temperature at ',num2str(j*0.05,'%.2f'),' ns']);
        
        plot(AX(1), x1,y1,'LineWidth',2);
        %hold on;
        %surf(Z)
        %axis tight manual
        %ax1 = gca; %get current axes
        %ax1.Box='off';
        %ax1.YScale='log';
        %ax1_pos = ax1.Position; % position of first axes
        %ax1.YLim=[1e-9 100];
        %ax1.NextPlot = 'replaceChildren';
        %after 2014b, it's OK, to use a dot to set properties.
        %ax1.XAxisLocation='bottom';
        %ax1.YAxisLocation='left';
        %legend('Mass Density');
        
        %xlabel('Position (cm)');
        %ax2 = axes('Position',ax1_pos,...
        %    'XAxisLocation','top',...
        %    'YAxisLocation','right',...
        %    'Color','none',...
        %    'YScale','log');
        plot(x2,y2,'Parent',AX(2),'LineWidth',2);
        %ylabel('Temperature (eV)');
        %ax2.Box='off';
        
        %  drawnow
        %  F(j) = getframe(gcf);%use gcf to get whole figure frame.
        %hLine = line([1 1], [0 0]); % draw line this can add aline
        %delete(hLine) % delete the line
    end
end
end
