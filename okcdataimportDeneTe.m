%name='/Users/centerforenergyresearch/Desktop/untitled folder/oct252.5dene/Oct252.5dene.';
name='/Users/centerforenergyresearch/Desktop/untitled folder/oct254.0dene/Oct254.0dene.'
%name='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/PreplasmaMar2016/PrePlasmaEdens/PrePlasma120mJEdens2.0.'

visitname=[name, 'visit'];
blocks='1';
nblocks=0;
[blocks, nblocks]=textread(visitname, '%s %d', 1);
fid=fopen(visitname);

tline = fgets(fid);%head line
tline = fgets(fid);
tline(end)=[];
X=0; Y=0; Dene=0; Tele=0;
for i=1:nblocks
     filename = tline;
     [x, y, z, dene, tele]= textread(filename, '%f %f %f %f %f', 'headerlines', 11); 
     X=[X;x];
     Y=[Y;y];
     Dene=[Dene;dene];
     Tele=[Tele; tele];
    tline = fgets(fid);
    tline(end)=[];
end
X(1)=[];
Y(1)=[];
Dene(1)=[];
Tele(1)=[];

fclose(fid);

%%set the boundary for x=0.

%lineoutfile=[name,'curve'];
%[y,dene]=textread(lineoutfile, '%f %f', 'headerlines', 3);
%x=linspace(0,0,length(y))'; 
%X=[X;x];
%Y=[Y;y];
%Dene=[Dene;dene];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%for a symmetry%%%%%%%
%X=[X;-X];
%Y=[Y; Y];
%Dene=[Dene;Dene];
%Tele=[Tele; Tele];
%%%%%%%%%%%%%%%%%%%%%%

%X=X/100;
%Y=Y/100;


%F=scatteredInterpolant(X,Y,Dene);