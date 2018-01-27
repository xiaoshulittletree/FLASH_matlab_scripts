%------------------------------------------------------------------------
%                       Plot density map
%                       The same size to the AFR
%------------------------------------------------------------------------
%clc;
%clear all;
% close all;

%folder = '/Users/centerforenergyresearch/Downloads/';
folder = '/Users/centerforenergyresearch/Desktop/Sept.2/AFR/';
%folder = '/Users/centerforenergyresearch/Workspace/MagLIFEP/';

shot = '21702';
diag = 'afr2';
% diag = 'afr2';
% diag = 'pol';

filename = ['pixis_s',shot,'_',diag,'_4wp.hdf'];

Streak_array = hdfread([folder,filename],'/Streak_array', 'Index', {[1  1  1],[1  1  1],[2  2048  2048]});

%% Make linear and log arrays
fore = double(squeeze(Streak_array(1,:,:)));
back = double(squeeze(Streak_array(2,:,:)));
signal = fore-back;
signal(signal < 0) = 0;
% signal = signal./max(signal(:));
signallog = log10(signal);
% signalrot = imrotate(signal,1.75,'bilinear');

%% Create plotting axes
pixelpitch = 13.5; %um
mag = 7.62; %newest mag (afr1)
% mag = 12.27;
labx = 'Space (mm)';
laby = 'Space (mm)';
% labx = 'Pixels';
% laby = 'Pixels';

pixelsize = pixelpitch/mag;
axisx = -1023:1:1024;
axisx = axisx .* pixelsize ./ 1000;
axisy=1:1:2048;
[axisXX,axisYY]=meshgrid(axisx, axisy);
signal=F(axisXX, axisYY);
%signal(BW)=1000;
% axisy = axisx - 1.148;
% axisx = axisx - 1.827;
figure('Units','normalized','Position',[.1,.1,.35,.55]);
imagesc(axisx,axisx,signal);colorbar;
% imagesc(signal); colorbar;
axis xy; %here is to set y direction
axis image; % here is to set the axis as image, which means, the aspect ratio is [1 1 1]
%colormap(mycmap);
hold on;
% xlim([-.5 .5]); ylim([0 2]);
caxis([0 0.3.*max(signal(:))]);
set(gca,'Fontsize',20);
xlabel(labx,'Fontsize',20,'Fontweight','Bold');
ylabel(laby,'Fontsize',20,'Fontweight','Bold');
title(['AFR Image -- Shot : ',num2str(shot),' : ',num2str(diag)],'Fontsize',20,'Fontweight','Bold');

%% Save Data

save(['/Users/centerforenergyresearch/Desktop/Sept.2/AFR/',shot,'.mat'],'signal')
%%
Idnotknow=0;
if (Idontknow)
    Y=Y-4;
Y=-Y;
F=scatteredInterpolant(X,Y,Dene);
nx=1500;ny=1000;
x=linspace(min(X),max(X),nx);y=linspace(min(Y),max(Y),ny);
[XX,YY]=meshgrid(x,y);
MeshDene=F(XX,YY);
figure('Units','normalized','Position',[.1,.1,.35,.55]);
imagesc(x,y,log10(MeshDene));colorbar;axis xy;axis image;hold on;
set(gca,'Fontsize',20);
xlabel(labx,'Fontsize',20,'Fontweight','Bold');
ylabel(laby,'Fontsize',20,'Fontweight','Bold');
 
labx = 'Space (mm)';
laby = 'Space (mm)';

end