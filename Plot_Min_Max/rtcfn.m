%This is a code that computes the
%cartoon RTC function in a linear
%coupled network, with given coupling
%lengths. It also computes all
%the partial derivatives on all the
%parameters

clear all;

%LGN kernel time delay
T=3;

%LGN kernel time parameters
alpha=4;
beta=1/2;

%LGN kernel width
sigma=0.3;

%Cortical time delays
taue=0.2;
taui=0.8;

%Cortical coupling constants 
see=0.8;
sei=7.6;
sie=1.5;
sii=sei;

%cortical reversal and threshold potentials
VE=14/3;
VI=-2/3;
VT=1;

%Coupling constants in the linear model
cee=see*(VE-1);
cei=sei*(VI-1);
cie=sie*(VE-1);
cii=sii*(VI-1);

%Cortical kernel widths
ae=0.3;
ai=0.2;

%RTC time slot
nu=1;

%time interval
tmin=-1;
tmax=4;

%time discretization
Nt=10;
dt=(tmax-tmin)/Nt;

%angle discretization
Nth=50;
dth=pi/2/Nth;

%number of fourier modes
N=200;
%n=1:N;
n=N;

%initialize RTC function
Me=zeros(2*Nth+1,Nt+1);
Mi=zeros(2*Nth+1,Nt+1);
%initialize RTC partials
Met=zeros(2*Nth+1,Nt+1);
Mit=zeros(2*Nth+1,Nt+1);
Meth=zeros(2*Nth+1,Nt+1);
Mith=zeros(2*Nth+1,Nt+1);



%compute the RTC functions
for ii=1:2*Nth+1
for jj=1:Nt+1
	%
	tt=tmin+(jj-1)*dt;
	thh=-pi/2+(ii-1)*dth;
	%
	tth=[tt, thh];
	%
	%the RTC functions
	%
	Me(ii,jj)=rtccome(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
	Mi(ii,jj)=rtccomi(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
	%the RTC drivatives 
	%
	Met(ii,jj)=rtccomet(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
	Meth(ii,jj)=rtccometh(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
	Mit(ii,jj)=rtccomit(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
	Mith(ii,jj)=rtccomith(tth,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
end;
end;

%time and angle grid
[t,th]=meshgrid(tmin:dt:tmax,-pi/2:dth:pi/2);

%plot the RTC functions
figure(1);
plot3(t,th,Me,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_E');
stre=['RTC linear coupled model: '...
'\nu=',num2str(nu),', \alpha=',num2str(alpha), ...
', \beta=',num2str(beta),', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),', \tau_E=',num2str(taue),', \sigma_E=',num2str(ae)...
', s_{EE}=',num2str(see),', s_{EI}=',num2str(sei)];
title(stre);

figure(2);
plot3(t,th,Met,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_{E,t}');
title(stre);

figure(3);
plot3(t,th,Meth,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_{E,\theta}');
title(stre);

figure(4);
plot3(t,th,Mi,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_I');
stri=['RTC linear coupled model: '...
'\nu=',num2str(nu),', \alpha=',num2str(alpha), ...
', \beta=',num2str(beta),', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),', \tau_I=',num2str(taui),', \sigma_I=',num2str(ai)...
', s_{IE}=',num2str(sie),', s_{II}=',num2str(sii)];
title(stri);

figure(5);
plot3(t,th,Mit,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_{I,t}');
title(stri);

figure(6);
plot3(t,th,Mith,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_{I,\theta}');
title(stri);



