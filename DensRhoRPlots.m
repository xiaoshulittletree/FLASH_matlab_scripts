%too crowd, not useful

function []=DensRhoRPlots(var1, var2, FLASH, xoffset, y1unit, y2unit, plottime)
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
hline1=plot(x1,y1,'LineWidth',2);
%hold on;
%surf(Z)
%axis tight manual
ax1 = gca; %get current axes
ax1.Box='off';
ax1.YScale='linear';
ax1_pos = ax1.Position; % position of first axes
ax1.YLim=[0 50];
ax1.XLim=[0 0.025];
ax1.NextPlot = 'replaceChildren';
%after 2014b, it's OK, to use a dot to set properties.
ax1.XAxisLocation='bottom';
ax1.YAxisLocation='left';
ax1.FontSize=14;
%legend('Mass Density');
hold(ax1, 'on');%hold only hold the current axis

xlabel('Radial Position (cm)');
ylabel('Mass Density (g/cm^{3})');

ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'YScale','linear');
ax2.YLim=[0 0.05];
ax2.XLim=ax1.XLim;
ax2.FontSize=ax1.FontSize;

hline2=line(x2,y2,'Parent', ax2,'LineWidth',2);
ax2.NextPlot = 'replaceChildren';
hold( ax2,'on');
ylabel('\rho R (g/cm^2)');
%title('Radial Electron Density and Electron Temperature at 0.00 ns');
%legend('Electron Temperautre');

for nj = 2:length(plottime)
    j=plottime(nj);
    x1=xoffset+FLASH.([var1,num2str(j,'%04i')])(:,1);
    y1=FLASH.([var1,num2str(j,'%04i')])(:,2)./y1unit;
    x2=xoffset+FLASH.([var2,num2str(j,'%04i')])(:,1);
    y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./y2unit;
    title(['Radial Electron Density and Electron Temperature at ',num2str(j*0.05,'%.2f'),' ns']);
    
    hline1=plot(ax1, x1,y1,'LineWidth',2);
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
    hline2=plot(x2,y2,'Parent',ax2,'LineWidth',2);
    %ylabel('Temperature (eV)');
    %ax2.Box='off';
    
    %  drawnow
    %  F(j) = getframe(gcf);%use gcf to get whole figure frame.
    %hLine = line([1 1], [0 0]); % draw line this can add aline
    %delete(hLine) % delete the line
end
end
