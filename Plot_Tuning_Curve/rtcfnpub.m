%This is a code that computes the
%cartoon RTC function in a linear
%coupled network, with given coupling
%lengths.  This code was used in the 
%paper.

clear all;
close all;

%LGN kernel time delay
T=3;

%LGN kernel time parameters
alpha=4;
beta=1/2;

%LGN kernel width
sigma=0.15;

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
ae=0.4;
ai=0.2;

%RTC time slot
nu=10; %nu=50;

%time interval
tmin=-nu;
tmax=3*nu;

%time discretization
Nt=8;
dt=(tmax-tmin)/Nt;

%angle discretization
Nth=100;
dth=pi/2/Nth;

%number of fourier modes
N=100;


%time and angle grid
[t,th]=meshgrid(tmin:dt:tmax,-pi/2:dth:pi/2);

%initialize RTC function
Me=zeros(2*Nth+1,Nt+1);
Mi=zeros(2*Nth+1,Nt+1);
%counter
n=1;

%compute the RTC function
for kk=1:N
	%
	%the coupling coefficients
	kee=cee*kcoeff(ae,n);
	kie=cie*kcoeff(ae,n);
	kei=cei*kcoeff(ai,n);
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
figure(10);
axes('fontsize',24);
plot3(t,th,Me,'k','LineWidth',3);
axis tight;
xlabel('\it t','fontname','times', 'fontsize', 34);
ylabel('\theta','fontname','times', 'fontsize', 34);
zlabel('{\it M_E}','fontname','times', 'fontsize', 34);
stre=['RTC linear coupled model: '...
'\nu=',num2str(nu),', \alpha=',num2str(alpha), ...
', \beta=',num2str(beta),', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),', \tau_E=',num2str(taue),', \sigma_E=',num2str(ae)...
', s_{EE}=',num2str(see),', s_{EI}=',num2str(sei)];
%title(stre);

figure(11);
axes('fontsize',24);
plot3(t,th,Mi,'k','LineWidth',3);
axis tight;
xlabel('\it t','fontname','times', 'fontsize', 34);
ylabel('\theta','fontname','times', 'fontsize', 34);
zlabel('{\it M_I}','fontname','times', 'fontsize', 34);
stri=['RTC linear coupled model: '...
'\nu=',num2str(nu),', \alpha=',num2str(alpha), ...
', \beta=',num2str(beta),', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),', \tau_I=',num2str(taui),', \sigma_I=',num2str(ai)...
', s_{IE}=',num2str(sie),', s_{II}=',num2str(sii)];
%title(stri);



