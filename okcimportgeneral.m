%name='/Users/centerforenergyresearch/Desktop/untitled folder/oct252.5dene/Oct252.5dene.';
interpolant=true;%whether to create gridded data.
%name='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/CuFoamOMEGA1821/0.9_nsokcfiles/CuFoam0.9ns.';
%name='/Users/centerforenergyresearch/Desktop/untitled folder/oct25_1.50/Oct25_1.5nsEdenTele.';
name='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/HotEScaleEp18A2kJwithB1/edenmap/eden2_0ns.';
visitname=[name, 'visit'];
blocks='1';
nblocks=0; % how many of the blocks
[blocks, nblocks]=textread(visitname, '%s %d', 1);
fid=fopen(visitname);

tline = fgets(fid);%head line
tline = fgets(fid);%get the first file path
tline(end)=[];
[nvar,nmesh,unknow]=textread(tline, '%d %d %d',1); %initiate
varname=textread(tline,'%s\n',nvar,'headerlines',1);
for i=1:nvar
    FLASH.(char(varname(i)))=zeros(nmesh*nblocks,1);
end
%begin to read files actually
for i=1:nblocks
     fdata=fopen(tline);
     for j=1:2*nvar+1
        line=fgetl(fdata);
     end
     temp=fscanf(fdata, '%f',[nvar, nmesh]);
     temp=temp';
     fclose(fdata);
     for k=1:nvar
        FLASH.(char(varname(k)))((i-1)*nmesh+1:i*nmesh,1)=temp(:,k);
     end
    tline = fgets(fid); %get the next file path
    tline(end)=[];
end


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

if(interpolant==1)
    nx=1000;
    ny=1000;
    X= linspace(min(FLASH.x), max(FLASH.x), nx);
    Y= linspace(min(FLASH.y), max(FLASH.y), ny);
    for k=4:nvar
        F=scatteredInterpolant(FLASH.x,FLASH.y,FLASH.(char(varname(k))));
        %X=0.00005:0.0001:0.05115;
        %Y=X;
        [XX, YY]=meshgrid(X,Y);
        FLASH.(['mesh_',char(varname(k))])=F(XX,YY);
        %mesh(X,Y,FLASH.(['mesh_',char(varname(k))]))
    end
end
convertnumber=false;
if(convertnumber)
    FLASH.mesh_CuNM=FLASH.mesh_targ.*FLASH.mesh_dens*6.02e23./63.5;
    FLASH.mesh_CHNM=FLASH.mesh_tar2.*FLASH.mesh_dens*6.02e23./6.5;
end


