%Computes (M_min-M_edge)/M_max
%Use this after you have loaded the data*** file with the 
%data for the minima, and the datamax*** file with the
%two vectors of maximal values for the same parameters

meedge=zeros(M+1,1);
miedge=zeros(M+1,1);
bote=zeros(M+1,1);
boti=zeros(M+1,1);

for jj=1:M+1
	%
	tthe=[mine(jj,1),pi/2];
	tthi=[mini(jj,1),pi/2];
	parm=paramt(jj);
	sigma=parm;
	%sei=parm;
	%sii=parm;
 	%cei=sei*(VI-1);
	%cii=sii*(VI-1);
	meedge(jj)=rtccome(tthe,N,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	miedge(jj)=rtccomi(tthi,N,ae,ai,sigma,cee,cie,cei,cii,taue,taui,T,alpha,beta,nu);
	%
end;
%
k=1:M+1;
%
bote(k)=(mvale(k)-meedge(k))./maxvale(k);
boti(k)=(mvali(k)-miedge(k))./maxvali(k);

