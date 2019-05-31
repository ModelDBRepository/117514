function b=fthree(t,nu,kone,ktwo,lone,ltwo,T,tauone,tautwo,gamma);

b=(T-tauone*gamma)*(T*(1+kone-ktwo)-tautwo*gamma)./(gamma+lone*T)...
./(gamma+ltwo*T).*((t>=0).*exp(-gamma*t/T)+(t<0)-exp(-gamma*(nu+t)/T))*T/gamma.*(t>-nu);

