function MMet=rtccomaxet(t,k,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
%compute the t-derivative of the RTC function
%
th=0;
%
Met=0;
%
for n=1:k
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
difflambda=sqrt((lambdae-lambdai).^2/4+kei.*kie/taue/taui);
%
%the two roots
lone=avglambda+difflambda;
ltwo=avglambda-difflambda;
%
%the input strengths
f=fcoeff(sigma,n);
%
%the RTC fourier components
Met=Met+2*f*T/taue/taui.*real((aat(t,nu,alpha,beta,taue,taui,T,kei,kii,lone,ltwo)...
-aat(t-nu,nu,alpha,beta,taue,taui,T,kei,kii,lone,ltwo)).*exp(2*i*n*th));
%
end;
MMet=Met;

