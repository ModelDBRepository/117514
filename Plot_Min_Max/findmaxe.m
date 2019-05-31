function [z,w] = findmaxe(thl,thu,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);

options=optimset('Display','off','GradObj','on','LargeScale','off');%,'TolX',1e-3);
[z,w]=fminbnd(@findme,thl,thu,options);

%	    function y=findme(t);
	    function [y,G]=findme(t);
		y=-rtccomaxe(t,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
		G=-rtccomaxet(t,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	    end
end