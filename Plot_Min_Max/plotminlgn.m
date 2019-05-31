clear all;
close all;

load datalgn1;
load datalgn1max;
%load Data/datalgn/datalgn;
%load Data/datalgn/datamaxlgn;

depths;

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
', s_{EE}=',num2str(see),...%', s_{EI}=',num2str(sei),...
', s_{IE}=',num2str(sie),...%', s_{II}=',num2str(sii)...
];
%n=1:M+1;
%r=1:M+1;
figure(10)
axes('fontsize',24);
%plot(paramt(n),bote(n),'k','LineWidth',4);
plot(paramt,bote,'k','LineWidth',4);
%axis([0.01 0.4 -0.3 -0.001]);
hold
plot(paramt,boti,'k --','LineWidth',4);
%plot(paramt(r),boti(r),'k --','LineWidth',4);
xlabel({'\fontname{times}\fontsize{34}\it \sigma_{lgn}'});
ylabel('\Delta{\it M}/{\it M}_{max}','fontname','times', 'fontsize', 34);
%ylabel('[{\it M}({\it t}_{min},\theta_{min})-{\it M}({\it t}_{min},\pi/2)]/{\it M}_{max}',...
%'fontname','times', 'fontsize', 34);
%title({strtop,strmed,strbot});
legend('\fontname{times}\fontsize{34}{\it M_E}',...
'\fontname{times}\fontsize{34}{\it M_I}','Location','SouthEast');
%hold off
clear all;
load datalgn2;
load datalgn2max;
depths;
figure(10);
plot(paramt,bote,'k','LineWidth',4);
plot(paramt,boti,'k --','LineWidth',4);
axis([0 0.4 -0.3 0]);