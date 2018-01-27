%velocity calculation, velo=sqrt(velx^2+vely^2)
for i=0:90;
    veloname=['velo',num2str(i,'%04i')];
    velxname=['velx',veloname(end-3:end)];
    velyname=['vely',veloname(end-3:end)];
    %filename=['/Users/centerforenergyresearch/Downloads/FLASH4.3/results/', ...
    %    'CuFoamOMEGA1821/',varname(1:4),'/CuFoam1821_',varname,'.curve'];
    %CuFoam1821=FLASHcurveread(CuFoam1821, varname, filename);
    CHCuCH1821.(veloname)=CHCuCH1821.(velxname);
    CHCuCH1821.(veloname)(:,2)= ...
        sqrt(CHCuCH1821.(velxname)(:,2).^2+ ...
        CHCuCH1821.(velyname)(:,2).^2);
end 