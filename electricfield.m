% electron field because of the electron pressure

function FLASH=electricfield(FLASH, numtime)
for j=0:numtime
    elef=['elef',num2str(j,'%04i')];
    eden=['eden',num2str(j,'%04i')];
    pres=['pres',num2str(j,'%04i')];
    FLASH.(elef)=FLASH.(pres);
    gradpres=gradient(FLASH.(pres)(:,2))./gradient(FLASH.(pres)(:,1)); 
    %*10 is the unit convertor from dyne/cm^3 to N/m^3
    FLASH.(elef)(:,2)=-gradpres./FLASH.(eden)(:,2); %unit is dyne/e
end
end 