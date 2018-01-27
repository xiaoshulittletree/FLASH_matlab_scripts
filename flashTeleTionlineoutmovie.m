%movie for flash lineoutsets
figure(5)
i=0;
var1='tele';
var2='tion'
x1=0.4608-FLASH.([var1,num2str(i,'%04i')])(:,1);
y1=FLASH.([var1,num2str(i,'%04i')])(:,2)./11.6e3;
x2=0.4608-FLASH.([var2,num2str(i,'%04i')])(:,1);
y2=FLASH.([var2,num2str(i,'%04i')])(:,2)./11.6e3;
hline1=plot(x1,y1,x2,y2,'LineWidth',1);
%surf(Z)
axis tight manual
ax1 = gca; %get current axes
ax1.YScale='log';
ax1_pos = ax1.Position; % position of first axes
ax1.YLim=[1 10000];
ax1.NextPlot = 'replaceChildren'; 
%after 2014b, it's OK, to use a dot to set properties. 
ax1.XAxisLocation='bottom';
ax1.YAxisLocation='left';
title('Axial Electron and Ion Temperature at 0.00 ns');
xlabel('Position (cm)');
ylabel('Temperature (eV)')
legend('Electron Temperautre', 'Ion Temperature');
loops = 180;
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
x1=0.4608-FLASH.([var1,num2str(j,'%04i')])(:,1);
y1=FLASH.([var1,num2str(j,'%04i')])(:,2)./11.6e3;
x2=0.4608-FLASH.([var2,num2str(j,'%04i')])(:,1);
y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./11.6e3;
plot(ax1,x1,y1,x2,y2,  'LineWidth',1);
title(['Axial Electron and Ion Temperature at ',num2str(j*0.05,'%.2f'),' ns']);
legend('Electron Temperautre', 'Ion Temperature');

  %  drawnow
    F(j) = getframe(gcf);%use gcf to get whole figure frame. 
end
movie(F,1)
%movie(F,2)
%myVideo=VideoWrite('try.avi');
%Undefined function 'VideoWrite' for input arguments of type 'char'.
 
myVideo=VideoWriter(['Collisionless',var1,'.avi']);
myVideo.FrameRate = 10;  % Default 30
myVideo.Quality = 75;    % Default 75
open(myVideo);
writeVideo(myVideo, F);
close(myVideo)