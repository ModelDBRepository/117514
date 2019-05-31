function b=phithree(t,nu,kone,ktwo,lone,ltwo,T,tauone,tautwo,gamma);

b=(T-tauone*gamma)*(T*(1+kone-ktwo)-tautwo*gamma)./(gamma+lone*T)...
./(gamma+ltwo*T).*(exp(-gamma*(nu+t)/T)-(t>=0).*exp(-gamma*t/T)).*(t>-nu);

