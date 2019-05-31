%This is a code that computes the
%fixed time slice for a 
%cartoon RTC function in a linear
%coupled network, with given coupling
%lengths.

clear all;

%LGN kernel time delay
T=3;

%LGN kernel time parameters
alpha=4;
beta=1/2;

%LGN kernel width
sigma=0.2;

%Cortical time delays
taue=0.2;
taui=0.5;

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
ae=0.2;
ai=ae/2.1;

%RTC time slot
nu=1;

%time interval
tmin=0;
tmax=4;

%time discretization
Nt=30;
dt=(tmax-tmin)/Nt;

%angle discretization
Nth=50;
dth=pi/2/Nth;

%number of fourier modes
N=100;

%fix the time
t=1;

%time and angle grid
th=-pi/2:dth:pi/2;

%initialize RTC function
Me=zeros(1,2*Nth+1);
Mi=zeros(1,2*Nth+1);
%counter
n=1;

%compute the RTC function
for kk=1:N
	%
	%the coupling coefficients
	kee=cee*kcoeff(ae,n);
	kie=cie*kcoeff(ai,n);
	kei=cei*kcoeff(ae,n);
	kii=cii*kcoeff(ai,n);
	%
	%auxiliary variables
	lambdae=(kee-1)/taue;
	lambdai=(kii-1)/taui;
	avglambda=(lambdae+lambdai)/2;
	difflambda=sqrt((lambdae-lambdai)^2/4+kei*kie/taue/taui);
	%
	%the two roots
	lone=avglambda+difflambda;
	ltwo=avglambda-difflambda;
	%
	%the input strengths
	f=fcoeff(sigma,n);
	%
	%the RTC fourier components
	MMe=2*f*T/taue/taui*real((aaa(t,nu,alpha,beta,taue,taui,T,kei,kii,lone,ltwo)...
	-aaa(t-nu,nu,alpha,beta,taue,taui,T,kei,kii,lone,ltwo))...
	.*exp(2*i*n*th));
	MMi=2*f*T/taue/taui*real((aaa(t,nu,alpha,beta,taui,taue,T,kie,kee,lone,ltwo)...
	-aaa(t-nu,nu,alpha,beta,taui,taue,T,kie,kee,lone,ltwo))...
	.*exp(2*i*n*th));
	%
	n=n+1;
	%
	%the RTC function partial sums
	Me=Me+MMe;
	Mi=Mi+MMi;
end;


%plot the RTC functions
figure(1);
plot(th,Me,'k');
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
plot(th,Mi,'k');
xlabel('t');
ylabel('\theta');
zlabel('M_I');
stri=['RTC linear coupled model: '...
'\nu=',num2str(nu),', \alpha=',num2str(alpha), ...
', \beta=',num2str(beta),', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),', \tau_I=',num2str(taui),', \sigma_I=',num2str(ai)...
', s_{IE}=',num2str(sie),', s_{II}=',num2str(sii)];
title(stri);



