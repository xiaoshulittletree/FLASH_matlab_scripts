x=-1000:1000;
y=x;
[XX,YY]=meshgrid(x,y);
Rx=370;
Ry=Rx;
R95=410;
n=5;
Intensity=exp(-((((XX/Rx).^2)+(YY/Ry).^2).^(n/2)));
%Intensity2=exp(-2*((((XX/Rx).^2)+(YY/Ry).^2).^(n/2)));
%contour(Intensity);
%hold on; contour(Intensity2);
%hold off;
mask90=(Intensity>0.9);
I90=sum(sum(Intensity(mask90)))./sum(sum(mask90));
mask20=(Intensity<0.2);
maskr=(sqrt(XX.^2+YY.^2)<R95);
energyinr=sum(sum(Intensity(maskr)))/sum(sum(Intensity))
quit cancel;
Intensityarray=reshape(Intensity,[size(Intensity,1)*(size(Intensity,2)),1]);
Intensityarray=sort(Intensityarray);
energyarray=zeros(size(Intensityarray));
totalenergy=(sum(Intensityarray));

%for i=1:size(Intensityarray)-1
%    energyarray(i)=totalenergy-sum(Intensityarray(i+1:end));
%end
energyarray(end)=totalenergy;
%figure(100);
%plot(Intensityarray, energyarray);
