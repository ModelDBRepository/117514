
%blapar=('S_{EI}=S_{II}');

strtop=['{\bf RTC for the linear coupled model}'];
strmed=['   '];
strbot=[...
'\nu=',num2str(nu),...
', \alpha=',num2str(alpha),...
', \beta=',num2str(beta),...
', \tau_{LGN} =',num2str(T),...
', \sigma_{LGN}=',num2str(sigma),...
', \tau_E=',num2str(taue),...
', \sigma_E=',num2str(ae),...
', \tau_I=',num2str(taui),...
', \sigma_I=',num2str(ai),...
', s_{EE}=',num2str(see),...
', s_{EI}=',num2str(sei),...
', s_{IE}=',num2str(sie),...
', s_{II}=',num2str(sii)...
];

figure(1)
plot(paramt,mine(:,1),'k','LineWidth',2);
xlabel(blapar);
ylabel('t_E');
title({strtop,strmed,strbot});

figure(2)
plot(paramt,mine(:,2),'k','LineWidth',2);
xlabel(blapar);
ylabel('\theta_E');
title({strtop,strmed,strbot});

figure(3)
plot(paramt,mvale,'k','LineWidth',2);
xlabel(blapar);
ylabel('M_{E,min}');
title({strtop,strmed,strbot});
	
figure(4)
plot(paramt,mini(:,1),'k','LineWidth',2);
xlabel(blapar);
ylabel('t_I');
title({strtop,strmed,strbot});

figure(5)
plot(paramt,mini(:,2),'k','LineWidth',2);
xlabel(blapar);
ylabel('\theta_I');
title({strtop,strmed,strbot});

figure(6)
plot(paramt,mvali,'k','LineWidth',2);
xlabel(blapar);
ylabel('M_{I,min}');
title({strtop,strmed,strbot});
	
