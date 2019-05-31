function [z,w] = findmini(th0,thl,thu,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);

%options=optimset('Display','off');
options=optimset('Display','off','GradObj','on','LargeScale','off');%,'TolX',1e-3);
[z,w] =fmincon(@findmi,th0,[],[],[],[],thl,thu,[],options);
%[z,w] =fminunc(@findmi,th0,options);
%[z,w] =fminsearch(@findmi,th0,options);

%	    function y=findmi(th);
	    function [y,G]=findmi(th);
		y=rtccomi(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
		G=[rtccomit(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu),...
			rtccomith(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu)];
	    end
end