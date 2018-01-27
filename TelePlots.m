

function []=TelePlots(var1, FLASH, xoffset, y1unit)
figure;
if ~exist('xoffset','var')
    xoffset=0;
end
if ~exist('y1unit','var')
    y1unit=11.6e3;
end

time=[20;30;38];
for j=1:length(time)
    i=time(j);
%var1='dens';
%var2='tele'
x1=xoffset+FLASH.([var1,num2str(i,'%04i')])(:,1);
y1=FLASH.([var1,num2str(i,'%04i')])(:,2)./y1unit;

hline1=plot(x1,y1,'LineWidth',2);
%hold on;
%surf(Z)
%axis tight manual
if j==1
    ax1 = gca; %get current axes
    %ax1.Box='off';
    ax1.YScale='linear';
    ax1_pos = ax1.Position; % position of first axes
    ax1.YLim=[0, 2000];
    ax1.XLim=[0 0.2];
    ax1.NextPlot = 'replaceChildren';
    %after 2014b, it's OK, to use a dot to set properties.
    ax1.XAxisLocation='bottom';
    ax1.YAxisLocation='left';
    ax1.FontSize=18;
    %legend('Mass Density');
    hold(ax1, 'on');%hold only hold the current axis

    xlabel('Position (cm)');
    ylabel('Electron Temperature (eV)');

%title('Radial Electron Density and Electron Temperature at 0.00 ns');
%legend('Electron Temperautre');
end



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

%ylabel('Temperature (eV)');
%ax2.Box='off';

  %  drawnow
  %  F(j) = getframe(gcf);%use gcf to get whole figure frame. 
    %hLine = line([1 1], [0 0]); % draw line this can add aline
    %delete(hLine) % delete the line
end
end
