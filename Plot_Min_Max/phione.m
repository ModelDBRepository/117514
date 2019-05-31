function b=phione(t,nu,kone,ktwo,lambda,mu,T,tauone,tautwo);

b=T*(1+tauone*lambda)./(lambda-mu).*(1+kone-ktwo+tautwo*lambda)...
.*(exp(lambda*(nu+t))-(t>=0).*exp(lambda*t)).*(t>-nu);