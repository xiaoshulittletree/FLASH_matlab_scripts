%movie for flash lineoutsets
function []=Denslineoutmovie(var1, var2, FLASH, xoffset, y1unit, y2unit )
if ~exist('xoffset','var')
    xoffset=0;
end
if ~exist('y1unit','var')
    y1unit=1;
end
if ~exist('y2unit','var')
    y2unit=1;
end

figure(5)
i=0;
%var1='dens';
%var2='tele'
x1=xoffset+FLASH.([var1,num2str(i,'%04i')])(:,1);
y1=FLASH.([var1,num2str(i,'%04i')])(:,2)./y1unit;
x2=xoffset+FLASH.([var2,num2str(i,'%04i')])(:,1);
y2=FLASH.([var2,num2str(i,'%04i')])(:,2)./y1unit;
hline1=plot(x1,y1,'LineWidth',1);
%hold on;
%surf(Z)
%axis tight manual
ax1 = gca; %get current axes
ax1.Box='off';
ax1.YScale='log';
ax1_pos = ax1.Position; % position of first axes
ax1.YLim=[0.01 1000];
ax1.XLim=[0 0.05];
ax1.NextPlot = 'replaceChildren'; 
%after 2014b, it's OK, to use a dot to set properties. 
ax1.XAxisLocation='bottom';
ax1.YAxisLocation='left';
%legend('Mass Density');

xlabel('Position (cm)');
ylabel('Mass Density (g/cc)');

ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'YScale','log');
ax2.YLim=[1 10000];
ax2.XLim=ax1.XLim;

hline2=line(x2,y2,'Parent', ax2,'LineWidth',1,'Color','r');
ax2.NextPlot = 'replaceChildren'; 

ylabel('Temperature (eV)');

title('Radial Mass Density and Electron Temperature at 0.00 ns');
%legend('Electron Temperautre');

loops = 81;
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
x1=xoffset+FLASH.([var1,num2str(j,'%04i')])(:,1);
y1=FLASH.([var1,num2str(j,'%04i')])(:,2)./y1unit;
x2=xoffset+FLASH.([var2,num2str(j,'%04i')])(:,1);
y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./y2unit;
hline1=plot(ax1, x1,y1,'LineWidth',1);
%hold on;
%surf(Z)
%axis tight manual
%ax1 = gca; %get current axes
ax1.Box='off';
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
hline2=plot(x2,y2,'Parent',ax2,'LineWidth',1,'Color','r');
%ylabel('Temperature (eV)');
ax2.Box='off';
title(['Radial Mass Density and Electron Temperature at ',num2str(j*0.05,'%.2f'),' ns']);

  %  drawnow
    F(j) = getframe(gcf);%use gcf to get whole figure frame. 
    %hLine = line([1 1], [0 0]); % draw line this can add aline
    %delete(hLine) % delete the line
end
movie(F,1)
%movie(F,2)
%myVideo=VideoWrite('try.avi');
%Undefined function 'VideoWrite' for input arguments of type 'char'.
 
myVideo=VideoWriter(['Cufoam',var1,var2,'.avi']);
myVideo.FrameRate = 10;  % Default 30
myVideo.Quality = 75;    % Default 75
open(myVideo);
writeVideo(myVideo, F);
close(myVideo)
end