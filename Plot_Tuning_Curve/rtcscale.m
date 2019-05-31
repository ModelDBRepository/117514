%This is a code that computes the
%scaling of the RTC function slices
%at fixed values of (delay) time

%close all;

%plot scaled RTC slices
figure(20);
axes('fontsize',24);
plot(th,Me(:,2)/Me(Nth,2),'k','LineWidth',3);
hold;
for k=3:Nt+1
	plot(th,Me(:,k)/Me(Nth+2,k),'k','LineWidth',3);
end
hold off;
xlabel('\theta','fontname','times', 'fontsize', 34);
ylabel('{\it M_E}','fontname','times', 'fontsize', 34);




