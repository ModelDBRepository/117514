function [z,w] = findmaxi(thl,thu,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);

options=optimset('Display','off','GradObj','on','LargeScale','off');%,'TolX',1e-3);
[z,w]=fminbnd(@findmi,thl,thu,options);

%	    function y=findmi(t);
	    function [y,G]=findmi(t);
		y=-rtccomaxi(t,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
		G=-rtccomaxit(t,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	    end
end