%fit longitutal to get a scale length
function []=ScaleExpfitOMEGA(FLASH,time,timestep)
varname=['eden',num2str(round(time/timestep),'%04d')];
%filename='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/Oct25/eden1_5ns.curve';
%[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=FLASH.(varname);
[M,Index]=max(denex0(:,2));
Index
denex0(1:Index,:)=[];

%get the data in the interest area.
IRq=[1e20,5e20];
IRcr=[5e20, 2e21];
UVq=[2e21,3e21];
UVcr=[5e21,1.1e22];
deneslimit=IRq;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1),filteddene(:,2),'exp1') %0.4 is the surface position of the target
figure; semilogy( denex0(:,1), denex0(:,2));
hold on;
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=IRcr;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1),filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=UVq;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1),filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=UVcr;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1),filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

