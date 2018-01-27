function FLASH=intrhodR(FLASH, numtime)
for j=0:numtime
    varname=['rhor',num2str(j,'%04i')];
    dens=['dens',num2str(j,'%04i')];
    FLASH.(varname)=FLASH.(dens);
    for k=1:size(FLASH.(dens),1)-1
    FLASH.(varname)(k,2)= ...
        trapz(FLASH.(dens)(k:end,1),FLASH.(dens)(k:end,2));
    end
    FLASH.(varname)(end,2)=FLASH.(varname)(end-1,2);
end
end 