IRq=[1e20,5e20];
IRcr=[5e20, 2e21];
UVq=[2e21,3e21];
UVcr=[8e21,1.2e22];
deneslimit=IRcr;
filteddene=FLASH.eden0030(FLASH.eden0030(:,2)>deneslimit(1) & FLASH.eden0030(:,2)<deneslimit(2), :); 

f1=fit(filteddene(:,1),filteddene(:,2),'exp1') 
scale=(-1/f1.b*1e4)