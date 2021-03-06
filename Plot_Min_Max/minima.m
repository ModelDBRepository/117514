%This piece of the code computes the 
%locations of the minima/maxima
%of the RTC function as a function
%of one system parameter
%which you can choose

clear all;

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
sii=7.6;

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
ai=0.4;

%RTC time slot
nu=1;

%number of fourier modes
N=100;

%search region

%minimal time
tlow=-0.5;
%maximal time
tupp=0.9;
%minimal angle
thlow=0.001;
%maximal angle
thupp=0.9;
%auxiliary variables
thl=[tlow, thlow];
thu=[tupp, thupp];

%initial guess for time
te=0.3;
ti=0.3;

%initial guess for theta
the=0.2;
thi=0.2;

%initial conditions
tthe=[te,the];
tthi=[ti,thi];

%parameter interval
parmin=0.03;
parmax=0.8;

%number of points
M=30;

%stepsize
dpar=(parmax-parmin)/M;

mine=zeros(M+1,2);
mvale=zeros(M+1,1);
mini=zeros(M+1,2);
mvali=zeros(M+1,1);

%parm=parmin;
parm=parmax;

for l=1:M+1
%for l=M+1:-1:1;
	%This line sets the parameter to be varied
	
	%ai=parm;
	sigma=parm;
	%taui=parm;
	%sei=parm;
	%sii=parm;
 	%cei=sei*(VI-1);
	%cii=sii*(VI-1);

	%if you are computing a maximum, change the sign in findmine(i)
	[mine(l,:), mvale(l)]=findmine(tthe,thl,thu,N,ae,ai,sigma,...
		cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);

	[mini(l,:), mvali(l)]=findmini(tthi,thl,thu,N,ae,ai,sigma,...
		cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	
	tthe=mine(l,:);
	tthi=mini(l,:);
	
	parm=parm-dpar;
	
end;

paramt=parmin:dpar:parmax;


blapar='\sigma_{lgn}';
%blapar='S_{EI}=S_{II}';


strtop=['{\bf RTC for the linear coupled model}'];
strmed=['   '];
strbot=[...
'\nu=',num2str(nu),...
', \alpha=',num2str(alpha),...
', \beta=',num2str(beta),...
', \tau_{LGN} =',num2str(T),...%', \sigma_{LGN}=',num2str(sigma),...
', \tau_E=',num2str(taue),...
', \sigma_E=',num2str(ae),...
', \tau_I=',num2str(taui),...
', \sigma_I=',num2str(ai),...
', s_{EE}=',num2str(see),...
', s_{EI}=',num2str(sei),...
', s_{IE}=',num2str(sie)...
', s_{II}=',num2str(sii)...
];

figure(1)
plot(paramt,mine(:,1),'k','LineWidth',2);
xlabel(blapar);
ylabel('t_E');
title({strtop,strmed,strbot});

figure(2)
plot(paramt,mine(:,2),'k','LineWidth',2);
xlabel(blapar);
ylabel('\theta_E');
title({strtop,strmed,strbot});

figure(3)
plot(paramt,mvale,'k','LineWidth',2);
xlabel(blapar);
ylabel('M_{E,min}');
title({strtop,strmed,strbot});
	
figure(4)
plot(paramt,mini(:,1),'k','LineWidth',2);
xlabel(blapar);
ylabel('t_I');
title({strtop,strmed,strbot});

figure(5)
plot(paramt,mini(:,2),'k','LineWidth',2);
xlabel(blapar);
ylabel('\theta_I');
title({strtop,strmed,strbot});

figure(6)
plot(paramt,mvali,'k','LineWidth',2);
xlabel(blapar);
ylabel('M_{I,min}');
title({strtop,strmed,strbot});
	
