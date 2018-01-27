%movie for flash lineoutsets
function []=EdenTelelineoutmovie(var1, var2, FLASH, xoffset, y1unit, y2unit,loops )
if ~exist('xoffset','var')
    xoffset=0;
end
if ~exist('y1unit','var')
    y1unit=1;
end
if ~exist('y2unit','var')
    y2unit=1;
end
figure
title('Radial Electron Density and Electron Temperature at 0.00 ns');

i=0;
%var1='dens';
%var2='tele'
x1=xoffset+FLASH.([var1,num2str(i,'%04i')])(:,1);
y1=FLASH.([var1,num2str(i,'%04i')])(:,2)./y1unit;
x2=xoffset+FLASH.([var2,num2str(i,'%04i')])(:,1);
y2=FLASH.([var2,num2str(i,'%04i')])(:,2)./y2unit;
hline1=plot(x1,y1,'LineWidth',1);
title('Radial Electron Density and Electron Temperature at 0.00 ns');

%hold on;
%surf(Z)
%axis tight manual
ax1 = gca; %get current axes
ax1.Box='off';
ax1.YScale='log';
%ax1_pos = ax1.Position; % position of first axes
ax1.YLim=[1e19 1e23];
ax1.XLim=[0 0.3];
ax1.NextPlot = 'replaceChildren'; 
%after 2014b, it's OK, to use a dot to set properties. 
ax1.XAxisLocation='top';
ax1.YAxisLocation='left';
ax1.FontSize=14;
%legend('Mass Density');

%xlabel('Position (cm)');
ylabel('Electron Density (cm^{-3})');
ax1_pos = ax1.Position; % position of first axes

ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','bottom',...
    'YAxisLocation','right',...
    'Color','none',...
    'YScale','log');
ax2.YLim=[1 10000];
ax2.XLim=ax1.XLim;
ax2.FontSize=ax1.FontSize;
hline2=line(x2,y2,'Parent', ax2,'LineWidth',1,'Color','r');
ax2.NextPlot = 'replaceChildren'; 
grid(ax2,'on');
ylabel('Temperature (eV)');
xlabel('Position (cm)');
%legend('Electron Temperautre');

%loops = 90;
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
x1=xoffset+FLASH.([var1,num2str(j,'%04i')])(:,1);
y1=FLASH.([var1,num2str(j,'%04i')])(:,2)./y1unit;
x2=xoffset+FLASH.([var2,num2str(j,'%04i')])(:,1);
y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./y2unit;
axes(ax1);
%hline1=plot(ax1, x1,y1,'LineWidth',1);
hline1=plot( x1,y1,'Parent',ax1,'LineWidth',1);

title(['Radial Electron Density and Electron Temperature at ',num2str(j*0.05,'%.2f'),' ns']);

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
axes(ax2);
hline2=plot(x2,y2,'Parent',ax2,'LineWidth',1,'Color','r');
%ylabel('Temperature (eV)');
%ax2.Box='off';

  %  drawnow
    F(j) = getframe(gcf);%use gcf to get whole figure frame. 
    %hLine = line([1 1], [0 0]); % draw line this can add aline
    %delete(hLine) % delete the line
end
movie(F,1)
%movie(F,2)
%myVideo=VideoWrite('try.avi');
%Undefined function 'VideoWrite' for input arguments of type 'char'.
 
myVideo=VideoWriter([inputname(3),var1,var2,'.avi']);
myVideo.FrameRate = 10;  % Default 30
myVideo.Quality = 75;    % Default 75
open(myVideo);
writeVideo(myVideo, F);
close(myVideo)