%% script flashimport
%% remember to change varname, FLASH stuctrue name in input and output
%%
for i=31:56
    varname=['dens',num2str(i,'%04i')];
    filename=['/Users/centerforenergyresearch/Downloads/FLASH4.3/results/', ...
        'HotEScaleEP18A2kJwithB1/',varname(1:4),'/HotEScaleEP18A2kJwithB1_',varname,'.curve'];
    HotE18A2kJwB1=FLASHcurveread(HotE18A2kJwB1, varname, filename); %change input and output
end