%generate .par file laser
Beams=BeamsS1;
Beamnum=36;
OmegaBeamnum=60;
path='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/';

fID=fopen([path, 'CylindricalImplosion/CylindricalImplosionBeams.par'],'w');
k=0;
for i=1:OmegaBeamnum
    cellvalue=table2cell(Beams(i,11));
    if cellvalue{1}~=0
        k=k+1;
        for j=7:26
            varname=strcat(Beams.Properties.VariableNames(j),'_',num2str(k));
            cellvalue=table2cell(Beams(i,j));
            value=cellvalue{1};
            if ischar(value)
                fprintf(fID,[varname{1},'=',value,'\n']);
            elseif mod(value,1)==0
                fprintf(fID,[varname{1},'=','%d\n'],value);
            else
                fprintf(fID,[varname{1},'=','%.4f\n'],value);
            end
        end
    end
end