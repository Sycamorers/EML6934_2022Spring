%initial states, lx stands for lambda_x, ly stands for lambda_y, lv stands
%for lambda_v, 
clear 
clc

t0 = 0;
x0 = 0; %given known parameter
y0 = 0; %given known parameter
v0 = 0; %given known parameter

lx0 = 0; % unknwon and guess
ly0 = 0; % unknwon and guess
lv0 = 0; % unknwon and guess

tf = 1; % unknwon and guess

xf = 2; %given known parameter
yf = 2; %given known parameter
lvf= 0; %known terminal state from TC
Hf= -1; %known terminal state from TC

z = [lx0, ly0, lv0, tf];


options = optimset('display','Iter','TolX', 1e-8, 'TolFun', 1e-8);
%[lx, ly, lv ,tf]
z = fsolve(@ErrorBrachistochrone, z, options, x0, y0, v0, xf, yf, lvf, Hf, t0);
[E, t, p] = ErrorBrachistochrone(z, x0, y0, v0, xf, yf, lvf, Hf, t0 ) ;
% plotting
figure(1)
hold on
plot(p(:,1),p(:,2),'--mo');
set(gca,'YDir','reverse')
title('Brachistochrone Trajectory','FontSize',18)
xlabel('x','FontSize',16)
ylabel('y','FontSize',16)
figure(2)
plot(t,p(:,1),'--mo');
hold on 
plot(t,p(:,2),'--bo');
hold on
plot(t,p(:,3),'--go');
legend('x(t)','y(t)','v(t)')
xlabel('time','FontSize',16)
title('Brachistochrone States','FontSize',18)


th = zeros(length(t),1);
options1 = optimset('display','Off','TolX', 1e-8, 'TolFun', 1e-8);
thguess = 0;
for i = 1:length(t)
th(i) = fsolve(@solveControl, thguess, options1, p(i,4), p(i,5), p(i,6), p(i,3), 10);
end
figure(3)
plot(t,th,'--mo')
legend('\theta')
xlabel('time','FontSize',16)
ylabel('\theta','FontSize',16)
title('Brachistochrone input \theta','FontSize',18)