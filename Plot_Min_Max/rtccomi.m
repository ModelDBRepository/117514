function MMi=rtccomi(tth,k,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
%compute the RTC function
%
t=tth(1);
th=tth(2);
%
Mi=0;
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
Mi=Mi+2*f*T/taue/taui.*real((aaa(t,nu,alpha,beta,taui,taue,T,kie,kee,lone,ltwo)...
-aaa(t-nu,nu,alpha,beta,taui,taue,T,kie,kee,lone,ltwo)).*exp(2*i*n*th));
%
end;
MMi=Mi;

