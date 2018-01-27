%Cu K alpha opacity correction

r=214;x=0:250;h0=8; %unit µm
rho0=6.5; %original Cu density in B cusputtered 6.5 g/cc
r0=214; %original Cu layer center radius. 210-218
h=8; % h can change with time.
totalxray=zeros(1,length(x)); %for time integral

for r=167:202
rho=(h0/h)*rho0*(r0/r).^2;

kv=0.005007; %opacity=exp(-kv*rho(g/cc)*thickness(µm)))
thickness=zeros(1, length(x));

thickness(x<r)=2*(sqrt((r+h)^2-x(x<r).^2)-sqrt(r.^2-x(x<r).^2));
thickness(x>=r & x<r+h)=2*sqrt((r+h).^2-x(x>=r & x<r+h).^2);
%this opacity is from Charlie's paper(Page 103, eq. 3.16)
opacity=1./(kv*rho*thickness).*(1-exp(-kv*rho*thickness));
opacity(isnan(opacity))=1;
%So the signal divided by opacity is the total emission.
%Still need to consider the emission thickness?
%thickness times opacity is the final x-ray image?
xray=rho*thickness.*opacity;
totalxray=totalxray+xray;
end

%hold on;
%plot(xray);
%totalxray=totalxray-xray;