%fit longitutal to get a scale length

filename='/Users/centerforenergyresearch/Downloads/FLASH4.3/results/SIWolfgang/FilamentationEP15Aedens1.5ns.curve';
[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=[denex0x, denex0y];

%get the data in the interest area.
IRq=[1e20,2.75e20];
IRcr=[6e20, 1.1e21];
UVq=[1e21,2.5e21];
UVcr=[6e21,1.1e22];
deneslimit=IRq;
[densmax,peak]=max(denex0);
denex0=denex0(1:peak(2),:);

filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1)-0.4,filteddene(:,2),'exp1') %0.4 is the surface position of the target
figure; semilogy( denex0(:,1)-0.4, denex0(:,2));
hold on;
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=IRcr;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1)-0.4,filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=UVq;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1)-0.4,filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

deneslimit=UVcr;
filteddene=denex0(denex0(:,2)>deneslimit(1) & denex0(:, 2)<deneslimit(2), :); 

f1=fit(filteddene(:,1)-0.4,filteddene(:,2),'exp1') %0.4 is the surface position of the target
plot(f1);
disp(deneslimit)
scale=1/f1.b*10000 %um
n0=f1.a

