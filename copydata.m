%copydata 
function FLASHout=copydata(var,FLASHin,FLASHout,i1,i2)

for i=i1:i2;
    FLASHout.([var,num2str(i,'%04i')])=FLASHin.([var,num2str(i,'%04i')]);
end
end
