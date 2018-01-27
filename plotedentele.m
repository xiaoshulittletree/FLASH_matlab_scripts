%yyaxis left
figure1=figure(140);
%axes('YScale','log','YColor','r');

plot(FLASH.tele0030(:,1),FLASH.tele0030(:,2)/11.6e6,FLASH.tele0043(:,1),FLASH.tele0043(:,2)/11.6e6);
%yaxis right
%hold on
%plotyy(FLASH.eden0043(:,1),FLASH.eden0043(:,2),FLASH.tele0043(:,1),FLASH.tele0043(:,2));
%axes('YScale','linear');
f=expfit()