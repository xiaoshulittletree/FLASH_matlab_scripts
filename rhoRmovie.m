%movie for flash lineoutsets
FLASH=CuOMEGA;
loops = 90;

figure(11)
i=0;
var1='rhor';
var2='tele';
xoffset=0;
x1=xoffset+FLASH.([var1,num2str(i,'%04i')])(:,1);
if (strcmp(var1, 'tele') || strcmp(var1,'tion') || strcmp(var1,'trad'))
    y1=FLASH.([var1,num2str(i,'%04i')])(:,2);
else
    y1=FLASH.([var1,num2str(i,'%04i')])(:,2)/1e5; %change cm/s to km/s
end

x2=xoffset+FLASH.([var2,num2str(i,'%04i')])(:,1);

if (strcmp(var2, 'tele') || strcmp(var2,'tion') || strcmp(var2,'trad'))
    y2=FLASH.([var2,num2str(i,'%04i')])(:,2)./11.6e3;
else
    y2=FLASH.([var2,num2str(i,'%04i')])(:,2);
end

hline1=plot(x1,y1,'LineWidth',2);
%surf(Z)
axis tight manual
ax1 = gca; %get current axes
ax1.YScale='linear';
ax1_pos = ax1.Position; % position of first axes
ax1.YLim=[0 0.4];
ax1.XLim=[0 0.02 ];
ax1.NextPlot = 'replaceChildren'; 
%after 2014b, it's OK, to use a dot to set properties. 
ax1.XAxisLocation='bottom';
ax1.YAxisLocation='left';
title('\rho R at 00.00 ns');
xlabel('Radial Position, r (cm)');
%ylabel('Temperature (eV)')
ylabel('\rho R (g/cm^2)')
ax1.FontSize=14;

%legend('Electron Temperautre');
F(loops) = struct('cdata',[],'colormap',[]);
for j = 1:loops
x1=xoffset+FLASH.([var1,num2str(j,'%04i')])(:,1);
y1=FLASH.([var1,num2str(j,'%04i')])(:,2); %change unit
%x2=xoffset+FLASH.([var2,num2str(j,'%04i')])(:,1);
%y2=FLASH.([var2,num2str(j,'%04i')])(:,2)./11.6e3;
plot(ax1,x1,y1,  'LineWidth',2);
title(['\rho R at ',num2str(j*0.05,'%02.2f'),' ns']);
%legend('Electron Temperautre', 'Ion Temperature');

  %  drawnow
    F(j) = getframe(gcf);%use gcf to get whole figure frame. 
end
movie(F,1)
%movie(F,2)
%myVideo=VideoWrite('try.avi');
%Undefined function 'VideoWrite' for input arguments of type 'char'.
 
myVideo=VideoWriter(['CufoamOMEGA',var1,'.avi']);
myVideo.FrameRate = 10;  % Default 30
myVideo.Quality = 75;    % Default 75
open(myVideo);
writeVideo(myVideo, F);
close(myVideo)