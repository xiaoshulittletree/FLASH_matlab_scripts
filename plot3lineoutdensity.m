%%plot the 3 axis lineout density profile at 1.5 2.5 4.0


filename='Oct251.52ns.curve';
[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=[denex0x, denex0y];

figure; 
semilogy( denex0(:,1)-0.4, denex0(:,2));
hold on;
%read the 1.5ns curve
filename='Oct252.5dene.curve'; 
[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=[denex0x, denex0y];
%plot 1.5ns density profile
semilogy( denex0(:,1)-0.4, denex0(:,2));
%read the 2.5ns density profile
filename='Oct254.0dene.curve';
[denex0x,denex0y]=textread(filename, '%f %f', 'headerlines', 3);
denex0=[denex0x, denex0y];
%plot 2.5ns density profile
semilogy( denex0(:,1)-0.4, denex0(:,2));

