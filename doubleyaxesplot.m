%%multi axes example
% double y axes
x1 = FLASH.dens0043(:,1)*10000;
y1 = FLASH.dens0043(:,2);
x2 = FLASH.tele0043(:,1)*10000;
y2 = FLASH.tele0043(:,2)/11.6e3;

figure(2)
hline1=line(x1,y1,'LineWidth',4);
ax1 = gca; % current axes
%ax1.XColor = 'b';
%ax1.YColor = 'b';
%ax1.YAxisLocation='left';
ax1.YScale='log';
ax1_pos = ax1.Position; % position of first axes
ax2 = axes('Position',ax1_pos,...
    'XAxisLocation','top',...
    'YAxisLocation','right',...
    'Color','none',...
    'YScale','log');
%hold on;
hline2=line(x2,y2,'Parent',ax2,'Color','k');
