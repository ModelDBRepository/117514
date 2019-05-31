




clear all;
close all;




load datainh;

strtop=['{\bf RTC for the linear coupled model}'];
strmed=['   '];
strbot=[...
'\nu=',num2str(nu),...
', \alpha=',num2str(alpha),...
', \beta=',num2str(beta),...
', \tau_{LGN} =',num2str(T),...%', \sigma_{LGN}=',num2str(sigma),...
', \tau_E=',num2str(taue),...
', \sigma_E=',num2str(ae),...
', \tau_I=',num2str(taui),...
', \sigma_I=',num2str(ai),...
', s_{EE}=',num2str(see),...
', s_{EI}=',num2str(sei),...
', s_{IE}=',num2str(sie)...
', s_{II}=',num2str(sii)...
];


%paramtE=parmin:dpar:parmin+86*dpar;
%for k=1:87
%  mineE(k,1)=mine(k,1);
%end;

%paramtI=parmin:dpar:parmin+57*dpar;
%for k=1:58
%  miniI(k,1)=mini(k,1);
%end;

figure(1);
axes('fontsize',24);
plot(paramt,mine(:,2),'k','LineWidth',4);
axis([0.2 0.8 0.275 0.6]);
hold;
plot(paramt,mini(:,2),'-- k','LineWidth',4);
xlabel('\sigma_{\it I}','fontname','times', 'fontsize', 34);
ylabel('\theta_{min}','fontname','times', 'fontsize', 34);
legend('\fontname{times}\fontsize{34}\theta_{{\it E},min}',...
'\fontname{times}\fontsize{34}\theta_{{\it I},min}','Location','NorthWest');
%title({strtop,strmed,strbot});
