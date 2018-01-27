
%% read data from hdf5 file FLASH output file
path='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/Jet/'

filename = [path 'PlasmaJethdf5_plt_cnt_0119'];

coord = hdf5read(filename,'coordinates'); %% coordinates of center of each block
coord = double(coord);
blksize = hdf5read(filename,'block size'); %%% sizes of each block
blksize = double(blksize);


%% get center coordinates of each cell and store them to x and y 16 cells in one block.


for j = 1:size(blksize,2)
    for i = 1: 16
        x(16*(j-1)+i) = coord(1,j) - blksize(1,j)/2 + i*blksize(1,j)/16 - blksize(1,j)/32;
        y(16*(j-1)+i) = coord(2,j) - blksize(2,j)/2 + i*blksize(2,j)/16 - blksize(2,j)/32;
    end
end


%% convert vector x and y to matrixes X and Y (to satisfy requirement of griddata)
X= zeros(16);
Y= zeros(16);
for j = 1:size(blksize,2)
    for i = 1:16
        X(i,16*(j-1)+1:16*j) = x(16*(j-1)+i);
        Y(:,16*(j-1)+i) = y(16*(j-1)+i);
    end
end


%% store X Y to vector x1 y1 (x1 y1 can be checked by compared to the visity output file in format of okc)
% only to check if the coordinates are extracted right.

%for i = 1:size(a,2)
%for j = 1:16
%b(16*(i-1)+j) = a(j,i);
%x1(16*(i-1)+j) = X(j,i);
%y1(16*(i-1)+j) = Y(j,i);
%end
%end

%% generate interpolation grid (grid size depend on the resolution of the data and your own choice) and generate xmin xmax ymin ymax for plot

xresolution=min(min(abs(-X(1:end-1,:)+X(2:end,:)))); % finest mash size in simulation
yresolution=min(min(abs(-Y(:,1:end-1)+Y(:,2:end)))); % finest mash size in simulation

xmin = min(coord(1,:) - blksize(1,:)/2);
xmax = max(coord(1,:) + blksize(1,:)/2);
ymin = min(coord(2,:) - blksize(2,:)/2);
ymax = max(coord(2,:) + blksize(2,:)/2);

xq = (xmin+xresolution/2:xresolution:xmax-xresolution/2);
yq = (ymin+yresolution/2:yresolution:ymax-yresolution/2);
yq = yq';



%% plot density map
A=zeros(16,16*size(blksize,2));
varname = 'dens'

a = hdf5read(filename,varname);
a = double(a);
for j = 1:size(blksize,2)
    for i = 1:16
        A(:,16*(j-1)+1:16*j) = a(:,:,1,j);
    end
end

vq = griddata(X,Y,A,xq,yq,'nearest');
figure;
imagesc([min(xq) max(xq)],[min(yq) max(yq)],vq);
set(gca,'Ydir','normal')
axis image
%% choose the variable to be plotted and change varname
nomore=1;
if nomore~=1
varname = 'targ'

a = hdf5read(filename,varname);
a = double(a);
for j = 1:size(blksize,2)
    for i = 1:16
        A(:,16*(j-1)+1:16*j) = a(:,:,1,j);
    end
end

vq = griddata(X,Y,A,xq,yq,'nearest');
figure;
imagesc([min(xq) max(xq)],[min(yq) max(yq)],vq);
set(gca,'Ydir','normal')
axis image
end

%% choose the variable to be plotted and change varname


