clc
clear
syms c1 c2 
t0 = 0;
tf = 50;
x0 = c1*(2^0.5+1)*exp(-2^0.5*t0) + c2*(-2^0.5+1)*exp(2^0.5*t0);
xf = c1*(2^0.5+1)*exp(-2^0.5*tf) + c2*(-2^0.5+1)*exp(2^0.5*tf);
eqns = [x0==1,xf==1];
C = solve(eqns, [c1,c2]);
t = linspace(0,tf);
c1 = C.c1;
c2 = C.c2;
x = c1*(2^0.5+1)*exp(-2^0.5*t) + c2*(-2^0.5+1)*exp(2^0.5*t);
l = c1*exp(-2^0.5*t) + c2*exp(2^0.5*t);
plot(t, x,'--mo')
xlabel('time','FontSize',16)
ylabel('x','FontSize',16)
title('Hyper Sensitive Analytical Trajectory','FontSize',18)
figure()
plot(t, -l,'--mo') %u
xlabel('time','FontSize',16)
ylabel('u','FontSize',16)
title('Hyper Sensitive Analytical Input','FontSize',18)
