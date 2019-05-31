function [z,w] = findmine(th0,thl,thu,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);

%options=optimset('Display','off');
options=optimset('Display','off','GradObj','on','LargeScale','off');%,'TolX',1e-3);
[z,w]=fmincon(@findme,th0,[],[],[],[],thl,thu,[],options);
%[z,w]=fminunc(@findme,th0,options);
%[z,w]=fminsearch(@findme,th0,options);

%	    function y=findme(th);
	    function [y,G]=findme(th);
		y=rtccome(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
		G=[rtccomet(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu),...
			rtccometh(th,n,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu)];
	    end
end