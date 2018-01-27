%rename file

for i=109:-1:0
    filename= ['CHCuSG24TLong_eden',num2str(i,'%04i'),'.curve'];
    movefile(filename, [filename(1:end-9),num2str(i+71,'%04i'),filename(end-6:end)]);
end
    