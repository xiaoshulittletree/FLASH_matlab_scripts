function FLASH=voltage(FLASH, numtime)
for j=0:numtime
    varname=['volt',num2str(j,'%04i')];
    elef=['elef',num2str(j,'%04i')];
    FLASH.(varname)=FLASH.(elef);
    for k=1:size(FLASH.(elef),1)-1
    FLASH.(varname)(k,2)= ...
        trapz(FLASH.(elef)(k:end,1),FLASH.(elef)(k:end,2));
    end
    FLASH.(varname)(end,2)=FLASH.(varname)(end-1,2);
    % because the electric filed is in the unit of dyne/e
    % So the voltage here is in the unit of dyne*cm/e
    % convertion is *6.25e11
end
end 