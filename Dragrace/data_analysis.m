clear
clc
close all

%Simulation Settings
t_final=10;
t_step=0.001;

%run simulation & ectract data
out=sim('dragrace').get('S_v');
t=out.Time;
v=out.Data(:,2);
S=out.Data(:,1);

%plotting S
subplot(2,1,1);
plot(t,S);
grid on
axis([0 t_final 0 0.5]);
xlabel('t(s)');
ylabel('S(km)');
% l1=legend('S(km)');
% l1.FontSize = 12;

subplot(2,1,2); 
hold on;
plot(t,v);
grid on
axis([0 t_final 0 200]);
xlabel('t(s)');
ylabel('v(kph)');

%Determining acceleration time
Tvar=[0 t_final];
V1=[50 50];
V2=[100 100];
V3=[130 130];
[t1,v1]=polyxpoly(t,v,Tvar,V1);

[t2,v2]=polyxpoly(t,v,Tvar,V2);

[t3,v3]=polyxpoly(t,v,Tvar,V3);

plot(t1,v1,'rx',t2,v2,'gx',t3,v3,'bx');

str1=['t=' num2str(t1) 's'];
str2=['t=' num2str(t2) 's'];
str3=['t=' num2str(t3) 's'];
text(t1+0.5,v1,[str1]);
text(t2+0.5,v2,[str2]);
text(t3+0.5,v3,[str3]);

% l2=legend('v(kph)');
% l2.FontSize = 12;
%printing fig
fig=gcf;
fig.PaperUnits='centimeters';
fig.PaperPosition=[0 0 16 16];
fig.PaperSize=[16 16];
saveas(fig, 'S(km) and v(kph)','pdf');